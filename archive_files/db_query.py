import psycopg2

# Replace these variables with your actual database connection information
db_name = "tutos"
db_user = "tuto"
db_password = "admingres"
db_host = "localhost"
db_port = "5432"

try:
    # Establish a connection to the database
    connection = psycopg2.connect(
        dbname=db_name,
        user=db_user,
        password=db_password,
        host=db_host,
        port=db_port
    )

    # Create a cursor object using the cursor() method
    cursor = connection.cursor()

    # SQL query to fetch all table names in the 'public' schema
    cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'")

    # Fetch the first table name from the result
    table = cursor.fetchone()
    if table:
        table_name = table[0]
        print(f"Using table: {table_name}")

        # Now you can execute your original query with the found table name
        sql_query = f"SELECT * FROM {table_name} LIMIT 10;"
        cursor.execute(sql_query)

        # Fetch all the rows in a list of lists.
        results = cursor.fetchall()
        for row in results:
            print(row)
    else:
        print("No tables found in the 'public' schema.")

except Exception as e:
    print(f"An error occurred: {e}")

finally:
    if connection:
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
