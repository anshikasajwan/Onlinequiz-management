import mysql.connector

def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host="127.0.0.1",
            user="root",
            password="",  
            database="online_quiz_db"
        )
        return connection
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None