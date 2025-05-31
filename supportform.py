from flask import Flask, request, redirect, flash

app = Flask(__name__)
app.secret_key = 'your_secret_key_here'

import pyodbc
conn = pyodbc.connect("DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost\\SQLEXPRESS;DATABASE=gendercare;Trusted_Connection=yes;")
cursor = conn.cursor()

@app.route('/support', methods=['POST'])
def support():
    name = request.form.get('name')
    email = request.form.get('email')
    query = request.form.get('query')

    # Basic validation
    if not name or not email or not query:
        flash("All fields are required!")
        return redirect(request.referrer)

    try:
        cursor.execute("""
            INSERT INTO Support_Requests (user_name, email, message)
            VALUES (?, ?, ?)
        """, name, email, query)
        conn.commit()
        flash("Your support request has been submitted!")
    except Exception as e:
        flash(f"Error: {str(e)}")

    return redirect(request.referrer)
