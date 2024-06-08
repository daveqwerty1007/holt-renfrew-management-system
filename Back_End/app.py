from flask import Flask, jsonify
import mysql.connector
from mysql.connector import Error
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

def create_connection():
    connection = None
    try:
        connection = mysql.connector.connect(
            host="your-rds-endpoint",
            user="your-username",
            password="your-password",
            database="your-database-name"
        )
        print("Connection to MySQL DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")
    return connection

@app.route('/brands', methods=['GET'])
def get_brands():
    connection = create_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT * FROM brands")
    rows = cursor.fetchall()
    return jsonify(rows)

@app.route('/products', methods=['GET'])
def get_products():
    connection = create_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT * FROM products")
    rows = cursor.fetchall()
    return jsonify(rows)

if __name__ == "__main__":
    app.run(debug=True)
