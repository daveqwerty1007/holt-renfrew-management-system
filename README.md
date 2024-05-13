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