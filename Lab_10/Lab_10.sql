-- SOLUTIONS ARE PROBABLY WRONG!!

-- The HRD manager has decided to raise the salary of all the Instructors in a given department number by 5%. Whenever, any such raise is given to the instructor, a record for the same is maintained in the salary_raise table. It includes the Instuctor Id, the date when the raise was given and the actual raise amount. Write a PL/SQL block to update the salary of each Instructor and insert a record in the salary_raise table.
-- salary_raise(Instructor_Id, Raise_date, Raise_amt)

DECLARE
    dept_n instructor.dept_name%TYPE;
    iid instructor.id%TYPE;
    salary instructor.salary%TYPE;
    n number(10);
    i number(10);
    ramt number(10);
    rdt date;
BEGIN
    dept_n:= '&k';
    i:=0;
    select count(id) into n from instructor where dept_name = dept_n;
    FOR i IN 1..n LOOP
        select id into iid from instructor where dept_name = dept_n;
        select salary into salary from instructor where id = iid;
        ramt:=salary*0.05;
        rdt:=sysdate;
        update instructor
            set salary = salary + ramt where id = iid;
        insert into salary_raise values(iid, rdt, ramt);
    END LOOP;
END;

-- Write a PL/SQL block that will display the ID, name, dept_name and tot_cred of the first 10 students with lowest total credit.
DECLARE
    n NUMBER(10);
    i NUMBER(10);
    sid student.id%TYPE;
    sname student.name%TYPE;
    sdept student.dept_name%TYPE;
    stc student.tot_cred%TYPE;
BEGIN
    i := 0;
    SELECT COUNT(id) INTO n FROM student;
    FOR i IN 1..10 LOOP
        SELECT id, name, dept_name, tot_cred INTO sid, sname, sdept, stc
        FROM (
            SELECT id, name, dept_name, tot_cred, ROW_NUMBER() OVER (ORDER BY tot_cred) AS rn
            FROM student
        ) WHERE rn = i;
        DBMS_OUTPUT.PUT_LINE('ID: '||sid||' Name: '||sname||' Dept: '||sdept||' Total Credits: '||stc);
    END LOOP;
END;

-- Print the Course details and the total number of students registered for each course along with the course details - (Course-id, title, dept-name, credits, instructor_name, building, room-number, time-slot-id, tot_student_no )
DECLARE
    n NUMBER(10);
    i NUMBER(10);
    cid course.course_id%TYPE;
    ctitle course.title%TYPE;
    cdept course.dept_name%TYPE;
    ccredits course.credits%TYPE;
    ciname instructor.name%TYPE;
    cbuilding section.building%TYPE;
    croom section.room_number%TYPE;
    ctsid section.time_slot_id%TYPE;
    ctsno NUMBER(10);
    
    CURSOR course_cursor IS
        SELECT course_id, title, dept_name, credits
        FROM course;
BEGIN
    i := 0;
    OPEN course_cursor;
    LOOP
        FETCH course_cursor INTO cid, ctitle, cdept, ccredits;
        EXIT WHEN course_cursor%NOTFOUND;
        
        SELECT i.name, s.building, s.room_number, s.time_slot_id, COUNT(t.id) AS total_students into ciname, cbuilding, croom, ctsid
        FROM instructor i
        WHERE c.course_id = cid
        JOIN takes t ON i.id = t.id
        JOIN section s ON s.course_id = t.course_id AND s.sec_id = t.sec_id
        JOIN course c ON c.course_id = s.course_id
        GROUP BY i.name, s.building, s.room_number, s.time_slot_id, c.course_id, c.title, c.dept_name, c.credits;
        
        DBMS_OUTPUT.PUT_LINE('Course ID: '||cid||' Title: '||ctitle||' Dept: '||cdept||' Credits: '||ccredits||' Instructor: '||ciname||' Building: '||cbuilding||' Room: '||croom||' Time Slot ID: '||ctsid||' Total Students: '||ctsno);
    END LOOP;
    CLOSE course_cursor;
END;


-- Find all students who take the course with Course-id: CS101 and if he/ she has less than 30 total credit (tot-cred), deregister the student from that course. (Delete the entry in Takes table)
DECLARE
    n NUMBER(10);
    i NUMBER(10);
    sid student.id%TYPE;
    stc student.tot_cred%TYPE;
    
    CURSOR student_cursor IS
        SELECT id, tot_cred
        FROM student;
BEGIN
    i := 0;
    OPEN student_cursor;
    LOOP
        FETCH student_cursor INTO sid, stc;
        EXIT WHEN student_cursor%NOTFOUND;
        
        IF stc < 30 THEN
            DELETE FROM takes WHERE id = sid AND course_id = 'CS101';
        END IF;
    END LOOP;
    CLOSE student_cursor;
END;

-- Write a PL/SQL block to print the list of Instructors teaching a specified course.
DECLARE
    n NUMBER(10);
    i NUMBER(10);
    iid instructor.id%TYPE;
    iname instructor.name%TYPE;
    idept instructor.dept_name%TYPE;
    icourse section.course_id%TYPE;
    
    CURSOR instructor_cursor IS
        SELECT id, name, dept_name
        FROM instructor;
BEGIN
    i := 0;
    OPEN instructor_cursor;
    LOOP
        FETCH instructor_cursor INTO iid, iname, idept;
        EXIT WHEN instructor_cursor%NOTFOUND;
        
        SELECT course_id INTO icourse
        FROM section
        WHERE id = iid;
        
        IF icourse = 'CS101' THEN
            DBMS_OUTPUT.PUT_LINE('Instructor ID: '||iid||' Name: '||iname||' Dept: '||idept);
        END IF;
    END LOOP;
    CLOSE instructor_cursor;
END;

-- Write a PL/SQL block to list the students who have registered for a course taught by his/her advisor.
DECLARE
    sid student.id%TYPE;
    sname student.name%TYPE;
    sdept student.dept_name%TYPE;
    sadvisor advisor.i_id%TYPE;
    scourse teaches.course_id%TYPE;
    
    CURSOR student_cursor IS
        SELECT s.id, s.name, s.dept_name, a.i_id
        FROM student s
        JOIN advisor a ON s.id = a.s_id;
BEGIN
    OPEN student_cursor;
    LOOP
        FETCH student_cursor INTO sid, sname, sdept, sadvisor;
        EXIT WHEN student_cursor%NOTFOUND;

        IF EXISTS(SELECT 1 FROM takes WHERE id = sid AND course_id in (select course_id from teaches where id = sadvisor)) THEN
            DBMS_OUTPUT.PUT_LINE('Student ID: '||sid||' Name: '||sname||' Dept: '||sdept);
        END IF;
    END LOOP;
    CLOSE student_cursor;
END;