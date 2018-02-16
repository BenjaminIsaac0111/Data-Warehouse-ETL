ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';

DROP TABLE SU_contractor cascade constraints;

DROP TABLE SU_company cascade constraints; 

DROP TABLE SU_job cascade constraints;

DROP TABLE SU_agent cascade constraints;

DROP TABLE SU_contractor_CV cascade constraints;


--------------------------------------------------------------
-- Table Creation --
-- NOTE: all INTEGER dt replaced with NUMBER(8); NN removed from PK and FK columns

-- Each entity on the model is represented by a table that needs to be created within the Database.
-- Within SQL new tables are created using the CREATE TABLE command.
-- When a table is created its name and its attributes are defined.
-- The values of which are derived from those specified on the model.
-- Certain constraints are sometimes also specified, such as identification of primary keys.

CREATE TABLE SU_company(
	company_id	NUMBER(8) ,
	cmp_name	VARCHAR(15) NOT NULL,
	cmp_postcode	VARCHAR(10) NOT NULL,
    fk1_agent_id	NUMBER(8) NOT NULL,
    date_registered DATE,
	-- Specify the PRIMARY KEY constraint for table "SU_company".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_SU_company PRIMARY KEY (company_id)
);

-- Create a Database table to represent the "SU_job" entity.
CREATE TABLE SU_job(
	placement_id	NUMBER(8) ,
	plt_short_desc	VARCHAR(25),
	plt_required_start_date	DATE,
	plt_estimated_end_date	DATE,
	ptl_actual_start_date	DATE,
	plt_actual_end_date	DATE,
	actual_salary	NUMBER(8) NOT NULL,
	fk1_company_id	NUMBER(8) ,
	fk2_contractor_id	NUMBER(8) ,
	supervisor_name	VARCHAR(20),
	-- Specify the PRIMARY KEY constraint for table "SU_job".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_SU_job PRIMARY KEY (placement_id)
);

-- Create a Database table to represent the "SU_agent" entity.
CREATE TABLE SU_agent(
	agent_id	NUMBER(8) ,
	second_name	VARCHAR(15),
	first_name	VARCHAR(10),
	address 	VARCHAR(30),
	email	VARCHAR(30),
	start_date	DATE,
	end_date	DATE,
	-- Specify the PRIMARY KEY constraint for table "SU_agent".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_SU_agent PRIMARY KEY (agent_id)
);

-- Create a Database table to represent the "SU_contractor" entity.
CREATE TABLE SU_contractor(
	contractor_id	NUMBER(8),
	con_name	    VARCHAR(15) NOT NULL,
	con_postcode	VARCHAR(10) NOT NULL,
	con_skill	    VARCHAR(15) NOT NULL,
	Highest_qual	NUMBER(8) NOT NULL,
	preferred_role	VARCHAR(15),
	date_registered DATE,
	-- Specify the PRIMARY KEY constraint for table "SU_contractor".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_SU_contractor PRIMARY KEY (contractor_id)
);


-- Create a Database table to represent the "SU_contractor_cv" entity.
CREATE TABLE SU_contractor_cv(
	role_id	NUMBER(8),
	job_role_name	VARCHAR(30),
	short_desc	VARCHAR(30),
	start_date	DATE,
	end_date	DATE,
	fk1_contractor_id	NUMBER(8) NOT NULL,
	-- Specify the PRIMARY KEY constraint for table "SU_contractor_cv".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_SU_contractor_cv PRIMARY KEY (role_id)
);


-- INSERT DATA 

-- SU_agent

DELETE FROM SU_agent;

INSERT INTO SU_agent  VALUES(1, 'Ken',' Kettle', 'Otley', 'K.Kettle@hotmail.com', '06/1/2013', '');
INSERT INTO SU_agent  VALUES(2, 'Jenna' ,' Jenkin', 'Otley', 'J.Jenkin@hotmail.com', '6/11/2014','');
INSERT INTO SU_agent  VALUES(3, 'Izzac',' Ingle', 'Otley','I.Ingle@hotmail.com',  '6/11/2010', '');
INSERT INTO SU_agent  VALUES(4, 'Dan','Dare', 'Otley', ' D.Dare@hotmail.com', '6/11/2010', '');
INSERT INTO SU_agent  VALUES(5, 'Elliot','Evans', 'Headingley', ' E.Evant@hotmail.com', '6/12/2014', '');
INSERT INTO SU_agent  VALUES(6, 'Fred','Frump', 'Oltley', ' hotmail.com', '6/12/2013', '');
INSERT INTO SU_agent  VALUES(7, 'Gilly ','Green', 'Otley', 'G.Geen@hotmail.com',  '6/12/2014', '');
INSERT INTO SU_agent  VALUES(8, 'Harry','Hoo', 'Otley', 'H.Hoo@hotmail.com', '6/12/2012', '');

