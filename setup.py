# setup.py for setting up the Netflix SQLite database

import sqlite3
import csv

def create_database():
    """Creates and connects to the SQLite database."""
    conn = sqlite3.connect('netflix.db')
    return conn

def create_table(conn):
    """Creates a table for storing Netflix data in the database."""
    c = conn.cursor()
    c.execute('''
    CREATE TABLE IF NOT EXISTS netflix_titles (
        show_id TEXT PRIMARY KEY,
        type TEXT,
        title TEXT,
        director TEXT,
        cast TEXT,
        country TEXT,
        date_added TEXT,
        release_year INTEGER,
        rating TEXT,
        duration TEXT,
        listed_in TEXT,
        description TEXT
    )
    ''')
    conn.commit()

def import_data(conn, csv_file):
    """Imports data from a CSV file into the database."""
    c = conn.cursor()
    with open(csv_file, 'r', encoding='utf-8') as file:
        csv_reader = csv.reader(file)
        next(csv_reader)  # Skip the header row
        c.executemany('''
        INSERT INTO netflix_titles (show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', (row for row in csv_reader))
    conn.commit()

def main():
    """Main function to set up the database and import data."""
    conn = create_database()
    create_table(conn)
    import_data(conn, 'netflix_titles.csv')  # Ensure the CSV file path is correct
    conn.close()
    print("Database setup complete and data imported successfully.")

if __name__ == '__main__':
    main()
