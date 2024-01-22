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

--  Make DNo of Employee as foreign key which refers to DeptNo of Department.
ALTER TABLE Employee ADD CONSTRAINT FK_Dno FOREIGN KEY(Dno) REFERENCES Department(DeptNo);

--  Insert few tuples into Employee and Department which satisfies the above constraints.
INSERT INTO Department VALUES(2, 'CSE', 'BLR');
INSERT INTO Department VALUES(3, 'IT', 'BLR');
INSERT INTO Employee VALUES(5, 'Ram', 'M', 5000, 'Manipal', 3);
INSERT INTO Employee VALUES(6, 'Shreya', 'F', 5000, 'Bangalore', 3);
INSERT INTO Employee VALUES(7, 'Alex', 'M', 5000, 'Manipal', 2);
INSERT INTO Employee VALUES(8, 'Emma', 'F', 5000, 'Mangalore', 2);
INSERT INTO Employee VALUES(9, 'Bob', 'M', 5000, 'Manipal', 2);

--  Try to insert few tuples into Employee and Department which violates some of the above constraints.
INSERT INTO department VALUES(4, 'IT', 'MPL');
INSERT INTO employee VALUES(5, 'Ram', 'M', 6000, 'Manipal', 2);

--  Try to modify/delete a tuple which violates a constraint
UPDATE employee SET Dno=1 WHERE EmpNo=9;

--  Modify the foreign key constraint of Employee table such that whenever a department
--  tuple is deleted, the employees belonging to that department will also be deleted.
ALTER TABLE Employee MODIFY CONSTRAINT FK_Dno FOREIGN KEY(Dno) REFERENCES Department(DeptNo) ON DELETE CASCADE;

--  Create a named constraint to set the default salary to 10000 and test the constraint by inserting a new record
ALTER TABLE Employee MODIFY Salary DEFAULT 10000

INSERT INTO Employee(EmpNo, EmpName, Gender, Address, DNo) VALUES(10, 'Emily', 'F', 'Manipal', 2);
