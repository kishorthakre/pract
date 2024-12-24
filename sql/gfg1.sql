--CREATE TABLE Worker (
--	WORKER_ID INT IDENTITY(001,1) PRIMARY KEY,
create database newtest1;
use newtest1;

select * from student;

create table student(STUDENT_ID int identity(201, 1), 
                    FIRST_NAME CHAR(25),
					LAST_NAME CHAR(25),
					GPA float, 
					ENROLLMENT_DATE DATETIME,
					MAJOR CHAR(25));

insert into student 
	( FIRST_NAME, LAST_NAME, GPA, ENROLLMENT_DATE, MAJOR)
	VALUES ( 'Shivansh',  'Mahajan',  8.79,  '2021-09-01 09:30:00',  'Computer Science'),
           ( 'Umesh',  'Sharma',  8.44,  '2021-09-01 08:30:00',  'Mathematics'),
           ( 'Rakesh',  'Kumar',  5.60,  '2021-09-01 10:00:00',  'Biology'),
           ( 'Radha',  'Sharma',  9.20,  '2021-09-01 12:45:00',  'Chemistry'),  
           ( 'Kush',  'Kumar',  7.85,  '2021-09-01 08:30:00',  'Physics'),
           ( 'Prem',  'Chopra',  9.56,  '2021-09-01 09:24:00',  'History'), 
           ( 'Pankaj',  'Vats',  9.78,  '2021-09-01 02:30:00',  'English'), 
           ( 'Navleen',  'Kaur',  7.00,  '2021-09-01 06:30:00',  'Mathematics');

-- Alter Table 
--ADD – To add a new column to the table:
ALTER TABLE table_name
ADD column_name datatype;

--MODIFY/ALTER – To change the data type of an existing column:
ALTER TABLE table_name
MODIFY COLUMN column_name datatype;

--DROP – To delete an existing column from the table:
ALTER TABLE table_name
DROP COLUMN column_name;

--RENAME COLUMN – To rename an existing column:
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;

--RENAME TO – To rename the table itself:
ALTER TABLE table_name
RENAME TO new_table_name;



--drop table worker;
select * from program;

create table program( STUDENT_REF_ID int, 
                      PROGRAM_NAME char(25),
					  PROGRAM_START_DATE datetime);

insert into program(STUDENT_REF_ID, PROGRAM_NAME, PROGRAM_START_DATE) 
        values(201, 'Computer Science', '2021-09-01 00:00:00'), 
               (202, 'Mathematics', '2021-09-01 00:00:00'), 
               (208, 'Mathematics', '2021-09-01 00:00:00'), 
               (205, 'Physics', '2021-09-01 00:00:00'), 
               (204, 'Chemistry', '2021-09-01 00:00:00'), 
               (207, 'Psychology', '2021-09-01 00:00:00'), 
               (206, 'History', '2021-09-01 00:00:00'), 
               (203, 'Biology', '2021-09-01 00:00:00');

create table Scholarship ( STUDENT_REF_ID int, 
                      SCHOLARSHIP_AMOUNT int,
					  SCHOLARSHIP_DATE datetime);

insert into Scholarship(STUDENT_REF_ID, SCHOLARSHIP_AMOUNT, SCHOLARSHIP_DATE) 
        values(201, 5000, '2021-10-15 00:00:00'), 
              (202, 4500, '2022-08-18 00:00:00'), 
              (203, 3000, '2022-01-25 00:00:00'), 
              (201, 4000, '2021-10-15 00:00:00');					  



--1. Write a SQL query to fetch “FIRST_NAME” from the Student table in upper case and use ALIAS name as STUDENT_NAME.

select upper(first_name) as student_name from student;

--2. Write a SQL query to fetch unique values of MAJOR Subjects from Student table.

select distinct(major) from student;
--or 
SELECT MAJOR FROM STUDENT GROUP BY(MAJOR); 

--3. Write a SQL query to print the first 3 characters of FIRST_NAME from Student table.
select SUBSTRING(first_name, 1,3) from student ;


--4. Write a SQL query to find the position of alphabet (‘a’) in the first name column ‘Shivansh’ from Student table.
SELECT CHARINDEX('a', FIRST_NAME) FROM Student WHERE FIRST_NAME = 'Shivansh'; 

--5. Write a SQL query that fetches the unique values of MAJOR Subjects from Student table and print its length.
select distinct(major), len(major) from student;

--6. Write a SQL query to print FIRST_NAME from the Student table after replacing ‘a’ with ‘A’.
select replace(first_name, 'a','A') from student;

--7. Write a SQL query to print the FIRST_NAME and LAST_NAME from Student table into single column COMPLETE_NAME.
select concat(first_name,' ', last_name) as complete_name from student;


--8.SQL query to print all Student details from Student table order by FIRST_NAME Ascending and MAJOR Subject descending .

select * from student order by first_name asc, major desc;


--9. Write a SQL query to print details of the Students with the FIRST_NAME as ‘Prem’ and ‘Shivansh’ from Student table.
select * from student where FIRST_NAME in ('Prem', 'Shivansh');

--10. Write a SQL query to print details of the Students excluding FIRST_NAME as ‘Prem’ and ‘Shivansh’ from Student table.
select * from student where FIRST_NAME not in ('Prem', 'Shivansh');


--11. Write a SQL query to print details of the Students whose FIRST_NAME ends with ‘a’.
select * from student where first_name like '%a';


--12. Write an SQL query to print details of the Students whose FIRST_NAME ends with ‘a’ and contains six alphabets.
select * from student where first_name like '_____a';


--Write an SQL query to print details of the Students whose GPA lies between 9.00 and 9.99.
select * from student where gpa between 9.00 and 9.99;


--14. Write an SQL query to fetch the count of Students having Major Subject ‘Computer Science’.
select count(*) from student where major = 'computer science';

--15. Write an SQL query to fetch Students full names with GPA >= 8.5 and <= 9.5.
select concat(first_name, '',last_name) as fullname from student where gpa between 8.5 and 9.5;


--16. Write an SQL query to fetch the no. of Students for each MAJOR subject in the descending order.
select major,count(*) from student group by major order by count(major) desc;

--17.details of students who have received scholarships, including their names, scholarship amounts, and scholarship dates.
select student.first_name, 
       student.last_name, 
	   scholarship.SCHOLARSHIP_AMOUNT, 
	   scholarship.SCHOLARSHIP_DATE 
         from student 
		inner join scholarship on student.STUDENT_ID = scholarship.STUDENT_REF_ID;

--18. Write an SQL query to show only odd rows from Student table.
select * from student where STUDENT_ID %2 != 0;

--19. Write an SQL query to show only even rows from Student table.
select * from student where STUDENT_ID %2 = 0;

--20. List all students and their scholarship amounts if they have received any. If a student has not received a scholarship,
--    display NULL for the scholarship details.
SELECT Student.FIRST_NAME,
    Student.LAST_NAME,
    Scholarship.SCHOLARSHIP_AMOUNT,
    Scholarship.SCHOLARSHIP_DATE
	from student 
	   left join scholarship on Student.student_id = scholarship.student_ref_id;

--21. Write an SQL query to show the top n (say 5) records of Student table order by descending GPA.
select top 5 * from student order by gpa desc ;

--22. Write an SQL query to determine the nth (say n=5) highest GPA from a table.
SELECT * FROM (SELECT first_name, LAST_NAME, gpa, DENSE_RANK() over(ORDER BY gpa desc) As alias_for_nested_query
                   FROM student) As alias_for_first_query WHERE alias_for_nested_query=5;

--23. Write an SQL query to determine the 5th highest GPA without using LIMIT keyword.
SELECT * FROM Student s1 
WHERE 4 = (SELECT COUNT(DISTINCT (s2.GPA)) FROM Student s2 WHERE s2.GPA >= s1.GPA);

--24. Write an SQL query to fetch the list of Students with the same GPA. 
SELECT s1.* FROM Student s1, Student s2 WHERE s1.GPA = s2.GPA AND s1.Student_id != s2.Student_id;

--25. Write an SQL query to show the second highest GPA from a Student table using sub-query.
select * from (select first_name, LAST_NAME, gpa, rank() over(order by gpa desc) as sb1 from student) as sb2
             where sb1 = 2;

SELECT MAX(GPA) FROM Student WHERE GPA NOT IN(SELECT MAX(GPA) FROM Student);


--26. Write an SQL query to show one row twice in results from a table.
select * from student union all select * from student order by student_id;


--27. Write an SQL query to list STUDENT_ID who does not get Scholarship.
select student_id from student where STUDENT_ID not in (select STUDENT_REF_ID from Scholarship);

--28. Write an SQL query to fetch the first 50% records from a table. 
select top 50 percent * from student;

--29. Write an SQL query to fetch the MAJOR subject that have less than 4 people in it.
select major, count(major) from student group by major having count(major) < 4;

--30. Write an SQL query to show all MAJOR subject along with the number of people in there.
select major, count(major) from student group by major ;


--31. Write an SQL query to show the last record from a table.
SELECT * FROM Student WHERE STUDENT_ID = (SELECT MAX(STUDENT_ID) FROM STUDENT);

--32. Write an SQL query to fetch the first row of a table.
SELECT * FROM Student WHERE STUDENT_ID = (SELECT MIN(STUDENT_ID) FROM Student);

--33. Write an SQL query to fetch the last five records from a table.
select * from (select top 5 * from student order by STUDENT_ID desc) as sb1 order by student_id; 

--34. Write an SQL query to fetch three max GPA from a table 
select top 3 gpa from student order by gpa desc;

--35. Write an SQL query to fetch three min GPA from a table 
select top 3 gpa from student order by gpa asc;

--37. Write an SQL query to fetch MAJOR subjects along with the max GPA in each of these MAJOR subjects.
select major, max(gpa) from student group by major;

--38. Write an SQL query to fetch the names of Students who has highest GPA.
select first_name, gpa from student where gpa = (select max(gpa) from student);


--39. Write an SQL query to show the current date and time.
SELECT getdate();


--41. Write an SQL query to update the GPA of all the students in ‘Computer Science’ MAJOR subject to 7.5.
update student set gpa = 4.0 where major = 'computer science';

--42. Write an SQL query to find the average GPA for each major.
select major, avg(gpa) from student group by major;

--44. Write an SQL query to find the number of students in each major who have a GPA greater than 7.5.
SELECT MAJOR, COUNT(STUDENT_ID) AS HIGH_GPA_COUNT FROM Student WHERE GPA > 3.5 GROUP BY MAJOR;




select * from scholarship;
select * from student;

-- ===================================================================================================================

select * from EmployeeDetails;
create table EmployeeDetails(EmpId int, 
                    FullName CHAR(25),
					ManagerId int,
					DateOfJoining DATE, 
					City CHAR(25));

insert into EmployeeDetails 
	(EmpId, FullName, ManagerId, DateOfJoining, City)
	VALUES (121, 'John Snow',  321,  '2019-01-31',  'Toronto'),
           (321, 'Walter White', 986,  '2020-01-30',  'California'),
           (421, 'Kuldeep Rana', 876,  '2021-11-27',  'New Delhi'),
		   (221, 'Kishor Thakre', 214,  '2024-08-30',  'Pune');

create table EmployeeSalary(EmpId int, 
                    Project CHAR(25),
					Salary int,
					Variable int);

insert into EmployeeSalary 
	(EmpId, Project, Salary, Variable)
	VALUES (121, 'P1',  8000, 500),
           (321, 'P2', 10000,  1000),
           (421, 'P1', 12000, 0),
		   (521, 'P3', 13000, 15);

select * from EmployeeDetails ;



-- 1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
select empid, fullname from EmployeeDetails where ManagerId = 986;

--2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.
select distinct(project) from EmployeeSalary;

--3. Write an SQL query to fetch the count of employees working in project ‘P1’.
select count(*) from EmployeeSalary where Project = 'P1';

--4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
select max(salary), min(salary), avg(salary) from EmployeeSalary;

--5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
select empid from EmployeeSalary where salary between 9000 and 15000;

--6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
select * from EmployeeDetails where ManagerId = 321 and city = 'Toronto';

--7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
select * from EmployeeDetails where ManagerId = 321 or city = 'California';

--8. Write an SQL query to fetch all those employees who work on Projects other than P1.
select * from EmployeeSalary where Project != 'P1';
select * from EmployeeSalary where Project <> 'P1';
select * from EmployeeSalary where not Project = 'P1';

--9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
select salary+variable as TotalSalary  from EmployeeSalary;

--10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with 
--    any sequence of characters.
select * from EmployeeDetails where FullName like '__hn%';
select * from EmployeeDetails where City like 'c%%a'

--11. Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
select empid from EmployeeDetails union select empid from EmployeeSalary;

--12. Write an SQL query to fetch common records between two tables.
select * from EmployeeDetails where empid in (select empid from EmployeeSalary);

--13. Write an SQL query to fetch records that are present in one table but not in another table.
select * from EmployeeDetails left join EmployeeSalary on EmployeeDetails.EmpId = EmployeeSalary.EmpId;

select * from EmployeeDetails right join EmployeeSalary on EmployeeDetails.EmpId = EmployeeSalary.EmpId;

--16. Write an SQL query to fetch the employee’s full names and replace the space with ‘-’.
select replace(fullname, '','-') from EmployeeDetails;

--17. Write an SQL query to fetch the position of a given character(s) in a field.
select CHARINDEX('Snow', fullname) from EmployeeDetails;

--18. Write an SQL query to display both the EmpId and ManagerId together.
select CONCAT(empid, managerid) from EmployeeDetails;

select * from EmployeeDetails;
select * from EmployeeSalary;




-------------------------------------
-- https://upesonline.ac.in/blog/advanced-sql-interview-questions
create table Customers(Customer_ID int identity(1, 1), 
                    NAME CHAR(25),
					city CHAR(25));

insert into Customers 
	(Name, City)
	VALUES ( 'John Levi',  'New York'),
           ( 'Jane Tye',  'Los Angeles'),
           ( 'Mike Foley',  'Chicago'),
           ( 'Alice White',  'New York');

create table Orders(Order_ID int identity(100, 1), 
                    Customer_ID CHAR(25),
					Order_Date DATE,
					Order_Total float);
		
select * from Orders;

insert into Orders 
	(Customer_ID, Order_Date, Order_Total)
	VALUES ( '1',  '2023-07-01', 100.00),
           ( '2',  '2023-06-15', 50.00),
           ( '3',  '2023-07-05',150.00 ),
           ( '1',  '2023-07-07', 75.00),
		   ('4', '2023-07-02', 200.00);

-- 1. Find the total number of orders placed by each customer, excluding orders placed in June.



--===================================================================================================

select * from EmployeeDetails;

-- split column values into new columns
select substring(FullName, 1, charindex(' ',FullName)-1) as fname, 
       substring(FullName, charindex(' ', FullName) +1, len(FullName)) as lname
from EmployeeDetails;




-- check dtyeps
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='student';

-- assign row number 
--select *, row_number() over(order by(select 1) ) as num from student t

select * from (select *, row_number() over(order by(select 1) ) as num from student t) k where num = 4;
