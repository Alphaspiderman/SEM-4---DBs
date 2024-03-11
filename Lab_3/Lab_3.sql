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