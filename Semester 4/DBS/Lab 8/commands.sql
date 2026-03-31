-- Create the StudentTable
CREATE TABLE StudentTable (
  RollNo NUMBER PRIMARY KEY,
  GPA    NUMBER(4,2)
);

-- Insert sample data
INSERT INTO StudentTable VALUES (1, 5.8);
INSERT INTO StudentTable VALUES (2, 6.5);
INSERT INTO StudentTable VALUES (3, 3.4);
INSERT INTO StudentTable VALUES (4, 7.8);
INSERT INTO StudentTable VALUES (5, 9.5);


-- EXERCISE 1: Display GPA of a given student (IF-THEN)
DECLARE
  v_gpa    StudentTable.GPA%TYPE;
BEGIN
  FOR i IN 1..5 LOOP
    SELECT GPA INTO v_gpa
    FROM StudentTable
    WHERE RollNo = i;

    DBMS_OUTPUT.PUT_LINE('Roll No: ' || i || ' | GPA: ' || v_gpa);
  END LOOP;
END;
/

-- EXERCISE 2: Display Letter Grade of a Given Student (IF-THEN)
DECLARE
  v_rollno     StudentTable.RollNo%TYPE := 4;  -- Change roll number here
  v_gpa        StudentTable.GPA%TYPE;
  v_grade      VARCHAR2(2);
BEGIN
  SELECT GPA INTO v_gpa
  FROM StudentTable
  WHERE RollNo = v_rollno;

  IF v_gpa >= 9 AND v_gpa <= 10 THEN
    v_grade := 'A+';
  ELSIF v_gpa >= 8 THEN
    v_grade := 'A';
  ELSIF v_gpa >= 7 THEN
    v_grade := 'B';
  ELSIF v_gpa >= 6 THEN
    v_grade := 'C';
  ELSIF v_gpa >= 5 THEN
    v_grade := 'D';
  ELSIF v_gpa >= 4 THEN
    v_grade := 'E';
  ELSE
    v_grade := 'F';
  END IF;

  DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_rollno || ' | GPA: '  || v_gpa    || ' | Grade: '|| v_grade);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No student found with Roll No: ' || v_rollno);
END;
/

-- EXERCISE 3: Library Book Fine Calculation (IF-THEN)
DECLARE
  v_issue_date   DATE := TO_DATE('01-MAR-2025', 'DD-MON-YYYY');
  v_return_date  DATE := TO_DATE('20-MAR-2025', 'DD-MON-YYYY');
  v_days         NUMBER;
  v_fine         NUMBER := 0;
  v_message      VARCHAR2(100);
BEGIN
  v_days := v_return_date - v_issue_date;

  IF v_days <= 7 THEN
    v_fine    := 0;
    v_message := 'No fine. Book returned within 7 days.';
  ELSIF v_days <= 15 THEN
    v_fine    := (v_days - 7) * 1;
    v_message := 'Fine @ Rs.1/day for ' || (v_days - 7) || ' extra day(s).';
  ELSIF v_days <= 30 THEN
    v_fine    := (8 * 1) + ((v_days - 15) * 2);
    v_message := 'Fine @ Rs.1/day (8 days) + Rs.2/day for ' ||
                 (v_days - 15) || ' day(s).';
  ELSE
    v_fine    := 5;
    v_message := 'Fixed penalty after 30 days.';
  END IF;

  DBMS_OUTPUT.PUT_LINE('Days Late  : ' || v_days);
  DBMS_OUTPUT.PUT_LINE('Fine       : Rs.' || v_fine);
  DBMS_OUTPUT.PUT_LINE('Message    : ' || v_message);
END;
/

-- EXERCISE 4: Print Letter Grade of ALL Students (Simple LOOP)
DECLARE
  v_gpa    StudentTable.GPA%TYPE;
  v_grade  VARCHAR2(2);
BEGIN
  FOR i IN 1..5 LOOP
    SELECT GPA INTO v_gpa
    FROM StudentTable
    WHERE RollNo = i;

    IF v_gpa >= 9 AND v_gpa <= 10 THEN
      v_grade := 'A+';
    ELSIF v_gpa >= 8 THEN
      v_grade := 'A';
    ELSIF v_gpa >= 7 THEN
      v_grade := 'B';
    ELSIF v_gpa >= 6 THEN
      v_grade := 'C';
    ELSIF v_gpa >= 5 THEN
      v_grade := 'D';
    ELSIF v_gpa >= 4 THEN
      v_grade := 'E';
    ELSE
      v_grade := 'F';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Roll No: ' || i || ' | GPA: '  || v_gpa || ' | Grade: '|| v_grade);
  END LOOP;
END;
/

-- EXERCISE 5: Alter Table + Update LetterGrade Column (WHILE Loop)
ALTER TABLE StudentTable ADD LetterGrade VARCHAR2(2);

DECLARE
  v_rollno   NUMBER := 1;
  v_gpa      StudentTable.GPA%TYPE;
  v_grade    VARCHAR2(2);
BEGIN
  WHILE v_rollno <= 5 LOOP

    SELECT GPA INTO v_gpa
    FROM StudentTable
    WHERE RollNo = v_rollno;

    IF v_gpa >= 9 AND v_gpa <= 10 THEN
      v_grade := 'A+';
    ELSIF v_gpa >= 8 THEN
      v_grade := 'A';
    ELSIF v_gpa >= 7 THEN
      v_grade := 'B';
    ELSIF v_gpa >= 6 THEN
      v_grade := 'C';
    ELSIF v_gpa >= 5 THEN
      v_grade := 'D';
    ELSIF v_gpa >= 4 THEN
      v_grade := 'E';
    ELSE
      v_grade := 'F';
    END IF;

    UPDATE StudentTable
    SET LetterGrade = v_grade
    WHERE RollNo = v_rollno;

    DBMS_OUTPUT.PUT_LINE('Updated Roll No: ' || v_rollno || ' -> Grade: ' || v_grade);

    v_rollno := v_rollno + 1;
  END LOOP;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('All grades updated successfully.');
