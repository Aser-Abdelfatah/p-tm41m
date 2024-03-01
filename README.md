# Dockerized PostgreSQL and Python Application

This repository contains files to set up a Docker container with a PostgreSQL database and a Python application.

## How to Set up Docker:

1. Clone this repository:

   ```bash
   git clone <repository_url>
   cd <repository_directory>
   ```

2. Create an external docker volume:

   ```bash
   docker volume create dbtuto
   ```

3. Run docker-compose up:

   ```bash
   docker-compose up --build
   ```

4. To access the database, run the following command:

   ```bash
   psql -d tutos -U tuto
   ```

   If that didn't work, try 
   ```bash
   sudo docker exec -it postgres_tuto psql -d tutos -U tuto
   ```
