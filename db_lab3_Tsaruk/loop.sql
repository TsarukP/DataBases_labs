select * from expenditures;

DO $$
DECLARE0
     expend_id expenditures.expend_id%TYPE;
     state_id expenditures.state_id%TYPE;
     expend_indicator_name expenditures.expend_indicator_name%TYPE;
     expend_data_value expenditures.expend_data_value%TYPE;

BEGIN
    expend_id := 50;
    state_id := 1;
    expend_indicator_name := 'Amortization';
    expend_data_value := 1000;
    FOR counter IN 1..7
        LOOP
            INSERT INTO expenditures (expend_id, state_id, expend_indicator_name, expend_data_value)
            VALUES (counter + expend_id, counter + state_id, expend_indicator_name, expend_data_value + counter*100);
        END LOOP;
END;
$$