## Project Description
The Netflix Titles dataset offers a detailed view of movies and TV shows available on Netflix. This includes information about the title type, director, cast, country of production, release year, rating, duration, genres, and brief descriptions. The dataset serves Netflix fans looking to find specific shows or movies, and it is maintained by Netflix as the administrator. The application provides functionalities to filter and retrieve detailed information about various titles.

## Setup and Installation
This package includes a Python script (`setup.py`) for setting up your local SQLite database environment, a sample data file (`netflix_titles.csv`), and a demonstration script (`code_example.py`) for basic database operations.

### Requirements
- Python 3.x
- SQLite3

### Initial Setup
1. **Clone or download this repository** to your local machine.
2. **Navigate to the project directory** where `setup.py` is located.

### Creating the Database
Run the `setup.py` script to create an SQLite database and import the data from `netflix_titles.csv`:

```bash
python3 setup.py
```

## Usage
### Basic Operations
Once the database is set up, you can run `code_example.py` to see examples of querying, updating, and deleting data:

```bash
python3 code_example.py
```

## Data Structure
The `netflix_titles.csv` file and the corresponding SQLite database contain the following columns:
- `show_id` (Primary Key)
- `type` (e.g., Movie, TV Show)
- `title`
- `director`
- `cast`
- `country`
- `date_added`
- `release_year`
- `rating`
- `duration`
- `listed_in` (genres)
- `description`