------------------------

-- SU_company 

DELETE FROM SU_company;

INSERT INTO SU_company VALUES (10, 'SU_ACompany10', 'YK 6 121', 1, '01/01/2010');
INSERT INTO SU_company VALUES (11, 'SU_ACompany11', 'YK 6 122', 1,'01/01/2010');
INSERT INTO SU_company VALUES (12, 'SU_ACompany12', 'YK 6 123', 1,'01/01/2010');
INSERT INTO SU_company VALUES (13, 'SU_ACompany13', 'YK 6 124', 1,'01/01/2010');
INSERT INTO SU_company VALUES (14, 'SU_ACompany14', 'YK 6 125', 1,'01/01/2010');
INSERT INTO SU_company VALUES (15, 'SU_ACompany15', 'YK 6 126', 1,'01/01/2010');

INSERT INTO SU_company VALUES (20, 'SU_BCompany20', 'YK 7 121', 2,'01/01/2010');
INSERT INTO SU_company VALUES (21, 'SU_BCompany21', 'YK 7 122', 2,'01/01/2010');
INSERT INTO SU_company VALUES (22, 'SU_BCompany22', 'YK 7 123', 2,'01/01/2010');
INSERT INTO SU_company VALUES (23, 'SU_BCompany23', 'YK 7 124', 2,'01/01/2010');
INSERT INTO SU_company VALUES (24, 'SU_BCompany24', 'YK 7 125', 2,'01/01/2010');
INSERT INTO SU_company VALUES (25, 'SU_BCompany25', 'YK 7 126', 2,'01/01/2010');

INSERT INTO SU_company VALUES (30, 'SU_CCompany30', 'YK 8 121', 3,'01/01/2010');
INSERT INTO SU_company VALUES (31, 'SU_CCompany31', 'YK 8 122', 3,'01/01/2010');
INSERT INTO SU_company VALUES (32, 'SU_CCompany32', 'YK 8 123', 3,'01/01/2010');
INSERT INTO SU_company VALUES (33, 'SU_CCompany33', 'YK 8 124', 3,'01/01/2010');
INSERT INTO SU_company VALUES (34, 'SU_CCompany34', 'YK 8 125', 3,'01/01/2010');
INSERT INTO SU_company VALUES (35, 'SU_CCompany35', 'YK 8 126', 3,'01/01/2010');

INSERT INTO SU_company VALUES (40, 'SU_DCompany40', 'YK 9 121', 4,'01/01/2010');
INSERT INTO SU_company VALUES (41, 'SU_DCompany41', 'YK 9 122', 4,'01/01/2010');
INSERT INTO SU_company VALUES (42, 'SU_DCompany42', 'YK 9 123', 4,'01/01/2010');
INSERT INTO SU_company VALUES (43, 'SU_DCompany43', 'YK 9 124', 4,'01/01/2010');
INSERT INTO SU_company VALUES (44, 'SU_DCompany44', 'YK 9 125', 4,'01/01/2010');
INSERT INTO SU_company VALUES (45, 'SU_DCompany45', 'YK 9 126', 4,'01/01/2010');

INSERT INTO SU_company VALUES (50, 'SU_DCompany46', 'YK 9 121', 5,'01/01/2010');
INSERT INTO SU_company VALUES (51, 'SU_DCompany47', 'YK 9 122', 5,'01/01/2010');
INSERT INTO SU_company VALUES (52, 'SU_DCompany48', 'YK 9 123', 5,'01/01/2010');
INSERT INTO SU_company VALUES (53, 'SU_DCompany49', 'YK 9 124', 5,'01/01/2010');
INSERT INTO SU_company VALUES (54, 'SU_DCompany54', 'YK 9 125', 5,'01/01/2010');
INSERT INTO SU_company VALUES (55, 'SU_DCompany55', 'YK 9 126', 5,'01/01/2010');

