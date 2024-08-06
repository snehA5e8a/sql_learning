import pandas as pd
import sqlite3
from sqlalchemy import create_engine, Table, Column, Integer, String, MetaData, ForeignKey


dim_date = pd.read_csv('datasets/dim_date.csv', header=0)
print(dim_date.head())
db_file = 'ev_Data.db'
conn = sqlite3.connect(db_file)

dim_date.to_sql('dim_Date_sql', conn, index=False)
cursor = conn.cursor()

# Example SQL query
cursor.execute("SELECT * FROM dim_Date_sql")
results = cursor.fetchall()
for row in results:
    print(row)

conn.close()
