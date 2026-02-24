--SQL QUERIES

-- Q1: John B. Smith Info & Research Dept Employees
SELECT Bdate, Address FROM EMPLOYEE WHERE Fname='John' AND Minit='B' AND Lname='Smith';
SELECT E.Fname, E.Lname, E.Address FROM EMPLOYEE E JOIN DEPARTMENT D ON E.Dno = D.Dnumber WHERE D.Dname = 'Research';

-- Q2: Stanford Projects Info
SELECT P.Pnumber, P.Dnum, E.Lname, E.Address, E.Bdate
FROM PROJECT P 
JOIN DEPARTMENT D ON P.Dnum = D.Dnumber
JOIN EMPLOYEE E ON D.Mgr_ssn = E.Ssn
WHERE P.Plocation = 'Stanford';

-- Q3: Employee and Supervisor Names
SELECT E.Fname AS Emp_Fname, E.Lname AS Emp_Lname, S.Fname AS Sup_Fname, S.Lname AS Sup_Lname
FROM EMPLOYEE E LEFT JOIN EMPLOYEE S ON E.Super_ssn = S.Ssn;

-- Q4: Projects involving 'Smith' (Worker or Manager)
SELECT DISTINCT Pnumber FROM PROJECT WHERE Dnum IN 
  (SELECT Dnumber FROM DEPARTMENT D JOIN EMPLOYEE E ON D.Mgr_ssn = E.Ssn WHERE E.Lname = 'Smith')
UNION
SELECT Pno FROM WORKS_ON W JOIN EMPLOYEE E ON W.Essn = E.Ssn WHERE E.Lname = 'Smith';

-- Q5: 10% Raise for 'ProductX' Workers
SELECT Fname, Lname, Salary * 1.10 AS Raise_Salary
FROM EMPLOYEE E JOIN WORKS_ON W ON E.Ssn = W.Essn JOIN PROJECT P ON W.Pno = P.Pnumber
WHERE P.Pname = 'ProductX';

-- Q6: Employees and Projects ordered by Dept and Name
SELECT D.Dname, E.Lname, E.Fname, P.Pname
FROM DEPARTMENT D JOIN EMPLOYEE E ON D.Dnumber = E.Dno
JOIN WORKS_ON W ON E.Ssn = W.Essn JOIN PROJECT P ON W.Pno = P.Pnumber
ORDER BY D.Dname, E.Lname, E.Fname;

-- Q7: Employee with same name/sex as Dependent
SELECT E.Fname, E.Lname FROM EMPLOYEE E JOIN DEPENDENT D ON E.Ssn = D.Essn 
WHERE E.Fname = D.Dependent_name AND E.Sex = D.Sex;

-- Q8: Employees with no dependents
SELECT Fname, Lname FROM EMPLOYEE WHERE Ssn NOT IN (SELECT Essn FROM DEPENDENT);

-- Q9: Managers with at least one dependent
SELECT DISTINCT E.Fname, E.Lname FROM EMPLOYEE E JOIN DEPARTMENT D ON E.Ssn = D.Mgr_ssn
WHERE EXISTS (SELECT * FROM DEPENDENT WHERE Essn = E.Ssn);

-- Q10: Salary Aggregates
SELECT SUM(Salary), MAX(Salary), MIN(Salary), AVG(Salary) FROM EMPLOYEE;

-- Q11: Count of employees per project
SELECT P.Pnumber, P.Pname, COUNT(W.Essn) FROM PROJECT P LEFT JOIN WORKS_ON W ON P.Pnumber = W.Pno GROUP BY P.Pnumber, P.Pname;

-- Q12: Projects with > 2 employees
SELECT P.Pnumber, P.Pname, COUNT(W.Essn) FROM PROJECT P JOIN WORKS_ON W ON P.Pnumber = W.Pno
GROUP BY P.Pnumber, P.Pname HAVING COUNT(W.Essn) > 2;

-- Q13: Depts with > 5 employees, counting those with Salary > 40000
SELECT Dno, COUNT(*) FROM EMPLOYEE WHERE Salary > 40000 AND Dno IN 
(SELECT Dno FROM EMPLOYEE GROUP BY Dno HAVING COUNT(*) > 5) GROUP BY Dno;
