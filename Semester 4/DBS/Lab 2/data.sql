INSERT ALL
  INTO Department (dept_name, building, budget) values ('CSE', 'Block A', 500000)
  INTO Department (dept_name, building, budget) values ('ECE', 'Block B', 400000)
  INTO Department (dept_name, building, budget) values ('ME', 'Block C', 350000)
  INTO Department (dept_name, building, budget) values ('CE', 'Block D', 300000)
  INTO Department (dept_name, building, budget) values ('EEE', 'Block E', 450000)
SELECT * FROM DUAL;

INSERT ALL
  INTO Instructor (id, name, dept_name, salary) values (201, 'Dr Rao', 'CSE', 80000)
  INTO Instructor (id, name, dept_name, salary) values (202, 'Dr Mehta', 'ECE', 75000)
  INTO Instructor (id, name, dept_name, salary) values (203, 'Dr Singh', 'ME', 70000)
  INTO Instructor (id, name, dept_name, salary) values (204, 'Dr Kumar', 'CE', 72000)
  INTO Instructor (id, name, dept_name, salary) values (205, 'Dr Shah', 'EEE', 78000)
SELECT * FROM DUAL;

INSERT ALL
  INTO Course (course_id, title, dept_name, credits) values ('CS101', 'DBMS', 'CSE', 4)
  INTO Course (course_id, title, dept_name, credits) values ('EC101', 'Signals', 'ECE', 3)
  INTO Course (course_id, title, dept_name, credits) values ('ME101', 'Thermo', 'ME', 4)
  INTO Course (course_id, title, dept_name, credits) values ('CE101', 'Structures', 'CE', 3)
  INTO Course (course_id, title, dept_name, credits) values ('EE101', 'Circuits', 'EEE', 4)
SELECT * FROM DUAL;

INSERT ALL
  INTO Classroom (building, room_number, capacity) values ('Block A', '101', 60)
  INTO Classroom (building, room_number, capacity) values ('Block B', '102', 55)
  INTO Classroom (building, room_number, capacity) values ('Block C', '103', 50)
  INTO Classroom (building, room_number, capacity) values ('Block D', '104', 45)
  INTO Classroom (building, room_number, capacity) values ('Block E', '105', 65)
SELECT * FROM DUAL;

INSERT ALL
  INTO Time_slot (time_slot_id, day, start_time, end_time) values ('TS1', 'MON', '09:00', '10:00')
  INTO Time_slot (time_slot_id, day, start_time, end_time) values ('TS2', 'TUE', '10:00', '11:00')
  INTO Time_slot (time_slot_id, day, start_time, end_time) values ('TS3', 'WED', '11:00', '12:00')
  INTO Time_slot (time_slot_id, day, start_time, end_time) values ('TS4', 'THU', '12:00', '13:00')
  INTO Time_slot (time_slot_id, day, start_time, end_time) values ('TS5', 'FRI', '14:00', '15:00')
SELECT * FROM DUAL;

INSERT ALL
  INTO Section (course_id, section_id, semester, year, building, room_number, time_slot_id) values ('CS101', '1', 'Fall', 2024, 'Block A', '101', 'TS1')
  INTO Section (course_id, section_id, semester, year, building, room_number, time_slot_id) values ('EC101', '1', 'Fall', 2024, 'Block B', '102', 'TS2')
  INTO Section (course_id, section_id, semester, year, building, room_number, time_slot_id) values ('ME101', '1', 'Fall', 2024, 'Block C', '103', 'TS3')
  INTO Section (course_id, section_id, semester, year, building, room_number, time_slot_id) values ('CE101', '1', 'Fall', 2024, 'Block D', '104', 'TS4')
  INTO Section (course_id, section_id, semester, year, building, room_number, time_slot_id) values ('EE101', '1', 'Fall', 2024, 'Block E', '105', 'TS5')
SELECT * FROM DUAL;

INSERT ALL
  INTO Teaches (ID, course_id, section_id, semester, year) values (201, 'CS101', '1', 'Fall', 2024)
  INTO Teaches (ID, course_id, section_id, semester, year) values (202, 'EC101', '1', 'Fall', 2024)
  INTO Teaches (ID, course_id, section_id, semester, year) values (203, 'ME101', '1', 'Fall', 2024)
  INTO Teaches (ID, course_id, section_id, semester, year) values (204, 'CE101', '1', 'Fall', 2024)
  INTO Teaches (ID, course_id, section_id, semester, year) values (205, 'EE101', '1', 'Fall', 2024)
SELECT * FROM DUAL;

INSERT ALL
  INTO Students (ID, name, dept_name, tot_cred) values (101, 'Asha', 'CSE', 80)
  INTO Students (ID, name, dept_name, tot_cred) values (102, 'Ravi', 'ECE', 75)
  INTO Students (ID, name, dept_name, tot_cred) values (103, 'Neha', 'ME', 78)
  INTO Students (ID, name, dept_name, tot_cred) values (104, 'Arjun', 'CE', 85)
  INTO Students (ID, name, dept_name, tot_cred) values (105, 'Kiran', 'EEE', 80)
SELECT * FROM DUAL;

INSERT ALL
  INTO Takes (ID, course_id, section_id, semester, year, grade) values (101, 'CS101', '1', 'Fall', 2024, 'A')
  INTO Takes (ID, course_id, section_id, semester, year, grade) values (102, 'EC101', '1', 'Fall', 2024, 'B')
  INTO Takes (ID, course_id, section_id, semester, year, grade) values (103, 'ME101', '1', 'Fall', 2024, 'A')
  INTO Takes (ID, course_id, section_id, semester, year, grade) values (104, 'CE101', '1', 'Fall', 2024, 'B')
  INTO Takes (ID, course_id, section_id, semester, year, grade) values (105, 'EE101', '1', 'Fall', 2024, 'A')
SELECT * FROM DUAL;

INSERT ALL
  INTO Advisor (s_ID, i_ID) values (101, 201)
  INTO Advisor (s_ID, i_ID) values (102, 202)
  INTO Advisor (s_ID, i_ID) values (103, 203)
  INTO Advisor (s_ID, i_ID) values (104, 204)
  INTO Advisor (s_ID, i_ID) values (105, 205)
SELECT * FROM DUAL;
  
INSERT ALL
  INTO Prereq (course_id, prereq_id) values ('CS101', 'CS101')
  INTO Prereq (course_id, prereq_id) values ('EC101', 'EC101')
  INTO Prereq (course_id, prereq_id) values ('ME101', 'ME101')
  INTO Prereq (course_id, prereq_id) values ('CE101', 'CE101')
  INTO Prereq (course_id, prereq_id) values ('EE101', 'EE101')
SELECT * FROM DUAL;