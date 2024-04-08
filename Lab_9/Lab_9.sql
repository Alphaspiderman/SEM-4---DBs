-- Write a PL/SQL block to display the GPA of a given student
-- StudentTable(RollNo, GPA)

DECLARE
	roll_number studenttable.roll%TYPE;
	score studenttable.gpa%TYPE;
BEGIN
	roll_number:='&r';
	select gpa into score from studenttable where roll = roll_number;
	DBMS_OUTPUT.PUT_LINE(score);
END;

-- Display the letter grade of a student based on the GPA
-- A+: 10, A: 9-10, B: 8-9, C: 7-8, D: 6-7, E: 5-6 F: <5

DECLARE
	roll_number studenttable.roll%TYPE;
	score studenttable.gpa%TYPE;
BEGIN
	roll_number:='&r';
	select gpa into score from studenttable where roll = roll_number;
	IF score between 0 and 4  then
		DBMS_OUTPUT.PUT_LINE('F');
	ELSIF score between 4 and 5 then
		DBMS_OUTPUT.PUT_LINE('E');
	ELSIF score between 5 and 6 then
		DBMS_OUTPUT.PUT_LINE('D');
	ELSIF score between 6 and 7 then
		DBMS_OUTPUT.PUT_LINE('C');
	ELSIF score between 7 and 8 then
		DBMS_OUTPUT.PUT_LINE('B');
	ELSIF score between 8 and 9 then
		DBMS_OUTPUT.PUT_LINE('A');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('A+');
	END IF;
END;

-- Input the date of issue and date of return of a book and calculate the fine
-- 7 Days = no fine
-- 8-15 Days = 1 Rs/day
-- 16-30 Days = 2 Rs/day
-- After 30 Days = 5 Rs
DECLARE
	in_date date;
	out_date date;
	diff number(10);
	penalty number(10);
BEGIN
	out_date:='&d';
	in_date:='&f';

	diff := TO_DATE(in_date,'dd-mm-yy') - TO_DATE(out_date,'dd-mm-yy');
	IF diff between 0 and 7 then
		penalty := 0;
		DBMS_OUTPUT.PUT_LINE('NIL');
	ELSIF diff between 8 and 15 then
		penalty:= (diff - 8) * 1;
		DBMS_OUTPUT.PUT_LINE(penalty);
	ELSIF diff between 16 and 30 then
		penalty:= (diff - 8) * 1 + (diff - 15) * 2;
		DBMS_OUTPUT.PUT_LINE(penalty);
	ELSE
		penalty:= (diff - 8) * 1 + (diff - 15) * 2 + (diff - 30) * 5;
        DBMS_OUTPUT.PUT_LINE(penalty);
	END IF;
END;


-- Write a PL/SQL block to print the letter grade of all the students(RollNo: 1 - 5).
DECLARE
	roll_number studenttable.roll%TYPE;
	score studenttable.gpa%TYPE;
	n number(10);
	i number(10);
BEGIN
	roll_number:=1;
	i:=0;
	select count(roll) into n  from studenttable;
	while i<n
	LOOP
		select gpa into score from studenttable where roll = roll_number;
		IF score between 0 and 4  then
			DBMS_OUTPUT.PUT_LINE('F');
		ELSIF score between 4 and 5 then
			DBMS_OUTPUT.PUT_LINE('E');
		ELSIF score between 5 and 6 then
			DBMS_OUTPUT.PUT_LINE('D');
		ELSIF score between 6 and 7 then
			DBMS_OUTPUT.PUT_LINE('C');
		ELSIF score between 7 and 8 then
			DBMS_OUTPUT.PUT_LINE('B');
		ELSIF score between 8 and 9 then
			DBMS_OUTPUT.PUT_LINE('A');	
		ELSE 
			DBMS_OUTPUT.PUT_LINE('A+');
		END IF;
		i:=i+1;
		roll_number:=roll_number+1;
	END LOOP;
END;


-- Alter StudentTable by appending an additional column LetterGrade Varchar2(2). Then write a PL/SQL block to update the table with letter grade of each student.
alter table studenttable add grade varchar2(2);

DECLARE
	roll_number studenttable.roll%TYPE;
	score studenttable.gpa%TYPE;
	n number(10);
	i number(10);
BEGIN
	roll_number:=1;
	i:=0;
	select count(roll) into n  from studenttable;
	while i<n
	LOOP
	select gpa into score from studenttable where roll = roll_number;
	IF score between 0 and 4  then
		update studenttable set grade = 'F' where roll = roll_number;
	ELSIF score between 4 and 5 then
		update studenttable set grade = 'E' where roll = roll_number;
	ELSIF score between 5 and 6 then
		update studenttable set grade = 'D' where roll = roll_number;
	ELSIF score between 6 and 7 then
		update studenttable set grade = 'C' where roll = roll_number;
	ELSIF score between 7 and 8 then
		update studenttable set grade = 'B' where roll = roll_number;
	ELSIF score between 8 and 9 then
		update studenttable set grade = 'A' where roll = roll_number;
	ELSE
		update studenttable set grade = 'A+' where roll = roll_number;
	END IF;
	i:=i+1;
	roll_number:=roll_number+1;
	END LOOP;
END;

-- Write a PL/SQL block to find the student with max. GPA without using aggregate function.
DECLARE
	roll_number studenttable.roll%TYPE;
	score studenttable.gpa%TYPE;
	n number(10);
	temp studenttable.gpa%TYPE;
BEGIN
	temp:=0;
	roll_number:=1;
	select count(roll) into n from studenttable;
	FOR i IN 1..n LOOP
		select gpa into score from studenttable where roll = roll_number;
		IF score>temp THEN temp:=score;
		ELSE temp:=temp;
		END IF;
		roll_number:=roll_number+1;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(temp);
END;

-- Implement lab exercise 4 using GOTO.
DECLARE
	roll_number studenttable.roll%TYPE;
	score studenttable.gpa%TYPE;
	n number(10);
	i number(10);
BEGIN
	roll_number:=1;
	i:=0;
	select count(roll) into n  from studenttable;
	while i<n
	LOOP
		select gpa into score from studenttable where roll = roll_number;
		IF score between 0 and 4  then GOTO F;
		ELSIF score between 4 and 5 then GOTO E;
		ELSIF score between 5 and 6 then GOTO D;
		ELSIF score between 6 and 7 then GOTO C;
		ELSIF score between 7 and 8 then GOTO B;
		ELSIF score between 8 and 9 then GOTO A;
		ELSE GOTO Aplus;
		END IF;
		i:=i+1;
		roll_number:=roll_number+1;
	END LOOP;
	<<F>>
		DBMS_OUTPUT.PUT_LINE('F');
	<<E>>
		DBMS_OUTPUT.PUT_LINE('E');
	<<D>>
		DBMS_OUTPUT.PUT_LINE('D');
	<<C>>
		DBMS_OUTPUT.PUT_LINE('C');
	<<B>>
		DBMS_OUTPUT.PUT_LINE('B');
	<<A>>
		DBMS_OUTPUT.PUT_LINE('A');	
	<<Aplus>>
		DBMS_OUTPUT.PUT_LINE('A+');				
END;

