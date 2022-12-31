-- Процедура get_stateInfo(state_id) надає інформацію про назву штату Індії 
-- та про кількість в'язниць, що там знаходиться за індексом

CALL get_stateInfo(3);
-- або CALL get_stateInfo(1);

-- Функція avgPrisonExpend(state_id) повертає частку від ділення 
-- загальних витрат на кількість в'язниць у штаті вказаному за індексом

SELECT avgPrisonExpend(8);
-- або SELECT avgPrisonExpend(7);

-- Тригер, який при додаванні нового рядка в таблицю States створює
-- новий запис в таблиці Budgets і заповнює початкові дані

INSERT INTO States(state_id, state_name, state_prison_num) 
    VALUES (10, 'Extra state 1', 0);
INSERT INTO States(state_id, state_name, state_prison_num) 
    VALUES (11, 'Extra state 2', 0);
INSERT INTO States(state_id, state_name, state_prison_num) 
    VALUES (12, 'Extra state 3', 0);

select * from budget;