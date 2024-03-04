-- Show the resulting salaries if every employee working on the A project is given a 10 percent raise
select distinct
	e.fname,
	(e.salary * 0.1 + e.salary) as increment_sal
from
	works_on w
	join employee e on w.ssn = e.ssn
where
	w.proj_name = 'A';

-- Retrieve a list of employees and the projects they are working on, ordered by department and, within each department, ordered alphabetically by last name, then first name
select
	e.dept_name,
	e.fname,
	w.proj_name
from
	works_on w
	join employee e on w.ssn = e.ssn
order by
	dept_name,
	e.lname,
	e.fname asc;

-- Retrieve the name of each employee who has a dependent with the same first name and is the same sex as the employee
select
	e.fname
from
	employee e
	join dependent d on e.ssn = d.ssn
where
	e.fname = d.name
	and e.sex = d.sex
	-- Retrieve the name of each employee who has no dependents
select
	e.fname
from
	employee e
where
	e.ssn not in (
		select
			ssn
		from
			dependent
	);

-- List the names of managers who have at least one dependent
select
	e.fname
from
	employee e
	join supervision s on e.ssn = s.supervisor
	join dependent d on e.ssn = d.ssn;

-- Find the sum of the salaries of all employees, the maximum salary, the minimum salary, and the average salary
select
	sum(salary),
	max(salary),
	min(salary),
	avg(salary)
from
	employee;

-- For each project, retrieve the project number, the project name, and the number of employees who work on that project
select
	p.proj_num,
	p.proj_name,
	count(w.ssn)
from
	project p
	join works_on w on p.proj_num = w.proj_num
group by
	p.proj_num,
	p.proj_name;