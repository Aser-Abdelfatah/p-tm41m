import InformationSchemaParser
import json
import ollama

# initial states
__name__ == "__main__"
database_name = "tutos"
host = "localhost"
user = "tuto"
password = "admingres"
ddl_generator = InformationSchemaParser.DatabaseDDLGenerator(database_name, host, user, password)

# input strings for the 
question = "Which product generates the most sales?"

input_instructions = f"""
### Instructions:
Your task is to convert a question into a SQL query, given a Postgres database schema.
Adhere to these rules:
- **Deliberately go through the question and database schema word by word** to appropriately answer the question
- **Use Table Aliases** to prevent ambiguity. For example, `SELECT table1.col1, table2.col1 FROM table1 JOIN table2 ON table1.id = table2.id`.
- When creating a ratio, always cast the numerator as float
"""

input_init_message = f"""
### Input:
Generate a SQL query that answers the question `{question}`.
This query will run on a database whose schema is represented in this string:"""

input_script_message = ddl_generator.print_marshalled_ddl_statements()

input_response = f"""
### Response:
Based on your instructions, here is the SQL query I have generated to answer the question `{question}`:
```sql
"""

input_entire_message = input_instructions + '\n' + '\n' + input_init_message + '\n' + input_script_message + '\n'+ '\n'+ input_response

stream = ollama.chat(
    model='sqlcoder',
    messages=[
        {'role': 'user', 'content': input_entire_message},
    ],
    stream=True,
)

for chunk in stream:
    print(chunk['message']['content'], end='', flush=True)
