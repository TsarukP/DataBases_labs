import psycopg2
import matplotlib.pyplot as plt

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

    cur.execute(query_1)
    states = []
    budget = []

    for row in cur:
        states.append(row[1])
        budget.append(row[0])

    x_range = range(len(states))
 
    figure1, (bar_ax) = plt.subplots(1, 1)
    figure2, (pie_ax) = plt.subplots(1, 1)
    figure3, (graph_ax) = plt.subplots(1, 1)

    bar_ax.bar(x_range, budget, label='Total')
    bar_ax.set_title('Річний загальний бюджет \nна в\'язниці по штатам Індії')
    bar_ax.set_xlabel('Штат')
    bar_ax.set_ylabel('Бюджет, $')
    bar_ax.set_xticks(x_range)
    bar_ax.set_xticklabels(states)
    

    cur.execute(query_2)
    states = []
    highEduc_amount = []

    for row in cur:
        states.append(row[1])
        highEduc_amount.append(row[0])

    pie_ax.pie(highEduc_amount, labeldistance=0.8, labels=states, autopct='%1.1f%%')
    pie_ax.set_title('Заплановані витрати на \nв\'язниці по штатам Індії')

  
    cur.execute(query_3)
    prison_num = []
    non_plan_expenditures = []
  
    for row in cur:
        prison_num.append(row[0])
        non_plan_expenditures.append(row[1])

    graph_ax.plot(prison_num, non_plan_expenditures, marker='o')
    graph_ax.set_xlabel('Кількість в\'язниць')
    graph_ax.set_ylabel('Незаплановані витрати, $')
    graph_ax.set_title('Залежність незапланованих витрат \nвід кількості в\'язниць в штатах Індії')

    for qnt, price in zip(prison_num, non_plan_expenditures):
        graph_ax.annotate(price, xy=(qnt, price), xytext=(7, 2), textcoords='offset points')    


mng = plt.get_current_fig_manager()
mng.resize(1400, 600)

plt.show()