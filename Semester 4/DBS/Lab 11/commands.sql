


-- ============================================================
-- EXERCISE 1 — trg_log_takes
-- ============================================================

CREATE OR REPLACE TRIGGER trg_log_takes
AFTER INSERT OR UPDATE OR DELETE
ON Takes
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO log_change_Takes
        VALUES (SYSTIMESTAMP, :NEW.ID, :NEW.course_id, :NEW.section_id,
                :NEW.semester, :NEW.year, :NEW.grade, 'INSERT');
    ELSIF UPDATING THEN
        INSERT INTO log_change_Takes
        VALUES (SYSTIMESTAMP, :OLD.ID, :OLD.course_id, :OLD.section_id,
                :OLD.semester, :OLD.year, :OLD.grade, 'UPDATE');
    ELSIF DELETING THEN
        INSERT INTO log_change_Takes
        VALUES (SYSTIMESTAMP, :OLD.ID, :OLD.course_id, :OLD.section_id,
                :OLD.semester, :OLD.year, :OLD.grade, 'DELETE');
    END IF;
END;
/

/*
EXPECTED OUTPUT:
╔══════════════════════════╦══════╦═══════════╦════════╦══════════╦══════╦═══════╦═══════════╗
║ CHANGED_AT               ║ ID   ║ COURSE_ID ║ SEC_ID ║ SEMESTER ║ YEAR ║ GRADE ║ OPERATION ║
╠══════════════════════════╬══════╬═══════════╬════════╬══════════╬══════╬═══════╬═══════════╣
║ 21-APR-2025 10:15:32     ║ 2003 ║ CS101     ║ A      ║ Fall     ║ 2024 ║ B     ║ INSERT    ║
║ 21-APR-2025 10:15:33     ║ 2001 ║ CS101     ║ A      ║ Fall     ║ 2024 ║ A     ║ UPDATE    ║
║ 21-APR-2025 10:15:34     ║ 2003 ║ CS101     ║ A      ║ Fall     ║ 2024 ║ B     ║ DELETE    ║
╚══════════════════════════╩══════╩═══════════╩════════╩══════════╩══════╩═══════╩═══════════╝
NOTE: Old grade 'A' is logged for the UPDATE (before it became 'A+')
*/


-- ============================================================
-- EXERCISE 2 — trg_archive_instructor_salary
-- ============================================================

CREATE OR REPLACE TRIGGER trg_archive_instructor_salary
BEFORE UPDATE OF salary
ON Instructor
FOR EACH ROW
BEGIN
    INSERT INTO Old_Data_Instructor (ID, name, dept_name, salary)
    VALUES (:OLD.ID, :OLD.name, :OLD.dept_name, :OLD.salary);
END;
/

/*
EXPECTED OUTPUT:
╔══════╦═════════════╦══════════════════╦══════════╗
║ ID   ║ NAME        ║ DEPT_NAME        ║ SALARY   ║
╠══════╬═════════════╬══════════════════╬══════════╣
║ 1001 ║ Alice Smith ║ Computer Science ║ 80000.00 ║
║ 1002 ║ Bob Johnson ║ Mathematics      ║ 60000.00 ║
╚══════╩═════════════╩══════════════════╩══════════╝
NOTE: These are the OLD salaries before update (80000, 60000)
      The Instructor table now has the new values (95000, 72000)
*/


-- ============================================================
-- EXERCISE 3 — trg_validate_instructor
-- ============================================================

CREATE OR REPLACE TRIGGER trg_validate_instructor
BEFORE INSERT OR UPDATE
ON Instructor
FOR EACH ROW
DECLARE
    v_budget Department.budget%TYPE;
