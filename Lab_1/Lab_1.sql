-- Create Table
CREATE TABLE employee(
emp_no INT,
emp_name VARCHAR(50),
emp_address VARCHAR(50)
);

-- Insert 5 Employees
INSERT INTO employee values(5, 'Ram', 'MANIPAL');

INSERT INTO employee values(6, 'Sham', 'BANGALORE');

INSERT INTO employee values(7, 'Alex', 'MANIPAL');

INSERT INTO employee values(8, 'Tom', 'MANGALORE');

INSERT INTO employee values(9, 'Bob', 'MANGALORE');

-- Display all names
SELECT emp_name from employee;

-- Display all from Manipal
SELECT * FROM employee WHERE emp_address='MANIPAL';

-- Add column salary
ALTER TABLE employee ADD(salary NUMBER);

-- Assign a salary for everyone
UPDATE employee SET salary=5000;

-- Describe table
DESC employee;

-- Delete all from Employees from MANGALORE
DELETE FROM employee WHERE emp_address='MANGALORE';

-- Rename Table
RENAME employee TO employee1;

-- Drop table
DROP TABLE employee1;