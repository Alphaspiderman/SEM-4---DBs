-- Find the student names, course names, and the year, for all students those who have attended classes in room-number 101
SELECT s.name, c.title, t.year 
from takes t 
JOIN student s ON s.id = t.id 
JOIN course c on c.course_id = t.course_id 
JOIN section se ON t.sec_id = se.sec_id AND t.course_id = se.course_id AND t.year = se.year 
WHERE se.room_number = 101


-- For all students who have opted courses in 2015, find their names and course id’s with the attribute course title replaced by c-name
SELECT t.course_id, s.name, c.title as cname 
FROM takes t 
JOIN student s ON s.id = t.id 
JOIN course c ON c.course_id = t.course_id 
WHERE year = 2009


-- Find the names of all instructors whose salary is greater than the salary of at least one instructor of CSE department and salary replaced by inst-salary
SELECT name, salary AS instsalary 
FROM instructor 
WHERE salary > (SELECT MIN(salary) FROM instructor WHERE dept_name = 'Comp. Sci.')


-- Find the names of all instructors whose department name includes the substring  'om'
SELECT name
FROM Instructor
WHERE dept_name LIKE '%om%';


-- List the student names along with the length of the student names.
SELECT name, LENGTH(name) as name_length FROM Student;


-- List the department names and 3 characters from 3rd position of each department name
SELECT dept_name, SUBSTR(dept_name, 3, 3) AS sub_string FROM Department;


-- List the instructor names in upper case
SELECT UPPER(i.name) AS uppercase_names
FROM Instructor i


-- Display the salary and salary/3 rounded to nearest hundred from Instructor
SELECT salary, ROUND(salary/3, 2) AS salary_by_3
FROM Instructor;



-- Display the birth date of all the employees in the following format:
-- 'DD-MON-YYYY'
-- 'DD-MON-YY'
-- 'DD-MM-YY'
SELECT EmpName, TO_CHAR(DOB, 'DD-MON-YYYY') AS DOB FROM Employee;
SELECT EmpName, TO_CHAR(DOB, 'DD-MON-YY') AS DOB FROM Employee;
SELECT EmpName, TO_CHAR(DOB, 'DD-MM-YY') AS DOB FROM Employee;



-- List the employee names and the year (fully spelled out) in which they are born
-- 'YEAR'
-- 'Year'
-- 'year'
SELECT EmpName, TO_CHAR(DOB, 'YEAR') AS BirthYear FROM Employee;
SELECT EmpName, TO_CHAR(DOB, 'Year') AS BirthYear FROM Employee;
SELECT EmpName, TO_CHAR(DOB, 'year') AS BirthYear FROM Employee;



-- LAB 3

insert into takes values(5, 'CS_101', '1', 'Spring', 2010);

insert into takes values(6, 'CS_101', '1', 'Fall', 2010);
insert into takes values(7, 'BIO_101', '1', 'Spring', 2010);
insert into takes values(8, 'BIO_101', '1', 'Summer', 2010);



--  Find courses that ran in Fall 2009 or in Spring 2010
SELECT course_id, semester, year FROM takes 
WHERE (semester = 'Fall' AND year ='2009') OR (semester = 'Spring' AND year ='2010'); 

SELECT course_id, semester, year FROM takes 
WHERE (semester = 'Fall' AND year ='2009') UNION ALL SELECT course_id, semester, year FROM takes WHERE
(semester = 'Spring' AND year ='2010');