BEGIN
    -- (a) Name must contain only alphabets and spaces
    IF NOT REGEXP_LIKE(:NEW.name, '^[A-Za-z ]+$') THEN
        RAISE_APPLICATION_ERROR(-20001,
            'ERROR: Name must contain only alphabets and spaces. Got: "' || :NEW.name || '"');
    END IF;

    -- (b) Salary must be positive and non-zero
    IF :NEW.salary IS NULL OR :NEW.salary <= 0 THEN
        RAISE_APPLICATION_ERROR(-20002,
            'ERROR: Salary must be a positive non-zero value. Got: ' || NVL(TO_CHAR(:NEW.salary),'NULL'));
    END IF;

    -- (c) Salary must not exceed department budget
    BEGIN
        SELECT budget INTO v_budget
        FROM   Department
        WHERE  dept_name = :NEW.dept_name;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20003,
                'ERROR: Department "' || :NEW.dept_name || '" does not exist.');
    END;

    IF :NEW.salary > v_budget THEN
        RAISE_APPLICATION_ERROR(-20004,
            'ERROR: Salary (' || :NEW.salary || ') exceeds dept budget (' || v_budget || ').');
    END IF;
END;
/
/*
EXPECTED OUTPUT:
╔══════╦══════════════╦═════════════╦══════════╗
║ ID   ║ NAME         ║ DEPT_NAME   ║ SALARY   ║
╠══════╬══════════════╬═════════════╬══════════╣
║ 1004 ║ Henry Adams  ║ Mathematics ║ 45000.00 ║
╚══════╩══════════════╩═════════════╩══════════╝
*/

-- ============================================================
-- EXERCISE 4 — trg_audit_client (Transparent Audit)
-- ============================================================

CREATE OR REPLACE TRIGGER trg_audit_client
BEFORE DELETE OR UPDATE
ON Client_master
FOR EACH ROW
BEGIN
    IF DELETING THEN
        INSERT INTO auditclient (client_no, name, bal_due, operation, userid, opdate)
        VALUES (:OLD.client_no, :OLD.name, :OLD.Bal_due, 'DELETE', USER, SYSDATE);
    ELSIF UPDATING THEN
        INSERT INTO auditclient (client_no, name, bal_due, operation, userid, opdate)
        VALUES (:OLD.client_no, :OLD.name, :OLD.Bal_due, 'UPDATE', USER, SYSDATE);
    END IF;
END;
/
/*
EXPECTED OUTPUT (Client_master — C003 is gone, C001 balance updated):
╔═══════════╦══════════════════╦════════════════════════╦══════════╗
║ CLIENT_NO ║ NAME             ║ ADDRESS                ║ BAL_DUE  ║
╠═══════════╬══════════════════╬════════════════════════╬══════════╣
║ C001      ║ Raj Malhotra     ║ 12 MG Road, Bangalore  ║ 18000.00 ║
║ C002      ║ Priya Nair       ║ 5 Brigade Road         ║  8000.00 ║
╚═══════════╩══════════════════╩════════════════════════╩══════════╝
*/

-- ============================================================
-- EXERCISE 5 — INSTEAD OF Trigger on View Advisor_Student
-- ============================================================

-- Step 1: Create the view
CREATE OR REPLACE VIEW Advisor_Student AS
SELECT
    s.ID        AS student_id,
    s.name      AS student_name,
    s.dept_name AS student_dept,
    s.tot_cred,
    i.ID        AS instructor_id,
    i.name      AS instructor_name,
    i.dept_name AS instructor_dept,
    i.salary
FROM
    Advisor     a
    JOIN Students   s ON a.s_id = s.ID
    JOIN Instructor i ON a.i_id = i.ID;

-- ── VERIFY view before trigger ────────────────────────────────
SELECT * FROM Advisor_Student;

/*
EXPECTED OUTPUT (existing advisor relationships):
╔════════════╦══════════════╦══════════════════╦══════════╦═══════════════╦═════════════════╦═══════════════════╦══════════╗
║ STUDENT_ID ║ STUDENT_NAME ║ STUDENT_DEPT     ║ TOT_CRED ║ INSTRUCTOR_ID ║ INSTRUCTOR_NAME ║ INSTRUCTOR_DEPT   ║ SALARY   ║
╠════════════╬══════════════╬══════════════════╬══════════╬═══════════════╬═════════════════╬═══════════════════╬══════════╣
║ 2001       ║ David Lee    ║ Computer Science ║ 45       ║ 1001          ║ Alice Smith     ║ Computer Science  ║ 95000.00 ║
║ 2002       ║ Eva Brown    ║ Mathematics      ║ 30       ║ 1002          ║ Bob Johnson     ║ Mathematics       ║ 72000.00 ║
╚════════════╩══════════════╩══════════════════╩══════════╩═══════════════╩═════════════════╩═══════════════════╩══════════╝
*/

