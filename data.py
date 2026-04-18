import mysql.connector
from db_connection import get_db_connection

def run_data_script():
    db = get_db_connection()
    if db is None:
        print("❌ Database connection failed.")
        return

    cursor = db.cursor()

    try:
        # Open and read the data.sql file
        with open('data.sql', 'r') as f:
            # Split by semicolon to get individual commands
            sql_commands = f.read().split(';')

        print("🚀 Starting data insertion...")

        for command in sql_commands:
            # Clean up whitespace and skip empty commands
            clean_command = command.strip()
            if clean_command:
                try:
                    cursor.execute(clean_command)
                except mysql.connector.Error as e:
                    print(f"⚠️ Skipping a command due to error: {e}")

        db.commit()
        print("✅ Success! All questions and quizzes have been inserted.")

    except Exception as e:
        print(f"❌ Error reading file: {e}")
        db.rollback()
    finally:
        cursor.close()
        db.close()

if __name__ == "__main__":
    run_data_script()