INSERT INTO SU_company VALUES (60, 'SU_ECompany61', 'YK 6 121', 6,'01/01/2010');
INSERT INTO SU_company VALUES (61, 'SU_ECompany62', 'YK 6 122', 6,'01/01/2010');
INSERT INTO SU_company VALUES (62, 'SU_ECompany63', 'YK 6 123', 6,'01/01/2010');
INSERT INTO SU_company VALUES (63, 'SU_ECompany64', 'YK 6 124', 6,'01/01/2010');
INSERT INTO SU_company VALUES (64, 'SU_ECompany65', 'YK 6 125', 6,'01/01/2010');
INSERT INTO SU_company VALUES (65, 'SU_ECompany66', 'YK 6 126', 6,'01/01/2010');

INSERT INTO SU_company VALUES (70, 'SU_FCompany71', 'YK 7 121', 7,'01/01/2010');
INSERT INTO SU_company VALUES (71, 'SU_FCompany27', 'YK 7 122', 7,'01/01/2010');
INSERT INTO SU_company VALUES (72, 'SU_FCompany73', 'YK 7 123', 7,'01/01/2010');
INSERT INTO SU_company VALUES (73, 'SU_FCompany74', 'YK 7 124', 7,'01/01/2010');
INSERT INTO SU_company VALUES (74, 'SU_FCompany75', 'YK 7 125', 7,'01/01/2010');
INSERT INTO SU_company VALUES (75, 'SU_FCompany76', 'YK 7 126', 7,'01/01/2010');

INSERT INTO SU_company VALUES (80, 'SU_GCompany81', 'YK 8 121', 8,'01/01/2010');
INSERT INTO SU_company VALUES (81, 'SU_GCompany82', 'YK 8 122', 8,'01/01/2010');
INSERT INTO SU_company VALUES (82, 'SU_GCompany83', 'YK 8 123', 8,'01/01/2010');
INSERT INTO SU_company VALUES (83, 'SU_GCompany84', 'YK 8 124', 8,'01/01/2010');
INSERT INTO SU_company VALUES (84, 'SU_GCompany85', 'YK 8 125', 8,'01/01/2010');
INSERT INTO SU_company VALUES (85, 'SU_GCompany86', 'YK 8 126', 8,'01/01/2010');

INSERT INTO SU_company VALUES (90, 'SU_HCompany91', 'YK 9 121', 1,'01/01/2010');
INSERT INTO SU_company VALUES (91, 'SU_HCompany92', 'YK 9 122', 1,'01/01/2010');
INSERT INTO SU_company VALUES (92, 'SU_HCompany93', 'YK 9 123', 1,'01/01/2010');
INSERT INTO SU_company VALUES (93, 'SU_HCompany94', 'YK 9 124', 1,'01/01/2010');
INSERT INTO SU_company VALUES (94, 'SU_HCompany95', 'YK 9 125', 1,'01/01/2010');
INSERT INTO SU_company VALUES (95, 'SU_HCompany96', 'YK 9 126', 1,'01/01/2010');
INSERT INTO SU_company VALUES (96, 'SU_HCompany911', 'YK 9 121', 1,'01/01/2010');
INSERT INTO SU_company VALUES (97, 'SU_HCompany921', 'YK 9 122', 1,'01/01/2010');
INSERT INTO SU_company VALUES (98, 'SU_HCompany931', 'YK 9 123', 1,'01/01/2010');
INSERT INTO SU_company VALUES (99, 'SU_HCompany941', 'YK 9 124', 1,'01/01/2010');
INSERT INTO SU_company VALUES (100, 'SU_HCompany951', 'YK 9 125', 1,'01/01/2010');
INSERT INTO SU_company VALUES (101, 'SU_HCompany961', 'YK 9 126', 1,'01/01/2010');


-------------------




-- SU_contractor 

DELETE FROM SU_contractor;

