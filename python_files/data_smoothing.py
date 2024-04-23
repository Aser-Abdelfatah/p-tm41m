from InformationSchemaParser import DatabaseDDLGenerator
from ollama import Client
import json
import ollama

# initial states
__name__ == "__main__"
database_name = "tutos"
host = "localhost"
user = "tuto"
password = "admingres"
ddl_generator = DatabaseDDLGenerator(database_name, host, user, password)

import pdb;

# input strings for the 
question = "How many movies in each genre were released per year?"

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

input_script_message = ddl_generator.ddl_statements_prompt()

input_response = f"""
### Response:
Based on your instructions, here is the SQL query I have generated to answer the question `{question}`:
```sql
"""
#comment =  """COMMENT ON COLUMN "movies"."release_year" IS 'The small integer YYYY labeling the year of the movie release';"""
input_entire_message = input_instructions + '\n' + '\n' + input_init_message + '\n' + input_script_message + '\n'+ '\n'+  '\n' + input_response

# client = Client(host='http://localhost:11434')
# print(input_entire_message)
# response = client.chat(model='sqlcoder', messages=[
#   {
#     'role': 'user',
#     'content': input_entire_message,
#   },
# ])

# print(response['message']['content'])


stream = ollama.chat(
    model='sqlcoder',
    messages=[
        {'role': 'user', 'content': input_entire_message},
    ],
    stream=True,
)

for chunk in stream:
    print(chunk['message']['content'], end='', flush=True)
