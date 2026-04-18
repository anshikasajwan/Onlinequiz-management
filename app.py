import streamlit as st
from db_connection import get_db_connection

# Set Page Title and Icon
st.set_page_config(page_title="EduQuiz Portal", page_icon="🎓", layout="centered")

# --- Custom Styling ---
st.markdown("""
    <style>
    .main { background-color: #f5f7f9; }
    .stButton>button { width: 100%; border-radius: 5px; height: 3em; background-color: #007bff; color: white; }
    .stRadio > label { font-size: 20px; font-weight: bold; color: #1f1f1f; }
    </style>
    """, unsafe_allow_html=True)

# --- Session State Initialization ---
if 'logged_in' not in st.session_state:
    st.session_state.logged_in = False
if 'score' not in st.session_state:
    st.session_state.score = 0
if 'username' not in st.session_state:
    st.session_state.username = ""

# --- Database Helper Functions ---
def verify_login(u, p):
    db = get_db_connection()
    if db is None:
        return None
    cursor = db.cursor(dictionary=True) # Use dictionary=True to make it reliable
    cursor.execute("SELECT user_id, username, role FROM Users WHERE username=%s AND password=%s", (u, p))
    user = cursor.fetchone()
    db.close()
    return user 

# --- UI PAGES ---

def login_page():
    st.title("🔐 Student Login")
    with st.container():
        username = st.text_input("Username")
        password = st.text_input("Password", type="password")
        if st.button("Login"):
            user = verify_login(username, password)
            if user:
                # Store data using dictionary keys for total safety
                st.session_state.logged_in = True
                st.session_state.username = user['username']
                st.session_state.user_id = user['user_id']
                st.rerun()
            else:
                st.error("Invalid credentials. Please try again.")

def quiz_interface():
    # Sidebar Navigation
    st.sidebar.title(f"Welcome, {st.session_state.username}")
    
    # 1. FIX: Make sure these labels match the selectbox EXACTLY
    subject = st.sidebar.selectbox("Select Subject", ["DBMS Quiz", "Python Programming Quiz", "Operating Systems Quiz", "COA Quiz", "Computer Networks Quiz"])
    
    subject_map = {
        "DBMS Quiz": 1, 
        "Python Programming Quiz": 2, 
        "Operating Systems Quiz": 3, 
        "COA Quiz": 4, 
        "Computer Networks Quiz": 5
    }

    # 2. FIX: Extract the quiz_id from the map
    quiz_id = subject_map[subject]

    st.title(f"📝 {subject}")
    st.info("Each question carries 5 marks. Good luck!")

    db = get_db_connection()
    if db is None:
        st.error("Database connection failed.")
        return

    cursor = db.cursor(dictionary=True)
    
    # Fetch Questions
    cursor.execute("SELECT * FROM Questions WHERE quiz_id = %s", (quiz_id,))
    questions = cursor.fetchall()

    if not questions:
        st.warning("No questions found for this quiz ID in the database.")

    # UI for Questions
    for i, q in enumerate(questions):
        # Using a unique key for expanders is safer
        with st.expander(f"Question {i+1}", expanded=True):
            st.write(f"### {q['question_text']}")
            
            # Fetch Options for this specific question
            cursor.execute("SELECT option_text FROM Options WHERE question_id = %s", (q['question_id'],))
            options = [opt['option_text'] for opt in cursor.fetchall()]
            
            # Ensure radio key is unique
            user_choice = st.radio("Choose the correct option:", options, key=f"user_q_{q['question_id']}")

            if st.button("Submit Choice", key=f"btn_{q['question_id']}"):
                if user_choice == q['correct_option']:
                    st.success("Correct!")
                    st.session_state.score += 5
                else:
                    st.error(f"Wrong! Correct answer: {q['correct_option']}")

    st.divider() # Adds a clean line before the finish button

    if st.button("🏁 Finish & Save Result"):
        cursor.execute("INSERT INTO Results (user_id, quiz_id, score) VALUES (%s, %s, %s)", 
                       (st.session_state.user_id, quiz_id, st.session_state.score))
        db.commit()
        st.balloons()
        st.success(f"Final Score Saved: {st.session_state.score}/100")
        st.session_state.score = 0 # Reset for next quiz
    
    db.close()
    if st.sidebar.button("Logout"):
        st.session_state.logged_in = False
        st.rerun()# ... (all your function definitions above)

# --- Main App Logic ---
try:
    if not st.session_state.logged_in:
        login_page()
    else:
        quiz_interface()
except Exception as e:
    st.error(f"An unexpected error occurred: {e}")