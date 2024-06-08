# code_example.py - Basic operations on the Netflix SQLite database

import sqlite3

def connect_database():
    """Connects to the existing SQLite database."""
    return sqlite3.connect('netflix.db')

def query_data():
    """Queries for the first 10 movie titles and their release years."""
    conn = connect_database()
    cursor = conn.cursor()
    cursor.execute("SELECT title, release_year FROM netflix_titles WHERE type='Movie' LIMIT 10")
    movies = cursor.fetchall()
    conn.close()
    return movies

def update_data():
    """Updates the rating of a specific title."""
    conn = connect_database()
    cursor = conn.cursor()
    cursor.execute("UPDATE netflix_titles SET rating='PG-13' WHERE title='Example Movie Title'")
    conn.commit()
    conn.close()
    print("Data updated successfully.")

def delete_data():
    """Deletes an entry based on show_id."""
    conn = connect_database()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM netflix_titles WHERE show_id='s123'")
    conn.commit()
    conn.close()
    print("Data deleted successfully.")

def main():
    # Display some data
    movies = query_data()
    for movie in movies:
        print(f"Title: {movie[0]}, Release Year: {movie[1]}")

    # Update data example
    update_data()

    # Delete data example
    delete_data()

if __name__ == '__main__':
    main()
 