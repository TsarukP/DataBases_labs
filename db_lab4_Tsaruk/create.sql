CREATE TABLE States
(
  state_id		int		NOT NULL,
  state_name		char(50)	NOT NULL,
  state_prison_num	int		NULL
);

CREATE TABLE Budgets
(
  budget_id		int		NOT NULL,
  state_id		int		NOT NULL,
  budget_indicator_name	char(100)	NOT NULL,
  budget_data_value	bigint		NULL
);

CREATE TABLE Expenditures
(
  expend_id		int		NOT NULL,
  state_id		int		NOT NULL,
  expend_indicator_name	char(100)	NOT NULL,
  expend_data_value	bigint		NULL
);

CREATE TABLE Education_facilities
(
  educ_id		int	NOT NULL,
  state_id		int	NOT NULL,
  educ_elementary	int	NULL,
  educ_adult		int	NULL,
  educ_higher		int	NULL
);

CREATE TABLE Rehabilitation
(
  rehabil_id			int	NOT NULL,
  state_id			int	NOT NULL,
  rehabil_financial_assist	int	NULL,
  rehabil_rehabilitated		int	NULL,
  rehabil_legal_aid_provided	int	NULL
);

CREATE TABLE Wages
(
  wage_id			int	NOT NULL,
  state_id			int	NOT NULL,
  wages_skilled_convicts	int	NULL,
  wages_semi_skilled_convicts	int	NULL,
  wages_unskilled_convicts	int	NULL
);

ALTER TABLE States ADD CONSTRAINT PK_States PRIMARY KEY (state_id);
ALTER TABLE Budgets ADD CONSTRAINT PK_Budgets PRIMARY KEY (budget_id);
ALTER TABLE Expenditures ADD CONSTRAINT PK_Expenditures PRIMARY KEY (expend_id);
ALTER TABLE Education_facilities ADD CONSTRAINT PK_Education_facilities PRIMARY KEY (educ_id);
ALTER TABLE Rehabilitation ADD CONSTRAINT PK_Rehabilitation PRIMARY KEY (rehabil_id);
ALTER TABLE Wages ADD CONSTRAINT PK_Wages PRIMARY KEY (wage_id);

ALTER TABLE Budgets
ADD CONSTRAINT FK_Budgets_state FOREIGN KEY (state_id) REFERENCES States (state_id);
ALTER TABLE Expenditures
ADD CONSTRAINT FK_Expenditures_state FOREIGN KEY (state_id) REFERENCES States (state_id);
ALTER TABLE Education_facilities
ADD CONSTRAINT FK_Education_facilities_state FOREIGN KEY (state_id) REFERENCES States (state_id);
ALTER TABLE Rehabilitation
ADD CONSTRAINT FK_Rehabilitation_state FOREIGN KEY (state_id) REFERENCES States (state_id);
ALTER TABLE Wages
ADD CONSTRAINT FK_Wages_state FOREIGN KEY (state_id) REFERENCES States (state_id);