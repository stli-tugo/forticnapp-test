import sqlite3

from flask import Flask, request

app = Flask(__name__)


@app.route("/user")
def get_user():
    username = request.args.get("username")
    conn = sqlite3.connect("app.db")
    cursor = conn.cursor()
    # Deliberately insecure: user input concatenated into SQL (SQL injection)
    cursor.execute("SELECT * FROM users WHERE username = '" + username + "'")
    return str(cursor.fetchall())
