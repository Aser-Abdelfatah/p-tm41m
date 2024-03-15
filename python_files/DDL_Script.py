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
                
                # Retrieve table columns and their comments
                cursor.execute("""
                    SELECT column_name, data_type, character_maximum_length, is_nullable, 
                           pg_catalog.col_description((SELECT c.oid FROM pg_catalog.pg_class c WHERE c.relname = %s::text AND c.relnamespace = (SELECT n.oid FROM pg_catalog.pg_namespace n WHERE n.nspname = 'public'::text)), ordinal_position::int) as column_comment
                    FROM information_schema.columns c 
                    WHERE table_schema = 'public' AND table_name = %s
                    ORDER BY ordinal_position
                """, (table_name, table_name))
                
                columns = cursor.fetchall()
                
                # Generate DDL statement for the table
                ddl = f"CREATE TABLE {table_name} (\n"
                for column in columns:
                    column_name = column[0]
                    data_type = column[1]
                    max_length = column[2]
                    is_nullable = "NOT NULL" if column[3] == 'NO' else "NULL"
                    column_comment = column[4]
                    
                    # Adjust data type based on character maximum length
                    if max_length is not None:
                        data_type += f"({max_length})"
                    
                    # If the column is a BIGSERIAL PRIMARY KEY, use SERIAL
                    if column_name == 'id' and data_type == 'bigint' and column_comment and 'nextval' in column_comment.lower():
                        ddl += f"    {column_name} SERIAL PRIMARY KEY"
                    else:
                        ddl += f"    {column_name} {data_type} {is_nullable}"
                    
                    ddl += ",\n"
                
                # Remove the trailing comma and add a closing parenthesis
                ddl = ddl.rstrip(',\n') + "\n);"
                
                # Retrieve table comment
                cursor.execute("""
                    SELECT obj_description((SELECT c.oid FROM pg_catalog.pg_class c WHERE c.relname = %s::text AND c.relnamespace = (SELECT n.oid FROM pg_catalog.pg_namespace n WHERE n.nspname = 'public'::text)))
                """, (table_name,))
                table_comment = cursor.fetchone()[0]
                
                if table_comment:
                    ddl += f"\n\nCOMMENT ON TABLE \"{table_name}\" IS '{table_comment}';"
                
                # Add column comments
                for column in columns:
                    column_name = column[0]
                    column_comment = column[4]
                    if column_comment:
                        ddl += f"\nCOMMENT ON COLUMN \"{table_name}\".\"{column_name}\" IS '{column_comment}';"
                
                ddl_statements.append(ddl)

    finally:
        connection.close()
    
    return ddl_statements

# Example usage
if __name__ == "__main__":
    database_name = "tutos"
    host = "localhost"
    user = "tuto"
    password = "admingres"

    ddl_statements = get_table_ddl(database_name, host, user, password)
    for ddl in ddl_statements:
        print(ddl)
