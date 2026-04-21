CREATE OR REPLACE PROCEDURE greet_message IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Good Day to You');
END;
/
BEGIN
    greet_message;
END;
/
--Good Day to You

CREATE OR REPLACE PROCEDURE dept_info(dn IN VARCHAR2) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Instructors in ' || dn || ':');
    FOR rec IN (SELECT name FROM Instructor WHERE dept_name = dn) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.name);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Courses in ' || dn || ':');
    FOR rec IN (SELECT title FROM Course WHERE dept_name = dn) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.title);
    END LOOP;
END;
/
BEGIN
    dept_info('CSE');
END;
/
/*
Instructors in CSE: 
Dr Rao
Courses in CSE:
OS
Networks
Algorithms
DBMS
*/


CREATE OR REPLACE PROCEDURE course_popular(dn IN VARCHAR2) IS
    v_title Course.title%TYPE;
BEGIN
    SELECT title INTO v_title
    FROM (
        SELECT c.title, COUNT(t.ID) cnt
        FROM Course c
        LEFT JOIN Takes t ON c.course_id = t.course_id
        WHERE c.dept_name = dn
        GROUP BY c.title
        ORDER BY cnt DESC
    )
    WHERE ROWNUM = 1;
    DBMS_OUTPUT.PUT_LINE('Most popular course in ' || dn || ' is ' || v_title);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No course data found for ' || dn);
END;
/
BEGIN
    FOR rec IN (SELECT dept_name FROM Department) LOOP
        course_popular(rec.dept_name);
    END LOOP;
END;

/*
Most popular course in Biology is Genetics
Most popular course in CE is Structures
Most popular course in CSE is DBMS
Most popular course in ECE is Signals
Most popular course in EEE is Circuits
Most popular course in ME is Thermo
Most popular course in Math is Calculus
Most popular course in Physics is Optics*/

CREATE OR REPLACE PROCEDURE dept_students_courses(dn IN VARCHAR2) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Students in ' || dn || ':');
    FOR rec IN (SELECT name FROM Students WHERE dept_name = dn) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.name);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Courses in ' || dn || ':');
    FOR rec IN (SELECT title FROM Course WHERE dept_name = dn) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.title);
    END LOOP;
END;
/
BEGIN
    dept_students_courses('CSE');
END;
/*
Students in CSE:
Rahul
Priya
Asha
Dr Black
Dr Grey
Dr Rao
Courses in CSE:
OS
Networks
Algorithms
DBMS*/

CREATE OR REPLACE FUNCTION square_num(p_num IN NUMBER) RETURN NUMBER IS
BEGIN
    RETURN p_num * p_num;
END;
/
DECLARE
    v_result NUMBER;
BEGIN
    v_result := square_num(7);
    DBMS_OUTPUT.PUT_LINE('Square is: ' || v_result);
END;
/
/*Square is: 49*/

CREATE OR REPLACE FUNCTION department_highest(dn IN VARCHAR2)
RETURN VARCHAR2 IS
    v_name Instructor.name%TYPE;
BEGIN
    SELECT name INTO v_name
    FROM (
        SELECT name
        FROM Instructor
        WHERE dept_name = dn
        ORDER BY salary DESC
    )
    WHERE ROWNUM = 1;
    RETURN v_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No instructor found';
END;
/
BEGIN
    FOR rec IN (SELECT dept_name FROM Department) LOOP
        DBMS_OUTPUT.PUT_LINE('Highest paid in ' || rec.dept_name || ': ' || department_highest(rec.dept_name));
    END LOOP;
END;
/
/*Highest paid in Biology: Dr White
Highest paid in CE: Dr Kumar
Highest paid in CSE: Dr Rao
Highest paid in ECE: Dr Mehta
Highest paid in EEE: Dr Shah
Highest paid in ME: Dr Singh
Highest paid in Math: No instructor found
Highest paid in Physics: Dr Brown*/

CREATE OR REPLACE PACKAGE dept_pkg IS
    PROCEDURE list_instructors(dn IN VARCHAR2);
    FUNCTION max_salary(dn IN VARCHAR2) RETURN NUMBER;
END dept_pkg;
/
CREATE OR REPLACE PACKAGE BODY dept_pkg IS
    PROCEDURE list_instructors(dn IN VARCHAR2) IS
    BEGIN
        FOR rec IN (SELECT name FROM Instructor WHERE dept_name = dn) LOOP
            DBMS_OUTPUT.PUT_LINE(rec.name);
        END LOOP;
    END;
    FUNCTION max_salary(dn IN VARCHAR2) RETURN NUMBER IS
        v_sal NUMBER;
    BEGIN
        SELECT MAX(salary) INTO v_sal FROM Instructor WHERE dept_name = dn;
        RETURN v_sal;
    END;
END dept_pkg;
/
BEGIN
    dept_pkg.list_instructors('Physics');
    DBMS_OUTPUT.PUT_LINE('Max salary in Physics: ' || dept_pkg.max_salary('Physics'));
END;
/
/*Dr Brown
Max salary in Physics: 95550*/

CREATE OR REPLACE PROCEDURE calc_interest(
    p_principle IN NUMBER,
    p_rate      IN NUMBER,
    p_years     IN NUMBER,
    p_simple    OUT NUMBER,
    p_compound  OUT NUMBER,
    p_total     IN OUT NUMBER
) IS
BEGIN
    p_simple := (p_principle * p_rate * p_years) / 100;
    p_compound := p_principle * POWER((1 + p_rate/100), p_years) - p_principle;
    p_total := p_principle + p_simple + p_compound;
END;
/
DECLARE
    v_simple   NUMBER;
    v_compound NUMBER;
    v_total    NUMBER := 0;
BEGIN
    calc_interest(1000, 5, 2, v_simple, v_compound, v_total);
    DBMS_OUTPUT.PUT_LINE('Simple Interest: ' || v_simple);
    DBMS_OUTPUT.PUT_LINE('Compound Interest: ' || v_compound);
    DBMS_OUTPUT.PUT_LINE('Total Sum: ' || v_total);
END;
/
/*Simple Interest: 100
Compound Interest: 102.5
Total Sum: 1202.5
*/