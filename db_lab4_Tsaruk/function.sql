-- Функція avgPrisonExpend(state_id) повертає частку від ділення 
-- загальних витрат на кількість в'язниць у штаті вказаному за індексом

DROP FUNCTION IF EXISTS avgPrisonExpend(integer);
CREATE OR REPLACE FUNCTION avgPrisonExpend(state_id_arg decimal)
    RETURNS integer
    LANGUAGE 'plpgsql'
AS $$
BEGIN 
   RETURN (select expend_data_value from expenditures 
                where expend_indicator_name = 'Total Expenditure' limit 1)::decimal
            / (select state_prison_num from states where state_id = state_id_arg limit 1);
END;
$$;