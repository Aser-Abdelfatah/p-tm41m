#!/bin/bash

# Replace 'postgres_user' and 'your_database_name' with your PostgreSQL username and desired database name.

DATABASE_NAME=tutos
POSTGRES_USER=tuto


# Connect to PostgreSQL and execute the database and table creation commands
sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d postgres -c "DROP DATABASE IF EXISTS $DATABASE_NAME;"
sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d postgres -c "CREATE DATABASE $DATABASE_NAME;"

# Execute the table creation in the new database
sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d "$DATABASE_NAME" -c"
CREATE TYPE genre AS ENUM (
    'ADVENTURE',
    'HORROR',
    'COMEDY',
    'ACTION',
    'SPORTS'
);
CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR NOT NULL,
    release_year SMALLINT,
    genre genre,
    price NUMERIC(4, 2)
);
"

echo "Database and tables created successfully!"

