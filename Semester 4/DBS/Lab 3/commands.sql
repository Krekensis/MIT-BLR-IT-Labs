-- SET OPERATIONS

-- 1. Courses that ran in Fall 2025 OR Spring 2026
SELECT course_id FROM Section
WHERE semester = 'Fall' AND year = 2025
UNION ALL
SELECT course_id FROM Section
WHERE semester = 'Spring' AND year = 2026;

-- 2. Courses that ran in Fall 2025 AND Spring 2026
SELECT course_id FROM Section
WHERE semester = 'Fall' AND year = 2025
INTERSECT
SELECT course_id FROM Section
WHERE semester = 'Spring' AND year = 2026;

-- 3. Courses in Fall 2025 but NOT Spring 2026
SELECT course_id FROM Section
WHERE semester = 'Fall' AND year = 2025
MINUS
SELECT course_id FROM Section
WHERE semester = 'Spring' AND year = 2026;

-- 4. Courses for which no student registered
SELECT title
FROM Course
WHERE course_id NOT IN (
    SELECT DISTINCT course_id FROM Takes
);


-- NESTED SUBQUERIES - SET MEMBERSHIP

-- 5. Courses offered in BOTH Fall 2025 and Spring 2026
SELECT course_id
FROM Section
WHERE semester='Fall' AND year=2025
AND course_id IN (
    SELECT course_id
    FROM Section
    WHERE semester='Spring' AND year=2026
);

-- 6. Total students who took courses taught by instructor 206 (example)
SELECT COUNT(DISTINCT id)
FROM Takes
WHERE course_id IN (
    SELECT course_id
    FROM Teaches
    WHERE id = 206
);

-- 7. Courses in Fall 2025 but not Spring 2026
SELECT course_id
FROM Section
WHERE semester='Fall' AND year=2025
AND course_id NOT IN (
    SELECT course_id
    FROM Section
    WHERE semester='Spring' AND year=2026
);

-- 8. Students whose name matches instructor name
SELECT name
FROM Students
WHERE name IN (
    SELECT name FROM Instructor
);


-- SET COMPARISON (SOME / ALL)

-- 9. Instructors with salary greater than SOME in CSE
SELECT name
FROM Instructor
WHERE salary > SOME (
    SELECT salary
    FROM Instructor
    WHERE dept_name='CSE'
);

-- 10. Instructors with salary greater than ALL in CSE
SELECT name
FROM Instructor
WHERE salary > ALL (
    SELECT salary
    FROM Instructor
    WHERE dept_name='CSE'
);

-- 11. Departments with highest average salary
SELECT dept_name
FROM Instructor
GROUP BY dept_name
HAVING AVG(salary) >= ALL (
    SELECT AVG(salary)
    FROM Instructor
    GROUP BY dept_name
);

-- 12. Departments whose budget < avg instructor salary
SELECT dept_name
FROM Department
WHERE budget < (
    SELECT AVG(salary)
    FROM Instructor
);


-- EXISTS / NOT EXISTS

-- 13. Courses taught in both Fall 2025 and Spring 2026
SELECT DISTINCT s1.course_id
FROM Section s1
WHERE semester='Fall' AND year=2025
AND EXISTS (
    SELECT *
    FROM Section s2
    WHERE s2.course_id=s1.course_id
    AND semester='Spring'
    AND year=2026
);

-- 14. Students who took ALL CSE courses
SELECT name
FROM Students s
WHERE NOT EXISTS (
    SELECT course_id
    FROM Course
    WHERE dept_name='CSE'
    AND NOT EXISTS (
        SELECT *
        FROM Takes t
        WHERE t.id=s.id
        AND t.course_id=Course.course_id
    )
);


-- DUPLICATE TESTING

-- 15. Courses offered at most once in 2025
SELECT course_id
FROM Section
WHERE year=2025
GROUP BY course_id
HAVING COUNT(*) <= 1;

-- 16. Students taking at least 2 CSE courses
SELECT id
FROM Takes
WHERE course_id IN (
    SELECT course_id
    FROM Course
    WHERE dept_name='CSE'
)
GROUP BY id
HAVING COUNT(*) >= 2;


-- SUBQUERY IN FROM CLAUSE

-- 17. Avg salary where department avg > 42000
SELECT dept_name, avg_sal
FROM (
    SELECT dept_name, AVG(salary) avg_sal
    FROM Instructor
    GROUP BY dept_name
)
WHERE avg_sal > 42000;


-- VIEWS

-- 18. View: Physics courses Fall 2025
CREATE VIEW all_courses AS
SELECT s.course_id, building, room_number
FROM Section s
JOIN Course c ON s.course_id=c.course_id
WHERE c.dept_name='MAT'
AND semester='Fall'
AND year=2025;

-- 19. Select from view
SELECT * FROM all_courses;

-- 20. View: department total salary
CREATE VIEW department_total_salary AS
SELECT dept_name, SUM(salary) total_salary
FROM Instructor
GROUP BY dept_name;