INSERT INTO SU_contractor VALUES(10, 'Liam Moore', 'YK6 981', 'SQL', 4, 'SQL', '01/01/2010');
INSERT INTO SU_contractor VALUES(11, 'Mandy More', 'YK6 982', 'Developer',4,'Developer','01/02/2010');
INSERT INTO SU_contractor VALUES(12, 'Neil Noel', 'YK6 983', 'Developer',4,'Developer', '01/03/2010');
INSERT INTO SU_contractor VALUES(13, 'Ollie Over', 'YK6 984', 'DBA',4,'DBA', '01/01/2010');
INSERT INTO SU_contractor VALUES(14, 'Petra Roberts', 'YK6 981', 'Developer',6,'Developer','01/07/2010');
INSERT INTO SU_contractor VALUES(15, 'Queen Que', 'YK6 982', 'Analyst',4,'DBA','01/08/2010');
INSERT INTO SU_contractor VALUES(16, 'Rich Roberts', 'YK6 982', 'Developer',4,'Developer', '01/08/2010');
INSERT INTO SU_contractor VALUES(17, 'Steph Smith', 'YK7 981', 'Developer',4,'Developer', '01/10/2010');
INSERT INTO SU_contractor VALUES(18, 'Tim Tiny', 'YK7 981', 'Developer',4,'Developer', '01/01/2010');
INSERT INTO SU_contractor VALUES(19, 'Ullah Upworth', 'YK7 981', 'Developer',4,'Developer', '01/02/2010');
INSERT INTO SU_contractor VALUES(20, 'Vera vale', 'YK7 981', 'Developer',4,'Developer', '01/07/2010');
INSERT INTO SU_contractor VALUES(21, 'Wesley Walsh', 'YK7 981', 'Developer',6,'DBA', '01/08/2010');
INSERT INTO SU_contractor VALUES(22, 'Xio Xem', 'YK7 981', 'Developer',6,'Developer', '01/01/2010');
INSERT INTO SU_contractor VALUES(23, 'Yvonne Moore', 'YK7 981', 'DBA',4,'DBA', '01/03/2010');
INSERT INTO SU_contractor VALUES(24, 'Zed Zebra', 'YK7 981', 'Developer',4,'DBA', '01/03/2010');
INSERT INTO SU_contractor VALUES(30, 'Liam Smith', 'YK8 981', 'Developer',4,'Developer', '01/05/2010');
INSERT INTO SU_contractor VALUES(31, 'Mandy Mand', 'YK8 982', 'Developer',4,'Developer', '01/01/2010');
INSERT INTO SU_contractor VALUES(32, 'Neil Nand', 'YK8 983', 'Developer',4,'Developer', '01/07/2010');
INSERT INTO SU_contractor VALUES(33, 'Ollie Onder', 'YK8 984', 'DBA',4,'Developer', '01/08/2010');
INSERT INTO SU_contractor VALUES(34, 'Petra Smith', 'YK8 981', 'Developer',6,'Developer','01/01/2010');
INSERT INTO SU_contractor VALUES(35, 'Queen Quand', 'YK8 982', 'Analyst',4,'Developer', '01/11/2010');
INSERT INTO SU_contractor VALUES(36, 'Rich Rand', 'YK6 982', 'Developer',4,'DBA', '01/12/2010');
INSERT INTO SU_contractor VALUES(37, 'Steph Moore', 'YK 981', 'Developer',4,'Developer', '01/01/2010');
INSERT INTO SU_contractor VALUES(38, 'Tim Smith', 'YK9 981', 'Developer',4,'Analyst','01/03/2010');
INSERT INTO SU_contractor VALUES(39, 'Ullah Upand', 'YK9 981', 'Developer',4,'Developer', '01/02/2010');
INSERT INTO SU_contractor VALUES(40, 'Vera vand', 'YK9 981', 'Developer',4,'Analyst', '01/01/2010');
INSERT INTO SU_contractor VALUES(41, 'Wesley Waand', 'YK9 981', 'Developer',6,'Developer', '01/06/2010');
INSERT INTO SU_contractor VALUES(42, 'Xio Xem', 'YK9 981', 'Developer',6,'Developer', '01/06/2010');
INSERT INTO SU_contractor VALUES(43, 'Yvonne Yand', 'YK9 981', 'DBA',4,'Developer', '01/07/2010');
INSERT INTO SU_contractor VALUES(44, 'Zed Zand', 'YK9 981', 'Developer',4,'DBA', '01/09/2010');
INSERT INTO SU_contractor VALUES(50, 'Liam Smith', 'YK12 985', 'Developer',4,'DBA', '01/11/2010');
INSERT INTO SU_contractor VALUES(51, 'Mandy Moore', 'YK12 982', 'Developer',4,'Developer', '01/12/2010');
INSERT INTO SU_contractor VALUES(52, 'Neil Smith', 'YK12 983', 'Developer',4,'Developer', '01/01/2010');
INSERT INTO SU_contractor VALUES(53, 'Ollie Over', 'YK12 984', 'DBA',4,'Analyst', '01/01/2010');
INSERT INTO SU_contractor VALUES(54, 'Petra Pot', 'YK12 981', 'Developer',6,'Developer', '01/11/2010');
INSERT INTO SU_contractor VALUES(55, 'Queen Que', 'YK12 982', 'Analyst',4,'Developer', '01/12/2010');
INSERT INTO SU_contractor VALUES(56, 'Rich Roberts', 'YK12 982', 'Developer',5, 'DBA', '01/03/2010');
INSERT INTO SU_contractor VALUES(57, 'Steph Son', 'YK14 981', 'Analayst',4,'Developer', '01/04/2010');
INSERT INTO SU_contractor VALUES(58, 'Tim Tiny', 'YK14 981', 'Developer',4,'DBA', '01/07/2010');
INSERT INTO SU_contractor VALUES(59, 'Ullah Upworth', 'YK14 981', 'Analyst',4,'Developer', '01/05/2010');
INSERT INTO SU_contractor VALUES(60, 'Vera vale', 'YK14 981', 'Developer',4,'DBA', '01/01/2010');
INSERT INTO SU_contractor VALUES(61, 'Wesley Walsh', 'YK14 981', 'Developer',7,'Developer','01/08/2010');
INSERT INTO SU_contractor VALUES(62, 'Xio Xem', 'YK14 981', 'Analayst',7,'Developer', '01/01/2010');
INSERT INTO SU_contractor VALUES(63, 'Yvonne Yelts', 'YK14 981', 'DBA',7,'Developer', '01/01/2010');
INSERT INTO SU_contractor VALUES(64, 'Zed Zebra', 'YK14 981','Analayst',4,'Developer', '01/01/2010');

