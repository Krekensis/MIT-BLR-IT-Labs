-- GROUP BY

-- 1. Find the number of students in each course.
SELECT course_id, COUNT(DISTINCT id) AS student_count
FROM Takes
GROUP BY course_id;

-- 2. Find departments where average number of students > 10.
SELECT c.dept_name
FROM Course c
JOIN Takes t ON c.course_id = t.course_id
GROUP BY c.dept_name
HAVING COUNT(t.id) / COUNT(DISTINCT c.course_id) > 2;

-- 3. Find the total number of courses in each department.
SELECT dept_name, COUNT(*) AS total_courses
FROM Course
GROUP BY dept_name;

-- 4. Find department names and avg salary where avg salary > 42000.
SELECT dept_name, AVG(salary) AS avg_salary
FROM Instructor
GROUP BY dept_name
HAVING AVG(salary) > 42000;

-- 5. Find enrolment of each section in Spring 2025.
SELECT course_id, section_id, COUNT(id) AS enrolment
FROM Takes
WHERE semester = 'Spring' AND year = 2025
GROUP BY course_id, section_id;

-- ORDER BY

-- 6. List all courses with prerequisite courses ordered ascending.
SELECT course_id, prereq_id
FROM Prereq
ORDER BY course_id ASC;

-- 7. Display instructors sorted by salary descending.
SELECT *
FROM Instructor
ORDER BY salary DESC;

-- DERIVED RELATIONS

-- 8. Find maximum total salary across departments.
SELECT MAX(total_salary)
FROM (
    SELECT SUM(salary) AS total_salary
    FROM Instructor
    GROUP BY dept_name
);

-- 9. Avg instructor salaries where avg > 42000.
SELECT dept_name, AVG(salary)
FROM Instructor
GROUP BY dept_name
HAVING AVG(salary) > 42000;

-- 10. Sections with maximum enrolment in Spring 2026.
SELECT course_id, section_id
FROM (
    SELECT course_id, section_id, COUNT(id) AS cnt
    FROM Takes
    WHERE semester = 'Spring' AND year = 2026
    GROUP BY course_id, section_id
)
WHERE cnt = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(id) AS cnt
        FROM Takes
        WHERE semester = 'Spring' AND year = 2026
        GROUP BY course_id, section_id
    )
);

-- 11. Instructors who teach ALL CSE students.
SELECT i.name
FROM Instructor i
WHERE NOT EXISTS (
    SELECT s.id
    FROM Students s
    WHERE s.dept_name = 'CSE'
    AND NOT EXISTS (
        SELECT *
        FROM Teaches t
        JOIN Takes tk
        ON t.course_id = tk.course_id
        AND t.section_id = tk.section_id
        WHERE t.id = i.id
        AND tk.id = s.id
    )
);

-- 12. Avg salary where avg > 50000 AND instructors > 3.
SELECT dept_name, AVG(salary)
FROM Instructor
GROUP BY dept_name
HAVING AVG(salary) > 50000
AND COUNT(*) > 3;

-- WITH CLAUSE

-- 13. Departments with maximum budget.
WITH max_budget AS (
    SELECT MAX(budget) AS mb FROM Department
)
SELECT dept_name
FROM Department, max_budget
WHERE budget = mb;

-- 14. Departments where total salary > avg total salary.
WITH dept_salary AS (
    SELECT dept_name, SUM(salary) AS total_sal
    FROM Instructor
    GROUP BY dept_name
),
avg_sal AS (
    SELECT AVG(total_sal) AS avg_total FROM dept_salary
)
SELECT dept_name
FROM dept_salary, avg_sal
WHERE total_sal > avg_total;

-- 15. Sections with maximum enrolment in Fall 2025.
WITH sec_count AS (
    SELECT course_id, section_id, COUNT(id) AS cnt
    FROM Takes
    WHERE semester = 'Fall' AND year = 2025
    GROUP BY course_id, section_id
)
SELECT course_id, section_id
FROM sec_count
WHERE cnt = (SELECT MAX(cnt) FROM sec_count);

-- 16. Departments where total student credits > finance dept.
WITH dept_credits AS (
    SELECT dept_name, SUM(tot_cred) AS total_cred
    FROM Students
    GROUP BY dept_name
),
fin_total AS (
    SELECT total_cred
    FROM dept_credits
    WHERE dept_name = 'FIN'
)
SELECT dept_name
FROM dept_credits
WHERE total_cred > (SELECT total_cred FROM fin_total);
