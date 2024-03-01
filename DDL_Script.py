import psycopg2

def get_table_ddl(database_name, host, user, password):
    # Connect to the database
    connection = psycopg2.connect(host=host,
                                  user=user,
                                  password=password,
                                  database=database_name)

    try:
        with connection.cursor() as cursor:
            # Get table names
            cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'")
            tables = cursor.fetchall()
            
            # Initialize DDL string
            ddl_statements = []

            # Iterate through each table
            for table in tables:
                table_name = table[0]
                
                # Retrieve table columns
                cursor.execute("SELECT column_name, data_type, character_maximum_length, is_nullable FROM information_schema.columns WHERE table_schema = 'public' AND table_name = %s", (table_name,))
                columns = cursor.fetchall()
                
                # Generate DDL statement for the table
                ddl = f"CREATE TABLE {table_name} (\n"
                for column in columns:
                    column_name = column[0]
                    data_type = column[1]
                    max_length = column[2]
                    is_nullable = "NOT NULL" if column[3] == 'NO' else "NULL"
                    
                    # Adjust data type based on character maximum length
                    if max_length is not None:
                        data_type += f"({max_length})"
                    
                    ddl += f"    {column_name} {data_type} {is_nullable},\n"
                
                # Remove the trailing comma and add a closing parenthesis
                ddl = ddl.rstrip(',\n') + "\n);"
                
                ddl_statements.append(ddl)

    finally:
        connection.close()
    
    return ddl_statements

# Example usage
if __name__ == "__main__":
    database_name = "your_database_name"
    host = "localhost"
    user = "your_username"
    password = "your_password"

    ddl_statements = get_table_ddl(database_name, host, user, password)
    for ddl in ddl_statements:
        print(ddl)
