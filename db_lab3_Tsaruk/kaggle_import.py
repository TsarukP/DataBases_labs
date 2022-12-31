import csv
import decimal
import psycopg2

username = 'postgres'
password = 'password'
database = 'TsarukP_DB'

INPUT_CSV_FILE_1 = 'States.csv'
INPUT_CSV_FILE_2 = 'Budgets.csv'
INPUT_CSV_FILE_3 = 'Expenditures.csv'


# приходиться видаляти усі, оскільки State неможливо видалити при 
# умові існування інших 5 таблиць (foreign key)
query_0 = '''
DELETE FROM Budgets;
DELETE FROM Expenditures;
DELETE FROM Wages;
DELETE FROM Education_facilities;
DELETE FROM Rehabilitation;
DELETE FROM States;
'''

query_1 = '''
INSERT INTO States(state_id, state_name, state_prison_num) VALUES (%s, %s, %s)
'''

query_2 = '''
INSERT INTO Budgets(budget_id, state_id, budget_indicator_name, budget_data_value) VALUES (%s, %s, %s, %s)
'''

query_3 = '''
INSERT INTO Expenditures(expend_id, state_id, expend_indicator_name, expend_data_value) VALUES (%s, %s, %s, %s)
'''

conn = psycopg2.connect(user=username, password=password, dbname=database)

with conn:
    cur = conn.cursor()
    with open(INPUT_CSV_FILE_1, 'r') as inf:
        reader = csv.DictReader(inf)
        for idx, row in enumerate(reader):
            values = (row['state_id'], row['state_name'], row['state_prison_num']) 
            cur.execute(query_1, values)

    with open(INPUT_CSV_FILE_2, 'r') as inf:
        reader = csv.DictReader(inf)
        for idx, row in enumerate(reader):
            values = (row['budget_id'], row['state_id'], row['budget_indicator_name'], row['budget_data_value']) 
            cur.execute(query_2, values)

    with open(INPUT_CSV_FILE_3, 'r') as inf:
        reader = csv.DictReader(inf)
        for idx, row in enumerate(reader):
            values = (row['expend_id'], row['state_id'], row['expend_indicator_name'], row['expend_data_value'])  
            cur.execute(query_3, values)

    conn.commit()
