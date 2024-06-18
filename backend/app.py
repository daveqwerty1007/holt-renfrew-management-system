import mysql.connector

def connect_to_rds():
    connection = mysql.connector.connect(
        host='database-1.cbko6om64nur.us-east-1.rds.amazonaws.com',
        user='admin',
        password='1uSegPqoWCjIXc4199fs',
        database=''
    )
    return connection

if __name__ == "__main__":
    conn = connect_to_rds()
    if conn.is_connected():
        print("Connected to AWS RDS")
        conn.close()
        
def create_tables():
    connection = connect_to_rds()
    cursor = connection.cursor()
    with open('Setup.sql', 'r') as sql_file:
        result_iterator = cursor.execute(sql_file.read(), multi=True)
        for res in result_iterator:
            print("Running query: ", res)
            print(f"Affected {res.rowcount} rows" if res.rowcount >= 0 else "")
    connection.commit()
    cursor.close()
    connection.close()

if __name__ == "__main__":
    create_tables()
    print("Database tables created successfully")
