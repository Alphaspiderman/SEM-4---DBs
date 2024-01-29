--  University Database Schema:
--   Student (ID, name,dept_name, tot_cred)
--   Instructor(ID, name, dept_name, salary)
--   Course (Course_id, title,dept_name, credits)
--   Takes (ID, course_id, sec_id, semester, year, grade)
--   Classroom (building, room_number, capacity)
--   Department (dept_name, building, budget)
--   Section (course_id, section_id, semester, year, building, room_number, time_slot_id)
--   Teaches (id, course_id, section_id, semester, year)
--   Advisor (s_id, i_id)
--   Time_slot (time_slot_id, day, start_time, end_time)
--   Prereq (course_id, prereq_id)

create table
  department (
    dept_name varchar(20) primary key,
    building varchar(15),
    budget numeric(12, 2)
  );

create table
  course (
    course_id varchar(7) primary key,
    title varchar(50),
    dept_name varchar(20),
    credits numeric(2, 0),
    foreign key (dept_name) references department(dept_name)
  );

create table
  instructor (
    ID varchar(5) primary key,
    name varchar(20) not null,
    dept_name varchar(20),
    salary numeric(8, 2),
    foreign key (dept_name) references department(dept_name)
  );

create table
  section (
    course_id varchar(8),
    sec_id varchar(8),
    semester varchar(6),
    year numeric(4, 0),
    building varchar(15),
    room_number varchar(7),
    time_slot_id varchar(4),
    primary key (course_id, sec_id, semester, year),
    foreign key (course_id) references course(course_id)
  );

create table
  teaches (
    ID varchar(5),
    course_id varchar(8),
    sec_id varchar(8),
    semester varchar(6),
    year numeric(4, 0),
    primary key (ID, course_id, sec_id, semester, year),
    foreign key (course_id, sec_id, semester, year) references section(course_id, sec_id, semester, year),
    foreign key (ID) references instructor(ID)
  );



CREATE TABLE Student(
ID number PRIMARY KEY,
Name VARCHAR(50),
Dept_Name VARCHAR(50),
Tot_Cred number,
foreign key (Dept_Name) references department(Dept_Name)
);


CREATE TABLE Takes(
ID INT,
Course_id VARCHAR(8),
Sec_id VARCHAR(8),
Semester varchar(6),
Year numeric(4, 0),
primary key(course_id, sec_id, semester, year),
foreign key (course_id, sec_id, semester, year) references section(course_id, sec_id, semester, year));

CREATE TABLE Classroom(
Buiding VARCHAR(50),
Room_Number NUMBER,
Capacity NUMBER,
primary key(Buiding, Room_Number)
);

CREATE TABLE Advisor(
s_id NUMBER,
i_id varchar(5),
primary key (s_id, i_id),
foreign key (s_id) references student(id),
foreign key (i_id) references instructor(id)
);

CREATE TABLE Time_slot(
time_slot_id INT,
day VARCHAR(10),
start_time TIMESTAMP,
end_time TIMESTAMP,
primary key(time_slot_id, day, start_time)
);

CREATE TABLE Prereq(
Course_id VARCHAR(50),
prereq_id VARCHAR(50),
primary key (Course_id, prereq_id),
foreign key (course_id) references course(course_id),
foreign key (prereq_id) references course(course_id)
);

-- Insert sample data
insert into department values ('Biology', 'Watson', 90000);
insert into department values ('Comp. Sci.', 'Taylor', 100000);
insert into department values ('Music', 'Packard', 80000);
insert into department values ('Physics', 'Watson', 50000);
insert into department values ('History', 'Painter', 60000);

insert into course values ('BIO_101', 'Intro. to Biology', 'Biology', 4);
insert into course values ('CS_101', 'Intro. to Computer Science', 'Comp. Sci.', 4);
insert into course values ('CS_102', 'Intro. to Networks', 'Comp. Sci.', 3);


insert into instructor values ('10101', 'Srinivasan', 'Comp. Sci.', 65000);
insert into instructor values ('33456', 'Gold', 'Comp. Sci.', 87000);
insert into instructor values ('45565', 'Katz', 'Comp. Sci.', 75000);
insert into instructor values ('12121', 'Wu', 'Biology', 90000);
insert into instructor values ('15151', 'Mozart', 'Music', 90000);
insert into instructor values ('22222', 'Einstein', 'Physics', 95000);
insert into instructor values ('32343', 'El Said', 'History', 60000);

insert into section values ('BIO_101', '1', 'Summer', '2009', 'Painter', '514', 'B');
insert into section values ('BIO_101', '1', 'Fall', '2010', 'Painter', '514', 'A');
insert into section values ('CS_101', '1', 'Fall', '2009', 'Packard', '101', 'H');
insert into section values ('CS_101', '1', 'Spring', '2010', 'Packard', '101', 'F');

insert into teaches values ('10101', 'CS_101', '1', 'Fall', '2009');
insert into teaches values ('10101', 'CS_101', '1', 'Spring', '2010');
insert into teaches values ('12121', 'BIO_101', '1', 'Summer', '2009');
insert into teaches values ('12121', 'BIO_101', '1', 'Fall', '2010');


insert into student values(1, 'Alex', 'Comp. Sci.', 44);
insert into student values(2, 'Bob', 'Biology', 40);
insert into student values(3, 'Tom', 'Comp. Sci.', 44);
insert into student values(4, 'Timmy', 'Biology', 40);


insert into takes values(1, 'CS_101', '1', 'Fall', 2009);
insert into takes values(3, 'CS_101', '1', 'Fall', 2009);
insert into takes values(2, 'BIO_101', '1', 'Summer', 2009);
insert into takes values(4, 'BIO_101', '1', 'Summer', 2009);


-- List all Students with names and their department names.
select name, dept_name from student;

-- List all instructors in CSE department.
select name from instructor where dept_name='Comp. Sci.';

-- Find the names of courses in CSE department which have 3 credits.
select name from courses where credits=3;

-- For the student with ID 12345 (or any other value), show all course-id and title of all courses registered for by the student
select c.course_id, c.title from takes t, course c where id=1 and t.course_id=c.course_id;

-- List all the instructors whose salary is in between 40000 and 90000.
select name from instructor where salary > 40000 AND salary < 90000;

-- Display the IDs of all instructors who have never taught a course
select distinct name from instructor WHERE id not in (select id from teaches);