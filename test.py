from db_connection import get_db_connection

db = get_db_connection()

if db and db.is_connected():
    print("✅ Success! Python is now connected to your MySQL database.")
    db.close()
else:
    print("❌ Failed! MySQL server is not responding.")