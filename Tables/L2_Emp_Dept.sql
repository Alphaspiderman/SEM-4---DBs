--  Consider the following schema:
--  Employee (EmpNo, EmpName, Gender, Salary, Address, DNo)
--  Department (DeptNo, DeptName, Location)

--  Create Employee table with following constraints:
--   Make EmpNo as Primary key.
--   Do not allow EmpName, Gender, Salary and Address to have null values.
--   Allow Gender to have one of the two values: ‘M’, ‘F’.

CREATE TABLE Employee(
EmpNo INT PRIMARY KEY,
EmpName VARCHAR(50) NOT NULL,
Gender VARCHAR(1) NOT NULL,
Salary NUMBER NOT NULL,
Address VARCHAR(50) NOT NULL,
Dno INT,
CHECK(Gender in ('M', 'F'))
)


--  Create Department table with following:
--   Make DeptNo as Primary key
--   Make DeptName as candidate key
CREATE TABLE Department(
DeptNo INT PRIMARY KEY, 
DeptName VARCHAR(50) UNIQUE, 
Location VARCHAR(50)
)

--  Constraint: Make Dno of Employee as foreign key which refers to DeptNo of Department.
ALTER TABLE Employee ADD CONSTRAINT FK_Dno FOREIGN KEY(Dno) REFERENCES Department(DeptNo);

--  Sample Data
INSERT INTO Department VALUES(2, 'CSE', 'BLR');
INSERT INTO Department VALUES(3, 'IT', 'BLR');
INSERT INTO Employee VALUES(5, 'Ram', 'M', 5000, 'Manipal', 3);
INSERT INTO Employee VALUES(6, 'Shreya', 'F', 5000, 'Bangalore', 3);
INSERT INTO Employee VALUES(7, 'Alex', 'M', 5000, 'Manipal', 2);
INSERT INTO Employee VALUES(8, 'Emma', 'F', 5000, 'Mangalore', 2);
INSERT INTO Employee VALUES(9, 'Bob', 'M', 5000, 'Manipal', 2);