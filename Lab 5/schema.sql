CREATE TABLE Department(
    Dnumber NUMBER PRIMARY KEY,
    Dname VARCHAR2(50),
    Mgr_ssn CHAR(9),
    Mgr_start_date VARCHAR2(20)
);

CREATE TABLE Employee(
    Ssn CHAR(9) PRIMARY KEY,
    Fname VARCHAR2(20),
    Minit CHAR(1),
    Lname VARCHAR2(20),
    Bdate VARCHAR2(20),
    Address VARCHAR2(100),
    Sex CHAR(1),
    Salary NUMBER,
    Dnumber NUMBER,
    Super_ssn CHAR(9),
    FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber),
    FOREIGN KEY (Super_ssn) REFERENCES Employee(Ssn)
);

ALTER TABLE Department
ADD FOREIGN KEY (Mgr_ssn) REFERENCES Employee(Ssn);

CREATE TABLE Project(
    Pnumber NUMBER PRIMARY KEY,
    Pname VARCHAR2(50),
    Plocation VARCHAR2(50),
    Dnumber NUMBER,
    FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
);

CREATE TABLE Works_On(
    Essn CHAR(9),
    Pnumber NUMBER,
    Hours NUMBER,
    PRIMARY KEY(Essn,Pnumber),
    FOREIGN KEY(Essn) REFERENCES Employee(Ssn),
    FOREIGN KEY(Pnumber) REFERENCES Project(Pnumber)
);

CREATE TABLE Dependent(
    Essn CHAR(9),
    Dependent_name VARCHAR2(50),
    Sex CHAR(1),
    Birth_date VARCHAR2(20),
    Relationship VARCHAR2(20),
    PRIMARY KEY(Essn,Dependent_name),
    FOREIGN KEY(Essn) REFERENCES Employee(Ssn)
);
