-- Lab 5

-- Retrieve the birth date and address of the employee(s) whose name is ‘John B. Smith. Retrieve the name and address of all employees who work for the ‘Research’ department
select
	bdate,
	address
from
	employee
where
	fname = 'John'
	and lname = 'Smith'
	and mname = 'B';

select
	fname,
	address
from
	employee
where
	dept_name = 'Chemistry';

-- For every project located in ABC, list the project number, the controlling department number, and the department manager’s last name, address, and birth date.
select
	e.lname,
	e.address,
	e.bdate,
	p.proj_num,
	p.dept_num
from
	project p
	join works_on w on w.proj_num = p.proj_num
	join employee e on e.ssn = w.ssn
where
	location = 'ABC';

-- For each employee, retrieve the employee’s first and last name and the first and last name of his or her immediate supervisor
select
	e.fname as emp_fname,
	e.lname as emp_lname,
	s.fname as sup_fname,
	s.lname as sup_name
from
	employee e
	join supervision sp on e.ssn = sp.supervisee
	join employee s on s.ssn = sp.supervisor;

-- Make a list of all project numbers for projects that involve an employee whose last name is ‘Smith’, either as a worker or as a manager of the department that controls the project
select distinct
	p.proj_num
from
	project p
	join works_on w on w.proj_num = p.proj_num
	join employee e on e.ssn = w.ssn
where
	e.lname = 'Smith';

