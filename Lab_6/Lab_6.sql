-- COMPLEX QUERIES ON SQL
-- Find the number of students in each course
select course_id, count(id) as num_students from takes group by course_id;

-- Find those departments where the average number of students are greater than 2.
select dept_name, avg(num_students) as avg_students from (select t.course_id, count(id) as num_students, c.dept_name from takes t join course c on t.course_id = c.course_id group by course_id) as num_students group by dept_name having avg(num_students) > 2;

-- Find the total number of courses in each department.
select dept_name, count(course_id) as num_courses from course group by dept_name;

-- Find the names and average salaries of all departments whose average salary is greater than 42000.
select dept_name, avg(salary) as avg_salary from instructor group by dept_name having avg(salary) > 42000;

-- Find the enrolment of each section that was offered in Fall 2017.
select course_id, sec_id, count(id) as num_students from takes where semester = 'Fall' and year = 2017 group by course_id, sec_id;

-- List all the courses with prerequisite courses, then display course id in increasing order.
select course_id from prereq order by course_id;

-- Display the details of instructors sorting the salary in decreasing order.
select * from instructor order by salary desc;

-- Find the total salary across the departments.
select dept_name, sum(salary) as total_salary from instructor group by dept_name

-- Find the average instructors’ salaries of those departments where the average salary is greater than 42000.
select dept_name, avg(salary) as avg_salary from instructor group by dept_name having avg(salary) > 42000;

-- Find the sections that had the maximum enrolment in Fall 2017
select course_id, sec_id, count(id) as num_students from takes where semester = 'Fall' and year = 2017 group by course_id, sec_id order by num_students desc;

-- Find the names of all instructors who teach all students that belong to ‘CSE’ department.
select name from instructor where dept_name = 'Comp. Sci.';

-- Find the average salary of those department where the average salary is greater than 50000 and total number of instructors in the department are more than 2.
select dept_name, avg(salary) as avg_salary from instructor group by dept_name having avg(salary) > 50000 and count(id) > 2;
