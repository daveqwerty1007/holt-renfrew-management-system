# Import the SQLite library
import sqlite3

# Connect to a database (will create if not exists)
conn = sqlite3.connect('example.db')
c = conn.cursor()

# Create a new Table named 'greetings'
c.execute('''CREATE TABLE IF NOT EXISTS greetings
             (id INTEGER PRIMARY KEY, message TEXT)''')

# Insert a row of data
c.execute("INSERT INTO greetings (message) VALUES ('Hello, world!')")
c.execute("INSERT INTO greetings (message) VALUES ('Hello, Python!')")
c.execute("INSERT INTO greetings (message) VALUES ('Hello, SQLite!')")

# Save (commit) the changes
conn.commit()

# Query the database and return all data
c.execute('SELECT * FROM greetings')
for row in c.fetchall():
    print(row)

# Close the connection
conn.close()