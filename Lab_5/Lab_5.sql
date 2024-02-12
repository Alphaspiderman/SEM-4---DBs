-- Find names of instructors with salary greater than that of some (at least one) instructor in the Biology department
select name from INSTRUCTOR where salary > (select min(salary) from INSTRUCTOR where dept_name='Biology')

-- Find the names of all instructors whose salary is greater than the salary of all instructors in the Biology department.
select name from INSTRUCTOR where salary > (select max(salary) from INSTRUCTOR where dept_name='Biology')

-- Find the departments that have the highest average salary.
select dept_name from instructor group by dept_name having avg(salary) = (select max(avg(salary)) from instructor group by dept_name)

select * from (select dept_name from instructor group by dept_name order by AVG(salary) desc) where rownum < 2

-- Find the names of those departments whose budget is lesser than the average salary of all instructors.
select dept_name from department where budget < (select avg(salary) from instructor)

-- Find all courses taught in both the Fall 2009 semester and in the Spring 2010 semester.
select course_id from section where semester = 'Fall' and year = 2017 and course_id in (select course_id from section where semester = 'Spring' and year = 2018)

select course_id from section where semester = 'Fall' and year = 2009 where exists (select course_id from section where semester = 'Spring' and year = 2010)

-- Find all students who have taken all courses offered in the Biology department.
select id from takes where course_id in (select course_id from course where dept_name='Biology')

-- Find all courses that were offered at most once in 2009.
select course_id from section where year = 2017 having count(course_id) = 1 group by course_id

select course_id from course where course_id not in (select course_id from section where year = 2017 having count(course_id) > 1 group by course_id) 

-- Find all the students who have opted at least two courses offered by CSE department
select id from takes where course_id in (select course_id from course where dept_name='Comp. Sci.') group by id having count(distinct course_id) > 1

-- Find the average instructors salary of those departments where the average salary is greater than 42000
select dept_name, avg(salary) from instructor having avg(salary) > 42000 group by dept_name

select dept_name, sal from (select dept_name, avg(salary) as sal from instructor having avg(salary) > 42000 group by dept_name)

-- Create a view all_courses consisting of course sections offered by Physics department in the Fall 2009, with the building and room number of each section
create view all_courses as select sec_id, building, room_number from section where course_id in (select course_id from course where dept_name='Physics') and year = 2017;