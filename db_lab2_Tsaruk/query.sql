-- річний загальний бюджет на в'язниці по штатам Індії
select budget_data_value as annual_budget, state_name as state
from budgets join states using (state_id)
where budget_indicator_name = 'Total Annual Budget';

-- заплановані витрати на в'язниці по штатам Індії
select expend_data_value as value, state_name as state
from expenditures join states using (state_id)
where expend_indicator_name = 'Plan Expenditure';

-- залежність незапланованих витрат від кількості в'язниць в штатах Індії
select state_prison_num as prison_num, expend_data_value as expenditures
from states join expenditures using (state_id)
where expenditures.expend_indicator_name = 'Non-Plan Expenditure'
and expenditures.expend_data_value != 0
order by prison_num;