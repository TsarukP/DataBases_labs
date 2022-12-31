import psycopg2

username = 'postgres'
password = 'password'
database = 'TsarukP_DB'
host = 'localhost'
port = '5432'

# річний загальний бюджет на в'язниці по штатам Індії
query_1 = '''
select budget_data_value as annual_budget, state_name as state
from budgets join states using (state_id)
where budget_indicator_name = 'Total Annual Budget';
'''

# заплановані витрати на в'язниці по штатам Індії
query_2 = '''select expend_data_value as value, state_name as state
from expenditures join states using (state_id)
where expend_indicator_name = 'Plan Expenditure';
'''

# залежність незапланованих витрат від кількості в'язниць в штатах Індії
query_3 = '''select state_prison_num as prison_num, expend_data_value as expenditures
from states join expenditures using (state_id)
where expenditures.expend_indicator_name = 'Non-Plan Expenditure'
and expenditures.expend_data_value != 0
order by prison_num;
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)
with conn:
    cur = conn.cursor()
    print('\n1.Річний загальний бюджет \nна в\'язниці по штатам Індії')

    cur.execute(query_1)

    for row in cur:
        print(row[1].rstrip(), '\t', row[0])

    print('\n2.Заплановані витрати на \nв\'язниці по штатам Індії')

    cur.execute(query_2)

    for row in cur:
        print(row[1].rstrip(), '\t', row[0])

    print('\n3.Залежність незапланованих витрат \nвід кількості в\'язниць в штатах Індії')

    cur.execute(query_3)

    for row in cur:
        print(row[1], '\t', row[0])