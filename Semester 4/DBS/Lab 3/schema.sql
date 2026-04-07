CREATE TABLE Department (
    dept_name   VARCHAR(30) PRIMARY KEY,
    building    VARCHAR(20),
    budget      DECIMAL(12,2)
);

CREATE TABLE Instructor (
    ID        INT PRIMARY KEY,
    name      VARCHAR(30) NOT NULL,
    dept_name VARCHAR(30),
    salary    DECIMAL(8,2),
    FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);

CREATE TABLE Course (
    course_id VARCHAR(10) PRIMARY KEY,
    title     VARCHAR(50),
    dept_name VARCHAR(30),
    credits   INT,
    FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);

CREATE TABLE Classroom (
    building     VARCHAR(20),
    room_number  VARCHAR(10),
    capacity     INT,
    PRIMARY KEY (building, room_number)
);

CREATE TABLE Time_slot (
    time_slot_id VARCHAR(10),
    day          VARCHAR(10),
    start_time   VARCHAR(20),
    end_time    VARCHAR(20),
    PRIMARY KEY (time_slot_id, day, start_time)
);

CREATE TABLE Section (
    course_id    VARCHAR(10),
    section_id   VARCHAR(5),
    semester     VARCHAR(10),
    year         INT,
    building     VARCHAR(20),
    room_number  VARCHAR(10),
    time_slot_id VARCHAR(10),
    PRIMARY KEY (course_id, section_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (building, room_number)
        REFERENCES Classroom(building, room_number)
);

CREATE TABLE Teaches (
    ID         INT,
    course_id  VARCHAR(10),
    section_id VARCHAR(5),
    semester   VARCHAR(10),
    year       INT,
    PRIMARY KEY (ID, course_id, section_id, semester, year),
    FOREIGN KEY (ID) REFERENCES Instructor(ID),
    FOREIGN KEY (course_id, section_id, semester, year)
        REFERENCES Section(course_id, section_id, semester, year)
);

CREATE TABLE Students(
    ID        INT PRIMARY KEY,
    name      VARCHAR(30) NOT NULL,
    dept_name VARCHAR(30),
    tot_cred  INT,
    FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);

CREATE TABLE Takes (
    ID     INT,
    course_id  VARCHAR(10),
    section_id VARCHAR(5),
    semester   VARCHAR(10),
    year       int,
    grade      VARCHAR(2),
    PRIMARY KEY (ID, course_id, section_id, semester, year),
    FOREIGN KEY (ID) REFERENCES StudentS(ID),
    FOREIGN KEY (course_id, section_id, semester, year)
        REFERENCES Section(course_id, section_id, semester, year)
);

CREATE TABLE Advisor (
    s_id INT PRIMARY KEY,
    i_id INT,
    FOREIGN KEY (s_id) REFERENCES StudentS(ID),
    FOREIGN KEY (i_id) REFERENCES Instructor(ID)
);

CREATE TABLE Prereq (
    course_id VARCHAR(10),
    prereq_id VARCHAR(10),
    PRIMARY KEY (course_id, prereq_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (prereq_id) REFERENCES Course(course_id)
);