import mysql.connector

def connect_to_rds():
    connection = mysql.connector.connect(
        host='database-2.cbko6om64nur.us-east-1.rds.amazonaws.com',
        user='admin',
        password='qajnaK-jezbo5-papdoz',
        database='database-2'
    )
    return connection

if __name__ == "__main__":
    conn = connect_to_rds()
    if conn.is_connected():
        print("Connected to AWS RDS")
        conn.close()