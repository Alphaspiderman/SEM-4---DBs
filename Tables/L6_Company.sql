-- Create Table
create table
	employee (
		fname varchar(100),
		lname varchar(100),
		mname varchar(100),
		bdate date,
		address varchar(100),
		salary number not null,
		sex varchar(1),
		dept_name varchar(100) references department (dept_name),
		dept_num number references department (dept_num),
		ssn number,
		primary key (ssn)
	);

create table
	department (
		dept_name varchar(100) unique,
		dept_num number unique,
		location varchar(100),
		start_date date,
		primary key (dept_name, dept_num)
	);

create table
	project (
		proj_name varchar(100) unique,
		proj_num number unique,
		location varchar(100),
		primary key (proj_name, proj_num),
		dept_name varchar(100) references department (dept_name),
		dept_num number references department (dept_num)
	);

create table
	dependent (
		name varchar(100),
		sex varchar(1),
		birth_date date,
		relationship varchar(100),
		ssn number references employee (ssn)
	);

create table
	supervision (
		supervisor number references employee (ssn),
		supervisee number references employee (ssn)
	);

create table
	works_on (
		ssn number references employee (ssn),
		proj_num number references project (proj_num),
		proj_name varchar(100) references project (proj_name),
		hours number
	);

-- Sample Data

insert into
	employee
values
	(
		'John',
		'Smith',
		'B',
		'1990-01-09',
		'ABC',
		50000,
		'M',
		'Chemistry',
		101,
		123456789
	);

insert into
	employee
values
	(
		'Frank',
		'Zappa',
		'A',
		'1991-01-09',
		'ABC',
		60000,
		'M',
		'Chemistry',
		101,
		123456788
	);

insert into
	employee
values
	(
		'Jack',
		'Jones',
		'A',
		'1992-01-09',
		'ABC',
		70000,
		'M',
		'Chemistry',
		101,
		123456787
	);

insert into
	employee
values
	(
		'Jill',
		'Smith',
		'A',
		'1993-01-09',
		'ABC',
		80000,
		'F',
		'Chemistry',
		101,
		123456786
	);

insert into
	employee
values
	(
		'Jill',
		'Jones',
		'A',
		'1994-01-09',
		'ABC',
		90000,
		'F',
		'Chemistry',
		101,
		123456785
	);

insert into
	employee
values
	(
		'Jill',
		'Zappa',
		'A',
		'1995-01-09',
		'ABC',
		100000,
		'F',
		'Chemistry',
		101,
		123456784
	);

-- Inserting data into department table
insert into
	department
values
	('Chemistry', 101, 'ABC', '1990-01-09');

insert into
	department
values
	('Physics', 102, 'ABC', '1990-01-09');

insert into
	department
values
	('Math', 103, 'ABC', '1990-01-09');

insert into
	department
values
	('Biology', 104, 'ABC', '1990-01-09');

-- Inserting data into project table
insert into
	project
values
	('A', 1, 'ABC', 'Chemistry', 101);

insert into
	project
values
	('B', 2, 'ABC', 'Chemistry', 101);

insert into
	project
values
	('C', 3, 'ABC', 'Chemistry', 101);

-- Inserting data into dependent table
insert into
	dependent
values
	('John', 'M', '1990-01-09', 'Son', 123456789);

insert into
	dependent
values
	('Frank', 'M', '1991-01-09', 'Son', 123456788);

insert into
	dependent
values
	('Jack', 'M', '1992-01-09', 'Son', 123456787);

-- Inserting data into supervision table
insert into
	supervision
values
	(123456789, 123456788);

insert into
	supervision
values
	(123456788, 123456787);

insert into
	supervision
values
	(123456787, 123456786);

-- Inserting data into works_on table
insert into
	works_on
values
	(123456789, 1, 'A', 10);

insert into
	works_on
values
	(123456788, 2, 'B', 20);

insert into
	works_on
values
	(123456787, 3, 'C', 30);