-------------------



-- SU_contractor_cv 

DELETE FROM SU_contractor_cv;



INSERT INTO SU_contractor_cv VALUES (1, 'DBA at Asda', 'DBA', '01/01/2007', '01/01/2008', 10);
INSERT INTO SU_contractor_cv VALUES (2, 'Head DBA at Asda', 'DBA', '01/01/2005', '01/01/2014', 10);
INSERT INTO SU_contractor_cv VALUES (3, 'Student', 'Student', '01/01/2012', '01/01/2015', 11);
INSERT INTO SU_contractor_cv VALUES (4, 'Programmer for accenture', 'Developer', '01/01/2001', '01/01/2002', 12);
INSERT INTO SU_contractor_cv VALUES (5, 'Programmer for venturer', 'Developer', '01/01/2003', '01/01/2004', 12);
INSERT INTO SU_contractor_cv VALUES (6, 'Programmer for WH', 'Developer', '01/01/2008', '01/01/2015', 12);
INSERT INTO SU_contractor_cv VALUES (7, 'PM at NHS', 'project manager', '01/01/2011', '01/01/2012', 13);
INSERT INTO SU_contractor_cv VALUES (8, 'Chief Operating Officer', 'Management', '01/01/2000', '01/01/2014', 13);
INSERT INTO SU_contractor_cv VALUES (9, 'Student', 'Student', '01/01/2012', '01/01/2015', 14);
INSERT INTO SU_contractor_cv VALUES (10, 'Developer for accenture', 'Developer', '01/01/2007', '01/01/2008', 15);
INSERT INTO SU_contractor_cv VALUES (11, 'Developer for venturer', 'Developer', '01/01/2002', '01/01/2004', 15);
INSERT INTO SU_contractor_cv VALUES (12, 'Developer for WH', 'Developer', '01/01/2004', '01/01/2015', 15);



-------------------


-- SU_job 


DELETE FROM SU_job;

DROP sequence SU_plc_seq;
Create sequence SU_plc_seq MINVALUE 1 MAXVALUE 9999999 INCREMENT BY 1 START WITH 1;

INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/01/2010', '01/03/2010', '01/01/2010', '01/03/2010', 33000, 10, 13, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/03/2010', '01/06/2010', '01/03/2010', '01/06/2010', 33000, 10, 30, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/06/2010', '01/09/2010', '01/06/2010', '01/09/2010', 33000, 10, 33, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/09/2010', '01/12/2010', '01/09/2010', '01/12/2010', 23000, 10, 23, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/01/2011', '01/03/2011', '01/01/2011', '01/03/2011', 33000, 10, 43, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/03/2011', '01/06/2011', '01/03/2011', '01/06/2011', 13000, 10, 53, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/06/2011', '01/09/2011', '01/06/2011', '01/09/2011', 33000, 10, 63, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/09/2011', '01/12/2011', '01/09/2011', '01/12/2011', 23000, 10, 13, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/01/2012', '01/03/2012', '01/01/2012', '01/03/2012', 33000, 10, 23, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/03/2012', '01/06/2012', '01/03/2012', '01/06/2012', 43000, 10, 33, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/06/2012', '01/09/2012', '01/06/2012', '01/09/2012', 63000, 10, 30, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/09/2012', '01/12/2012', '01/09/2012', '01/12/2012', 33000, 10, 31, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/01/2013', '01/03/2013', '01/01/2013', '01/03/2013', 43000, 10, 32, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/03/2013', '01/06/2013', '01/03/2013', '01/06/2013', 33000, 10, 33, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/06/2013', '01/09/2013', '01/06/2013', '01/09/2013', 33000, 10, 37, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/09/2013', '01/12/2013', '01/09/2013', '01/12/2013', 33000, 10, 32, 'john');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/01/2014', '01/03/2014', '01/01/2014', '01/03/2014', 33000, 10, 30, 'alan');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/03/2014', '01/06/2014', '01/03/2014', '01/06/2014', 33000, 10, 31, 'alan');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/06/2014', '01/09/2014', '01/06/2014', '01/09/2014', 30000, 10, 31, 'alan');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/09/2014', '01/12/2014', '01/09/2014', '01/12/2014', 20000, 10, 32, 'alan');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/01/2015', '01/03/2015', '01/01/2015', '01/03/2015', 21000, 10, 33, 'alan');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/03/2015', '01/06/2015', '01/03/2015', '01/06/2015', 40000, 10, 34, 'alan');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/06/2015', '01/09/2015', '01/06/2015', '01/09/2015', 70000, 10, 43, 'alan');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/09/2015', '01/12/2015', '01/09/2015', '01/12/2015', 32000, 10, 33, 'alan');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Apex Developer M' || chr(38) || 'S', '01/01/2010', '01/03/2010', '01/01/2010', '01/03/2010', 33000, 10, 13, 'alan');

INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/03/2010', '01/06/2010', '01/03/2010', '01/06/2010', 33000, 20, 12, 'alan');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/06/2010', '01/09/2010', '01/06/2010', '01/09/2010', 33000, 20, 13, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/09/2010', '01/12/2010', '01/09/2010', '01/12/2010', 33000, 20, 14, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/01/2011', '01/03/2011', '01/01/2011', '01/03/2011', 33000, 20, 15, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/03/2011', '01/06/2011', '01/03/2011', '01/06/2011', 33000, 20, 17, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/06/2011', '01/09/2011', '01/06/2011', '01/09/2011', 33000, 20, 18, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/09/2011', '01/12/2011', '01/09/2011', '01/12/2011', 33000, 20, 19, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/01/2012', '01/03/2012', '01/01/2012', '01/03/2012', 33000, 20, 20, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/03/2012', '01/06/2012', '01/03/2012', '01/06/2012', 43000, 20, 11, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/06/2012', '01/09/2012', '01/06/2012', '01/09/2012', 33000, 20, 12, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/09/2012', '01/12/2012', '01/09/2012', '01/12/2012', 33000, 20, 13, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/01/2013', '01/03/2013', '01/01/2013', '01/03/2013', 33000, 20, 14, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/03/2013', '01/06/2013', '01/03/2013', '01/06/2013', 33000, 20, 15, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/06/2013', '01/09/2013', '01/06/2013', '01/09/2013', 33000, 20, 12, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/09/2013', '01/12/2013', '01/09/2013', '01/12/2013', 33000, 20, 16, 'paul');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/01/2014', '01/03/2014', '01/01/2014', '01/03/2014', 33000, 20, 17, 'simon');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/03/2014', '01/06/2014', '01/03/2014', '01/06/2014', 43000, 20, 18, 'paul');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/06/2014', '01/09/2014', '01/06/2014', '01/09/2014', 33000, 20, 19, 'paul');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/09/2014', '01/12/2014', '01/09/2014', '01/12/2014', 33000, 20, 11, 'paul');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/01/2015', '01/03/2015', '01/01/2015', '01/03/2015', 33000, 20, 12, 'paul');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/03/2015', '01/06/2015', '01/03/2015', '01/06/2015', 33000, 20, 11, 'paul');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/06/2015', '01/09/2015', '01/06/2015', '01/09/2015', 33000, 20, 12, 'paul');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Traninee BI', '01/09/2015', '01/12/2015', '01/09/2015', '01/12/2015', 33000, 20, 13, 'paul');

INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'data analyst', '01/01/2010', '01/03/2010', '01/01/2010', '01/03/2010',33000, 30, 31, 'paul');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'data analyst', '01/03/2010', '01/06/2010', '01/03/2010', '01/06/2010',33000, 30, 41, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'data analyst', '01/06/2010', '01/09/2010', '01/06/2010', '01/09/2010',33000, 30, 51, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'data analyst', '01/09/2010', '01/12/2010', '01/09/2010', '01/12/2010', 33000, 30,61, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/01/2011', '01/03/2011', '01/01/2011', '01/03/2011', 33000, 30, 11, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/03/2011', '01/06/2011', '01/03/2011', '01/06/2011',33000, 23, 31, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/06/2011', '01/09/2011', '01/06/2011', '01/09/2011', 33000, 30,41, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/09/2011', '01/12/2011', '01/09/2011', '01/12/2011', 33000, 30, 51, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/01/2012', '01/03/2012', '01/01/2012', '01/03/2012', 33000, 30, 71, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/03/2012', '01/06/2012', '01/03/2012', '01/06/2012', 33000, 30, 81, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/06/2012', '01/09/2012', '01/06/2012', '01/09/2012', 53000, 30, 41, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/09/2012', '01/12/2012', '01/09/2012', '01/12/2012', 33000, 30, 21, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/01/2013', '01/03/2013', '01/01/2013', '01/03/2013', 33000, 30, 31, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/03/2013', '01/06/2013', '01/03/2013', '01/06/2013',33000, 30, 13, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/06/2013', '01/09/2013', '01/06/2013', '01/09/2013', 33000, 30, 41, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/09/2013', '01/12/2013', '01/09/2013', '01/12/2013', 33000, 30, 51, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/01/2014', '01/03/2014', '01/01/2014', '01/03/2014',33000, 30, 31, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/03/2014', '01/06/2014', '01/03/2014', '01/06/2014', 33000, 30, 21, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/06/2014', '01/09/2014', '01/06/2014', '01/09/2014', 33000, 30, 11, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'Db programmer', '01/09/2014', '01/12/2014', '01/09/2014', '01/12/2014', 33000, 30, 41, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'data analyst', '01/01/2015', '01/03/2015', '01/01/2015', '01/03/2015',33000, 30, 51, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'data analyst', '01/03/2015', '01/06/2015', '01/03/2015', '01/06/2015', 33000, 30, 11, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'data analyst', '01/06/2015', '01/09/2015', '01/06/2015', '01/09/2015', 33000, 30, 21, 'colin');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'data analyst', '01/09/2015', '01/12/2015', '01/09/2015', '01/12/2015', 33000, 30, 21, 'colin');

INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/01/2010', '01/03/2010', '01/01/2010', '01/03/2010', 33000, 40, 51, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/03/2010', '01/06/2010', '01/03/2010', '01/06/2010', 33000, 40, 52, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/06/2010', '01/09/2010', '01/06/2010', '01/09/2010', 33000, 40, 53, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/09/2010', '01/12/2010', '01/09/2010', '01/12/2010', 33000, 40, 53, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/01/2011', '01/03/2011', '01/01/2011', '01/03/2011', 33000, 40, 54, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/03/2011', '01/06/2011', '01/03/2011', '01/06/2011', 23000, 40, 55, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/06/2011', '01/09/2011', '01/06/2011', '01/09/2011', 33000, 40, 56, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/09/2011', '01/12/2011', '01/09/2011', '01/12/2011', 33000, 40, 51, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/01/2012', '01/03/2012', '01/01/2012', '01/03/2012', 33000, 40, 52, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/03/2012', '01/06/2012', '01/03/2012', '01/06/2012', 33000, 40, 53, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/06/2012', '01/09/2012', '01/06/2012', '01/09/2012', 33000, 40, 54, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/09/2012', '01/12/2012', '01/09/2012', '01/12/2012', 33000, 40, 55, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '06/06/2063', '01/03/2013', '01/01/2013', '01/03/2013', 33000, 40, 56, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/09/2013', '01/06/2013', '01/03/2013', '01/06/2013', 33000, 40, 52, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/06/2013', '01/09/2013', '01/06/2013', '01/09/2013', 33000, 40, 55, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/09/2013', '01/12/2013', '01/09/2013', '01/12/2013', 33000, 40, 56, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/01/2014', '01/03/2014', '01/01/2014', '01/03/2014', 33000, 40, 54, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/03/2014', '01/06/2014', '01/03/2014', '01/06/2014', 33000, 40, 53, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/06/2014', '01/09/2014', '01/06/2014', '01/09/2014', 33000, 40, 52, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/09/2014', '01/12/2014', '01/09/2014', '01/12/2014', 33000, 40, 51, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/01/2015', '01/03/2015', '01/01/2015', '01/03/2015', 33000, 40, 55, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/03/2015', '01/06/2015', '01/03/2015', '01/06/2015', 33000, 40, 52, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/06/2015', '01/09/2015', '01/06/2015', '01/09/2015', 33000, 40, 15, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'developer', '01/09/2015', '01/12/2015', '01/09/2015', '01/12/2015', 33000, 40, 50, 'steve');

INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/01/2010', '01/03/2010', '01/01/2010', '01/03/2010', 33000, 80, 61, 'steve');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/03/2010', '01/06/2010', '01/03/2010', '01/06/2010', 33000, 80, 21, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/06/2010', '01/09/2010', '01/06/2010', '01/09/2010',33000, 80, 62, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/09/2010', '01/12/2010', '01/09/2010', '01/12/2010', 33000, 80, 63, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/01/2011', '01/03/2011', '01/01/2011', '01/03/2011', 33000, 80, 64, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/03/2011', '01/06/2011', '01/03/2011', '01/06/2011', 33000, 80, 61, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/06/2011', '01/09/2011', '01/06/2011', '01/09/2011',33000, 80, 62, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/09/2011', '01/12/2011', '01/09/2011', '01/12/2011', 33000, 80, 63, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/01/2012', '01/03/2012', '01/01/2012', '01/03/2012', 33000, 80, 64, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/03/2012', '01/06/2012', '01/03/2012', '01/06/2012', 33000, 80, 65, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/06/2012', '01/09/2012', '01/06/2012', '01/09/2012', 33000, 80, 62, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/09/2012', '01/12/2012', '01/09/2012', '01/12/2012', 33000, 80, 61, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/01/2013', '01/03/2013', '01/01/2013', '01/03/2013', 33000, 80, 62, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/03/2013', '01/06/2013', '01/03/2013', '01/06/2013', 33000, 80, 53, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/06/2013', '01/09/2013', '01/06/2013', '01/09/2013', 33000, 80, 13, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/09/2013', '01/12/2013', '01/09/2013', '01/12/2013', 33000, 80, 18, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/01/2014', '01/03/2014', '01/01/2014', '01/03/2014', 33000, 80, 23, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/03/2014', '01/06/2014', '01/03/2014', '01/06/2014', 33000, 80, 61, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/06/2014', '01/09/2014', '01/06/2014', '01/09/2014', 33000, 80, 62, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/09/2014', '01/12/2014', '01/09/2014', '01/12/2014', 33000, 80, 63, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/01/2015', '01/03/2015', '01/01/2015', '01/03/2015', 33000, 80, 64, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/03/2015', '01/06/2015', '01/03/2015', '01/06/2015', 33000, 80, 61, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/06/2015', '01/09/2015', '01/06/2015', '01/09/2015', 33000, 80, 13, 'ali');
INSERT INTO SU_job VALUES (SU_plc_seq.nextval, 'BI Analyst', '01/09/2015', '01/12/2015', '01/09/2015', '01/12/2015', 33000, 80, 11, 'ali');