END;
/

-- EXERCISE 6: Find Student with Maximum GPA (FOR Loop, no aggregate)
DECLARE
  v_gpa       StudentTable.GPA%TYPE;
  v_max_gpa   StudentTable.GPA%TYPE := -1;
  v_max_roll  StudentTable.RollNo%TYPE;
BEGIN
  FOR i IN 1..5 LOOP
    SELECT GPA INTO v_gpa
    FROM StudentTable
    WHERE RollNo = i;

    IF v_gpa > v_max_gpa THEN
      v_max_gpa  := v_gpa;
      v_max_roll := i;
    END IF;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Student with Max GPA:');
  DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_max_roll || ' | GPA: ' || v_max_gpa);
END;
/

-- EXERCISE 7: Print Letter Grades of All Students using GOTO
DECLARE
  v_rollno   NUMBER := 1;
  v_gpa      StudentTable.GPA%TYPE;
  v_grade    VARCHAR2(2);
BEGIN
  <<next_student>>
  IF v_rollno > 5 THEN
    GOTO end_loop;
  END IF;

  SELECT GPA INTO v_gpa
  FROM StudentTable
  WHERE RollNo = v_rollno;

  IF v_gpa >= 9 AND v_gpa <= 10 THEN
    v_grade := 'A+';
  ELSIF v_gpa >= 8 THEN
    v_grade := 'A';
  ELSIF v_gpa >= 7 THEN
    v_grade := 'B';
  ELSIF v_gpa >= 6 THEN
    v_grade := 'C';
  ELSIF v_gpa >= 5 THEN
    v_grade := 'D';
  ELSIF v_gpa >= 4 THEN
    v_grade := 'E';
  ELSE
    v_grade := 'F';
  END IF;

  DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_rollno || ' | GPA: '  || v_gpa || ' | Grade: '|| v_grade);

  v_rollno := v_rollno + 1;
  GOTO next_student;

  <<end_loop>>
  DBMS_OUTPUT.PUT_LINE('Done printing all grades.');
END;
/

-- EXERCISE 8: University DB - Display Instructor Details with Exception Handling
CREATE TABLE Instructor (
  ID         NUMBER PRIMARY KEY,
  Name       VARCHAR2(50),
  Department VARCHAR2(50),
  Salary     NUMBER
);

INSERT INTO Instructor VALUES (1, 'Alice',   'CS',      75000);
INSERT INTO Instructor VALUES (2, 'Bob',     'Math',    68000);
INSERT INTO Instructor VALUES (3, 'Brian',   'Physics', 72000);
INSERT INTO Instructor VALUES (4, 'Charlie', 'CS',      80000);

DECLARE
  v_name       Instructor.Name%TYPE       := 'Alice';   -- Change name here
  v_id         Instructor.ID%TYPE;
  v_dept       Instructor.Department%TYPE;
  v_salary     Instructor.Salary%TYPE;
BEGIN
  SELECT ID, Name, Department, Salary
  INTO v_id, v_name, v_dept, v_salary
  FROM Instructor
  WHERE Name = v_name;

  DBMS_OUTPUT.PUT_LINE('Instructor Found:');
  DBMS_OUTPUT.PUT_LINE('  ID         : ' || v_id);
  DBMS_OUTPUT.PUT_LINE('  Name       : ' || v_name);
  DBMS_OUTPUT.PUT_LINE('  Department : ' || v_dept);
  DBMS_OUTPUT.PUT_LINE('  Salary     : ' || v_salary);

EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: Multiple instructors found with name: ' || v_name || '. Please refine your search.');
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: No instructor found with name: '|| v_name ||);
END;
/

-- EXERCISE 9: Update LetterGrade with GPA Range Validation (Exception Handling)
DECLARE
  v_rollno           NUMBER := 1;
  v_gpa              StudentTable.GPA%TYPE;
  v_grade            VARCHAR2(2);
  gpa_out_of_range   EXCEPTION;
BEGIN
  WHILE v_rollno <= 5 LOOP
    BEGIN
      SELECT GPA INTO v_gpa
      FROM StudentTable
      WHERE RollNo = v_rollno;

      -- Validate GPA range
      IF v_gpa < 0 OR v_gpa > 10 THEN
        RAISE gpa_out_of_range;
      END IF;

      -- Assign letter grade
      IF v_gpa >= 9 AND v_gpa <= 10 THEN
        v_grade := 'A+';
      ELSIF v_gpa >= 8 THEN
        v_grade := 'A';
      ELSIF v_gpa >= 7 THEN
        v_grade := 'B';
      ELSIF v_gpa >= 6 THEN
        v_grade := 'C';
      ELSIF v_gpa >= 5 THEN
        v_grade := 'D';
      ELSIF v_gpa >= 4 THEN
        v_grade := 'E';
      ELSE
        v_grade := 'F';
      END IF;

      UPDATE StudentTable
      SET LetterGrade = v_grade
      WHERE RollNo = v_rollno;

      DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_rollno || ' | GPA: ' || v_gpa || ' | Grade: ' || v_grade || ' -> Updated.');

    EXCEPTION
      WHEN gpa_out_of_range THEN
        DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_rollno || ' | GPA: ' || v_gpa || ' -> ERROR: Out of Range. Skipped.');
    END;

    v_rollno := v_rollno + 1;
  END LOOP;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Processing complete.');
END;
/

