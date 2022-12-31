-- Тригер, який при додаванні нового рядка в таблицю States створює
-- новий запис в таблиці Budgets і заповнює початкові дані

DROP TRIGGER IF EXISTS putOnTheRecord ON states;

CREATE OR REPLACE FUNCTION putOnTheRecord() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
            insert into Budgets(budget_id, state_id, budget_indicator_name, budget_data_value)
            VALUES  ((select max(budget_id) from budgets)+1, (select max(state_id) from states), 'Total Annual Budget', 50);
		  RETURN NULL;
     END;
$$;

CREATE TRIGGER newRecord 
AFTER INSERT ON states
FOR EACH ROW EXECUTE FUNCTION putOnTheRecord()