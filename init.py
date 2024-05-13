# __init__.py for the Netflix Database Module

import sqlite3
import csv

def connect_db():
    """Establishes a connection to the Netflix database."""
    conn = sqlite3.connect('netflix.db')
    return conn

def create_table():
    """Creates the Netflix titles table if it doesn't already exist."""
    conn = connect_db()
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
    conn.close()

def import_data(csv_file):
    """Imports data from a CSV file into the Netflix titles table."""
    conn = connect_db()
    c = conn.cursor()
    with open(csv_file, 'r', encoding='utf-8') as file:
        csv_reader = csv.reader(file)
        next(csv_reader)  # Skip the header row
        for row in csv_reader:
            c.execute('''
            INSERT OR IGNORE INTO netflix_titles (show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ''', row)
    conn.commit()
    conn.close()

def query_titles(query):
    """Executes a given SQL query against the Netflix titles table and returns the results."""
    conn = connect_db()
    c = conn.cursor()
    c.execute(query)
    results = c.fetchall()
    conn.close()
    return results

# Setup the database and table on module import
create_table()