-- Step 2: Create INSTEAD OF INSERT trigger
CREATE OR REPLACE TRIGGER trg_instead_advisor_student
INSTEAD OF INSERT
ON Advisor_Student
FOR EACH ROW
DECLARE
    v_student_count    NUMBER;
    v_instructor_count NUMBER;
    v_advisor_count    NUMBER;
BEGIN
    -- Insert student if not present
    SELECT COUNT(*) INTO v_student_count
    FROM Students WHERE ID = :NEW.student_id;

    IF v_student_count = 0 THEN
        INSERT INTO Students (ID, name, dept_name, tot_cred)
        VALUES (:NEW.student_id, :NEW.student_name, :NEW.student_dept, NVL(:NEW.tot_cred, 0));
        DBMS_OUTPUT.PUT_LINE('New student inserted: ' || :NEW.student_name);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Student already exists: ' || :NEW.student_name);
    END IF;

    -- Insert instructor if not present
    SELECT COUNT(*) INTO v_instructor_count
    FROM Instructor WHERE ID = :NEW.instructor_id;

    IF v_instructor_count = 0 THEN
        INSERT INTO Instructor (ID, name, dept_name, salary)
        VALUES (:NEW.instructor_id, :NEW.instructor_name, :NEW.instructor_dept, :NEW.salary);
        DBMS_OUTPUT.PUT_LINE('New instructor inserted: ' || :NEW.instructor_name);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Instructor already exists: ' || :NEW.instructor_name);
    END IF;

    -- Upsert advisor relationship
    SELECT COUNT(*) INTO v_advisor_count
    FROM Advisor WHERE s_id = :NEW.student_id;

    IF v_advisor_count = 0 THEN
        INSERT INTO Advisor (s_id, i_id)
        VALUES (:NEW.student_id, :NEW.instructor_id);
        DBMS_OUTPUT.PUT_LINE('Advisor link created.');
    ELSE
        UPDATE Advisor SET i_id = :NEW.instructor_id
        WHERE  s_id = :NEW.student_id;
        DBMS_OUTPUT.PUT_LINE('Advisor link updated.');
    END IF;
END;
/

-- Enable DBMS_OUTPUT to see messages
SET SERVEROUTPUT ON;

-- ── VERIFY: View after all insertions ────────────────────────
SELECT * FROM Advisor_Student ORDER BY student_id;

/*
EXPECTED OUTPUT:
╔════════════╦══════════════╦══════════════════╦══════════╦═══════════════╦═════════════════╦═══════════════════╦══════════╗
║ STUDENT_ID ║ STUDENT_NAME ║ STUDENT_DEPT     ║ TOT_CRED ║ INSTRUCTOR_ID ║ INSTRUCTOR_NAME ║ INSTRUCTOR_DEPT   ║ SALARY   ║
╠════════════╬══════════════╬══════════════════╬══════════╬═══════════════╬═════════════════╬═══════════════════╬══════════╣
║ 2001       ║ David Lee    ║ Computer Science ║ 45       ║ 1003          ║ Carol White     ║ Physics           ║ 55000.00 ║  ← advisor changed
║ 2002       ║ Eva Brown    ║ Mathematics      ║ 30       ║ 1002          ║ Bob Johnson     ║ Mathematics       ║ 72000.00 ║
║ 2004       ║ Grace Hopper ║ Computer Science ║ 0        ║ 1001          ║ Alice Smith     ║ Computer Science  ║ 95000.00 ║  ← new student
║ 2005       ║ Isaac Newton ║ Physics          ║ 10       ║ 1008          ║ Marie Curie     ║ Physics           ║ 70000.00 ║  ← new student+instructor
╚════════════╩══════════════╩══════════════════╩══════════╩═══════════════╩═════════════════╩═══════════════════╩══════════╝
*/


-- ============================================================
-- END OF FILE
-- ============================================================