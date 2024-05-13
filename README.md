# Environment set-up
To use PostgreSQL features
please execute the following commands in the terminal in order.

####################################
#create conda environment
####################################

`conda create --name RnaQsl` #Evan is this a typo? RnaSql?

#enter the environment
conda activate RnaQsl

####################################
#install postgresql via conda
####################################

`conda install -y -c conda-forge postgresql`

####################################
#create a base database locally
####################################

`initdb -D mylocal_db`

##############################
#now start the server modus/instance of postgres
##############################

`pg_ctl -D mylocal_db -l logfile start`

##waiting for server to start.... done
##server started

#now the server is up

####################################
#create a non-superuser (more safety!)
####################################

`createuser --encrypted --pwprompt $username`
#asks for name and password

    please modify the  "username" and "password" in my code to match what you use 

####################################
#using this super user, create inner database inside the base database
####################################

`createdb --owner="username" myinner_db`

## made a new version of README
## please check

# Project Overview
This project involves working with SQLite databases and involves the analysis of Netflix titles data.

## Environment Set-up
To use SQLite features, execute the following commands in the terminal or use the included Python script:

####################################
# SQLite Database Setup
####################################

The included Python script (`code_example.py`) demonstrates:
- Importing the SQLite library.
- Connecting to or creating an SQLite database named `example.db`.
- Creating a table named 'greetings'.
- Inserting sample greetings into this table.

You can run the script directly to set up your SQLite database environment:

```bash
python code_example.py
