-- 1. Birth date & address of John B Smith; employees working in Research department
SELECT Bdate,Address
FROM Employee
WHERE Fname='John' AND Minit='B' AND Lname='Smith';

SELECT Fname,Lname,Address
FROM Employee E JOIN Department D
ON E.Dnumber=D.Dnumber
WHERE D.Dname='Research';

-- 2. Projects in Stanford with department manager details
SELECT P.Pnumber,P.Dnumber,E.Lname,E.Address,E.Bdate
FROM Project P
JOIN Department D ON P.Dnumber=D.Dnumber
JOIN Employee E ON D.Mgr_ssn=E.Ssn
WHERE P.Plocation='Stanford';

-- 3. All distinct employee salaries
SELECT DISTINCT Salary
FROM Employee;

-- 4. Employee name with immediate supervisor name
SELECT E.Fname,E.Lname,S.Fname,S.Lname
FROM Employee E
LEFT JOIN Employee S
ON E.Super_ssn=S.Ssn;

-- 5. Project numbers involving employees named Smith (worker or manager)
SELECT DISTINCT P.Pnumber
FROM Project P
JOIN Works_On W ON P.Pnumber=W.Pnumber
JOIN Employee E ON W.Essn=E.Ssn
WHERE E.Lname='Smith'
UNION
SELECT P.Pnumber
FROM Project P
JOIN Department D ON P.Dnumber=D.Dnumber
JOIN Employee E ON D.Mgr_ssn=E.Ssn
WHERE E.Lname='Smith';

-- 6. Employees living in Houston
SELECT Ssn, Fname
FROM Employee
WHERE Address LIKE '%Houston%';

-- 7. Salaries after 10% raise for employees working on ProductX
SELECT E.Fname,E.Lname,E.Salary*1.1
FROM Employee E
JOIN Works_On W ON E.Ssn=W.Essn
JOIN Project P ON W.Pnumber=P.Pnumber
WHERE P.Pname='ProductX';

-- 8. Employees in department 5 with salary between 30000 and 40000
SELECT Ssn, Fname
FROM Employee
WHERE Dnumber=5
AND Salary BETWEEN 30000 AND 40000;

-- 9. Employees and projects they work on, ordered by department then name
SELECT D.Dname,E.Lname,E.Fname,P.Pname
FROM Employee E
JOIN Works_On W ON E.Ssn=W.Essn
JOIN Project P ON W.Pnumber=P.Pnumber
JOIN Department D ON E.Dnumber=D.Dnumber
ORDER BY D.Dname,E.Lname,E.Fname;

-- 10. Employees with no supervisor
SELECT Fname,Lname
FROM Employee
WHERE Super_ssn IS NULL;

-- 11. Employees with a dependent having same name and same sex
SELECT E.Fname,E.Lname
FROM Employee E
JOIN Dependent D
ON E.Ssn=D.Essn
WHERE E.Fname=D.Dependent_name
AND E.Sex=D.Sex;

-- 12. Employees who have no dependents
SELECT Fname,Lname
FROM Employee E
WHERE NOT EXISTS
(SELECT * FROM Dependent D WHERE D.Essn=E.Ssn);

-- 13. Managers who have at least one dependent
SELECT E.Fname,E.Lname
FROM Employee E
JOIN Department D ON E.Ssn=D.Mgr_ssn
WHERE EXISTS
(SELECT * FROM Dependent DP WHERE DP.Essn=E.Ssn);

-- 14. SSNs of employees working on projects 1, 2, or 3
SELECT DISTINCT Essn
FROM Works_On
WHERE Pnumber IN (1,2,3);

-- 15. Total, max, min, and average employee salary
SELECT SUM(Salary),MAX(Salary),MIN(Salary),ROUND(AVG(Salary), 2) AS AVG_SALARY
FROM Employee;

-- 16. Total, max, min, avg salary of employees in Research department
SELECT SUM(Salary),MAX(Salary),MIN(Salary),ROUND(AVG(Salary), 2) AS AVG_SALARY
FROM Employee E
JOIN Department D
ON E.Dnumber=D.Dnumber
WHERE D.Dname='Research';

-- 17. Number of employees working on each project
SELECT P.Pnumber,P.Pname,COUNT(W.Essn)
FROM Project P
LEFT JOIN Works_On W
ON P.Pnumber=W.Pnumber
GROUP BY P.Pnumber,P.Pname;

-- 18. Projects with more than two employees working on them
SELECT P.Pnumber,P.Pname,COUNT(W.Essn)
FROM Project P
JOIN Works_On W
ON P.Pnumber=W.Pnumber
GROUP BY P.Pnumber,P.Pname
HAVING COUNT(W.Essn)>2;

-- 19. Departments with employees earning more than 40000 (count per department)
SELECT Dnumber,COUNT(*)
FROM Employee
WHERE Salary>40000
GROUP BY Dnumber
HAVING COUNT(*)>0;