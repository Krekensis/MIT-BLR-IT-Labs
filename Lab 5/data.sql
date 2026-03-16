INSERT ALL
INTO Department VALUES (5,'Research',NULL,NULL)
INTO Department VALUES (4,'Administration',NULL,NULL)
INTO Department VALUES (1,'Headquarters',NULL,NULL)
SELECT * FROM DUAL;

INSERT ALL
INTO Employee VALUES ('1','John','B','Smith','1965-01-09','Houston, Texas','M',30000,5,NULL)
INTO Employee VALUES ('2','Franklin','T','Wong','1955-12-08','Houston, Texas','M',40000,5,'1')
INTO Employee VALUES ('3','Alicia','J','Zelaya','1968-01-19','Spring, Texas','F',25000,4,'1')
INTO Employee VALUES ('4','Jennifer','S','Wallace','1941-06-20','Bellaire, Texas','F',43000,4,NULL)
INTO Employee VALUES ('5','Ramesh','K','Narayan','1962-09-15','Houston, Texas','M',38000,5,'1')
INTO Employee VALUES ('6','Joyce','A','English','1972-07-31','Houston, Texas','F',25000,5,'2')
INTO Employee VALUES ('7','Ahmad','V','Jabbar','1969-03-29','Houston, Texas','M',25000,5,'2')
SELECT * FROM DUAL;

UPDATE Department SET Mgr_ssn='1',Mgr_start_date='2005-01-01' WHERE Dnumber=5;
UPDATE Department SET Mgr_ssn='4',Mgr_start_date='2004-01-01' WHERE Dnumber=4;
UPDATE Department SET Mgr_ssn='2',Mgr_start_date='2006-01-01' WHERE Dnumber=1;

INSERT ALL
INTO Project VALUES (1,'ProductX','Houston',5)
INTO Project VALUES (2,'ProductY','Stanford',5)
INTO Project VALUES (3,'ProductZ','Stanford',4)
SELECT * FROM DUAL;

INSERT ALL
INTO Works_On VALUES ('1',1,32)
INTO Works_On VALUES ('2',1,20)
INTO Works_On VALUES ('5',1,20)
INTO Works_On VALUES ('6',2,10)
INTO Works_On VALUES ('7',2,10)
INTO Works_On VALUES ('3',3,15)
SELECT * FROM DUAL;

INSERT ALL
INTO Dependent VALUES ('1','John','M','2000-01-01','Son')
INTO Dependent VALUES ('2','Alice','F','2001-02-02','Daughter')
INTO Dependent VALUES ('4','Mark','M','1998-03-03','Son')
SELECT * FROM DUAL;