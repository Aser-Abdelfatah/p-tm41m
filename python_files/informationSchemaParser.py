import json

import psycopg2


class DatabaseDDLGenerator:
    def __init__(self, database_name, host, user, password):
        self.database_name = database_name
        self.host = host
        self.user = user
        self.password = password
        self.ddl_statements = []  # To store generated DDL statements
        
        # Connect to the database
        self.connection = psycopg2.connect(host=self.host,
                                      user=self.user,
                                      password=self.password,
                                      database=self.database_name)
        self.generate_ddl_statements()
        self.marshalled_ddl_statements = self.marshal_ddl_statements()
        self.unmarshal_ddl_statements()  # Deserialize back to Python objects

    def generate_ddl_statements(self):
        # ensure connection is still valid
        if(self.connection.closed == 1):
            self.connection = psycopg2.connect(host=self.host,
                                      user=self.user,
                                      password=self.password,
                                      database=self.database_name)

        try:
            with self.connection.cursor() as cursor:
                # Get table names
                cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'")
                tables = cursor.fetchall()

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
                    
                    ddl_dict = {
                        "table_name": table_name,
                        # Add other table details and column details here in a structured form
                        "ddl": ddl  # Keep the full DDL statement as one of the elements for convenience
                    }
                    self.ddl_statements.append(ddl_dict)
        finally:
            self.connection.close()

    def marshal_ddl_statements(self):
        # Convert the ddl_statements list of dictionaries to a JSON string
       return json.dumps(self.ddl_statements)

    def unmarshal_ddl_statements(self):
        # Convert the JSON string back to a Python object (list of dictionaries)
        self.ddl_statements = json.loads(self.marshalled_ddl_statements)

    def ddl_statements_prompt(self):
        ddl_statements = ""
        # Ensure we're working with the unmarshalled data
        if isinstance(self.ddl_statements, str):
            self.unmarshal_ddl_statements()
            
        for ddl_dict in self.ddl_statements:
            ddl_statements += ddl_dict['ddl']
        return ddl_statements
            
    def print_marshalled_ddl_statements(self):
        return self.marshalled_ddl_statements

# Example usage
if __name__ == "__main__":
    database_name = "tutos"
    host = "localhost"
    user = "tuto"
    password = "admingres"

    ddl_generator = DatabaseDDLGenerator(database_name, host, user, password)
   
    ddl_generator.print_ddl_statements()  # Print the DDL statements
    ddl_generator.print_marshalled_ddl_statements()  # Print the marshalled DDL statements
