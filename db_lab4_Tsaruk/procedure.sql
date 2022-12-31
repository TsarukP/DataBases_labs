-- Процедура get_stateInfo(state_id) надає інформацію про назву штату Індії 
-- та про кількість в'язниць, що там знаходиться за індексом

DROP PROCEDURE IF EXISTS get_stateInfo(integer);
CREATE OR REPLACE PROCEDURE get_stateInfo(state_id_arg integer)
LANGUAGE 'plpgsql'
AS $$
DECLARE record_state_name states.state_name%TYPE;
DECLARE record_prison_num states.state_prison_num%TYPE;

BEGIN
    SELECT state_name, state_prison_num into record_state_name, record_prison_num FROM states WHERE state_id = state_id_arg;
    RAISE INFO 'state_name: %,  state_prison_num: %', TRIM(record_state_name), record_prison_num;
END;
$$;