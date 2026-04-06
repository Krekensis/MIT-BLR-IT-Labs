--1
DECLARE
    CURSOR c_inst IS
        SELECT ID, salary FROM Instructor WHERE dept_name = 'CSE';

    v_id Instructor.ID%TYPE;
    v_sal Instructor.salary%TYPE;
    v_raise NUMBER;
BEGIN
    OPEN c_inst;
    LOOP
        FETCH c_inst INTO v_id, v_sal;
        EXIT WHEN c_inst%NOTFOUND;

        v_raise := v_sal * 0.05;

        UPDATE Instructor
        SET salary = salary + v_raise
        WHERE ID = v_id;

        INSERT INTO salary_raise VALUES (v_id, SYSDATE, v_raise);
    END LOOP;
    CLOSE c_inst;
END;
/

--2
DECLARE
    CURSOR c_stu IS
        SELECT ID, name, dept_name, tot_cred
        FROM Students
        ORDER BY tot_cred;

    v_rec c_stu%ROWTYPE;
BEGIN
    OPEN c_stu;
    LOOP
        FETCH c_stu INTO v_rec;
        EXIT WHEN c_stu%ROWCOUNT > 10 OR c_stu%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_rec.ID || ' ' || v_rec.name || ' ' ||
            v_rec.dept_name || ' ' || v_rec.tot_cred
        );
    END LOOP;
    CLOSE c_stu;
END;
/

--3
BEGIN
    FOR rec IN (
        SELECT c.course_id, c.title, c.dept_name, c.credits,
               i.name AS instructor_name,
               s.building, s.room_number, s.time_slot_id,
               COUNT(tk.ID) AS tot_student_no
        FROM Course c
        JOIN Section s ON c.course_id = s.course_id
        JOIN Teaches t ON s.course_id = t.course_id
                      AND s.section_id = t.section_id
        JOIN Instructor i ON t.ID = i.ID
        LEFT JOIN Takes tk ON s.course_id = tk.course_id
        GROUP BY c.course_id, c.title, c.dept_name, c.credits,
                 i.name, s.building, s.room_number, s.time_slot_id
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(rec.course_id || ' ' || rec.tot_student_no);
    END LOOP;
END;
/

--4
BEGIN
    FOR rec IN (
        SELECT tk.ID, tk.course_id, tk.section_id,
               tk.semester, tk.year
        FROM Takes tk
        JOIN Students s ON tk.ID = s.ID
        WHERE tk.course_id = 'CS101' AND s.tot_cred < 30
    )
    LOOP
        DELETE FROM Takes
        WHERE ID = rec.ID
        AND course_id = rec.course_id
        AND section_id = rec.section_id
        AND semester = rec.semester
        AND year = rec.year;
    END LOOP;
END;
/

--5
DECLARE
    CURSOR c_stu IS
        SELECT ID, tot_cred, LetterGrade
        FROM StudentTable
        FOR UPDATE;

BEGIN
    UPDATE StudentTable SET LetterGrade = 'F';

    FOR rec IN c_stu LOOP
        UPDATE StudentTable
        SET LetterGrade =
            CASE
                WHEN rec.tot_cred >= 90 THEN 'A'
                WHEN rec.tot_cred >= 75 THEN 'B'
                WHEN rec.tot_cred >= 60 THEN 'C'
                ELSE 'F'
            END
        WHERE CURRENT OF c_stu;
    END LOOP;
END;
/

--6
DECLARE
    CURSOR c_inst(p_course VARCHAR2) IS
        SELECT DISTINCT i.name
        FROM Instructor i
        JOIN Teaches t ON i.ID = t.ID
        WHERE t.course_id = p_course;

BEGIN
    FOR rec IN c_inst('CS101') LOOP
        DBMS_OUTPUT.PUT_LINE(rec.name);
    END LOOP;
END;
/

--7
DECLARE
    CURSOR c_stu IS
        SELECT s.name
        FROM Students s
        JOIN Advisor a ON s.ID = a.s_id
        JOIN Teaches t ON a.i_id = t.ID
        JOIN Takes tk ON s.ID = tk.ID
        WHERE t.course_id = tk.course_id;

BEGIN
    FOR rec IN c_stu LOOP
        DBMS_OUTPUT.PUT_LINE(rec.name);
    END LOOP;
END;
/

--8
DECLARE
    v_budget Department.budget%TYPE;
    v_total  NUMBER;
BEGIN
    SAVEPOINT before_raise;

    UPDATE Instructor
    SET salary = salary * 1.2
    WHERE dept_name = 'Biology';

    SELECT budget INTO v_budget
    FROM Department
    WHERE dept_name = 'Biology';

    SELECT SUM(salary) INTO v_total
    FROM Instructor
    WHERE dept_name = 'Biology';

    IF v_total > v_budget THEN
        ROLLBACK TO before_raise;
    ELSE
        COMMIT;
    END IF;
END;
/