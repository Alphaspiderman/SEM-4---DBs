create table Employee
(
    EmpNo number(10) PRIMARY KEY,
    EmpName char(20) NOT NULL,
    Gender char(1) NOT NULL,
    Salary number(20) NOT NULL,
    Address varchar(20) NOT NULL,
    DNo number(10),
    CHECK (Gender in ( 'M', 'F' ))
);

ALTER TABLE Employee ADD DOB DATE;

INSERT INTO Employee
VALUES
(1, 'John', 'M', 50000, 'BLR', 100, TO_DATE('1990/01/01', 'YYYY/MM/DD'));

INSERT INTO Employee
VALUES
(2, 'Jane', 'F', 60000, 'BOM', 200, TO_DATE('1985-04-15', 'YYYY-MM-DD'));

INSERT INTO Employee
VALUES
(3, 'Bob', 'M', 70000, 'DEL', 100, TO_DATE('1988-11-30', 'YYYY-MM-DD'));

INSERT INTO Employee
VALUES
(4, 'Samantha', 'F', 80000, 'BLR', 300, TO_DATE('1992-07-22', 'YYYY-MM-DD'));

INSERT INTO Employee
VALUES
(5, 'Mike', 'M', 55000, 'BOM', 200, TO_DATE('1995-03-05', 'YYYY-MM-DD'));

INSERT INTO Employee
VALUES
(6, 'Emily', 'F', 65000, 'DEL', 100, TO_DATE('1993-09-12', 'YYYY-MM-DD'));

INSERT INTO Employee
VALUES
(7, 'David', 'M', 75000, 'BLR', 300, TO_DATE('1991-02-20', 'YYYY-MM-DD'));

INSERT INTO Employee
VALUES
(8, 'Amy', 'F', 85000, 'BOM', 200, TO_DATE('1989-06-18', 'YYYY-MM-DD'));

INSERT INTO Employee
VALUES
(9, 'Peter', 'M', 90000, 'DEL', 300, TO_DATE('1996-12-10', 'YYYY-MM-DD'));

INSERT INTO Employee
VALUES
(10, 'Grace', 'F', 100000, 'BLR', 100, TO_DATE('1994-08-07', 'YYYY-MM-DD'));
