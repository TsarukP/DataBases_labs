INSERT INTO States(state_id, state_name, state_prison_num)
VALUES  (1, 'Andhra Pradesh', 111),
        (2, 'Assam', 31),
        (3, 'Bihar', 58),
        (4, 'Chhattisgarh', 28),
        (5, 'Goa', 3),
        (6, 'Gujarat', 27),
        (7, 'Haryana', 19),
        (8, 'Himachal Pradesh', 20);

INSERT INTO Budgets(budget_id, state_id, budget_indicator_name, budget_data_value)
VALUES  (1, 8, 'Non-Plan Budget', 48120000),
        (2, 7, 'Non-Plan Budget', 148985000),
        (3, 7, 'Plan Budget', 0),
        (4, 2, 'Plan Budget', 26075000),
        (5, 5, 'Plan Budget', 70000),
        (6, 4, 'Total Annual Budget', 129676073),
        (7, 6, 'Total Annual Budget', 242046000),
        (8, 1, 'Total Annual Budget', 728690000),
        (9, 3, 'Plan Budget', 19170000),
        (10, 3, 'Non-Plan Budget', 580992000);

INSERT INTO Expenditures(expend_id, state_id, expend_indicator_name, expend_data_value)
VALUES  (8, 5, 'Non-Plan Expenditure', 19857000),
        (7, 1, 'Non-Plan Expenditure', 692321000),
        (14, 6, 'Plan Expenditure', 2930000),
        (13, 4, 'Plan Expenditure', 35465952),
        (20, 2, 'Expenditure due to funds from other agencies (Central Govt, World Bank, etc.)', 0),
        (19, 3, 'Expenditure due to funds from other agencies (Central Govt, World Bank, etc.)', 0),
        (25, 8, 'Total Expenditure', 58833000),
        (26, 7, 'Total Expenditure', 148985000),
        (4, 2, 'Non-Plan Expenditure', 142415000),
        (1, 8, 'Non-Plan Expenditure', 48120000);

INSERT INTO Education_facilities(educ_id, state_id, educ_elementary, educ_adult, educ_higher)
VALUES  (1, 1, 2699, 2161, 301),
        (2, 2, 413, 683, 6),
        (3, 3, 0, 0, 0),
        (4, 4, 517, 335, 28),
        (5, 5, 0, 0, 0),
        (6, 6, 154, 504, 23),
        (7, 7, 185, 214, 12),
        (8, 8, 0, 0, 0);

INSERT INTO Rehabilitation(rehabil_id, state_id, rehabil_financial_assist, rehabil_rehabilitated, rehabil_legal_aid_provided)
VALUES  (1, 1, 14, 75, 2594),
        (2, 2, 1, 2, 7),
        (3, 3, 0, 0, 0),
        (4, 4, 0, 0, 169),
        (5, 5, 0, 0, 0),
        (6, 6, 48, 0, 3365),
        (7, 7, 0, 0, 1575),
        (8, 8, 0, 0, 0);

INSERT INTO Wages(wage_id, state_id, wages_skilled_convicts, wages_semi_skilled_convicts, wages_unskilled_convicts)
VALUES  (1,1,15,10,0),
        (2,2,18,0,12),
        (3,3,12,8,8),
        (4,4,10,8,8),
        (5,5,21,15,12),
        (6,6,14,14,14),
        (7,7,16,12,10),
        (8,8,0,0,0);