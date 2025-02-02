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

----===============================================================

CREATE TABLE GFG_Employees (
   id INT PRIMARY KEY,
   name VARCHAR (20) ,
   email VARCHAR (25),
   department VARCHAR(20)
);
INSERT INTO GFG_Employees (id, name, email, department) VALUES 
(1, 'Jessie', 'jessie23@gmail.com', 'Development'),
(2, 'Praveen', 'praveen_dagger@yahoo.com', 'HR'),
(3, 'Bisa', 'dragonBall@gmail.com', 'Sales'),
(4, 'Rithvik', 'msvv@hotmail.com', 'IT'),
(5, 'Suraj', 'srjsunny@gmail.com', 'Quality Assurance'),
(6, 'Om', 'OmShukla@yahoo.com', 'IT'),
(7, 'Naruto', 'uzumaki@konoha.com', 'Development');

Select * From GFG_Employees;

-- Deleting single record
delete from GFG_Employees where name = 'Suraj';

-- Deleting all of the records
delete from GFG_Employees

-- If needed, you can rollback the deletion
--START TRANSACTION;
--DELETE FROM GFG_Employees WHERE department = 'Development';
--ROLLBACK;

--==================================================================

-- Inner Join how many rows will be created?
create table tab1(id int);
insert into tab1(id) values(1),(2),(3),(2),(4);

create table tab2(id int);
insert into tab2 (id) values(1),(2),(2),(3);

select * from tab1;
select * from tab2;

select * from tab1 inner join tab2 on tab1.id = tab2.id;

--======================================================
-- remove duplicate name and keep latest record
create table emp2(emp_name varchar(25), doj date);
insert into emp2(emp_name, doj) values('James', '2020-01-06'),
                                      ('Michael', '2023-08-14'),
									  ('Robert', '2014-06-09'),
									  ('James', '2023-07-01'),
									  ('Robert', '2020-01-01'),
									  ('Jen', '2015-08-15')
select * from emp2;
select * from (select *, row_number() over(partition by emp_name order by doj desc) as a1 from emp2) t1 where a1=1;

--====================================

create table table1(id int);
insert into table1 (id) values (null),(null);

create table table2 (id int);
insert into table2 (id) values (null),(null),(null);

select * from table1;
select * from table2;

select t1.id, t2.id from table1 t1 inner join table2 t2 on t1.id = t2.id;
select t1.id, t2.id from table1 t1 left join table2 t2 on t1.id = t2.id;
select t1.id, t2.id from table1 t1 right join table2 t2 on t1.id = t2.id;
select t1.id, t2.id from table1 t1 cross join table2 t2 ;

select t1.id, t2.id from table1 t1 full outer join table2 t2 on t1.id = t2.id;

--===========================

--difference between count(*) & count(1)

create table depart (dept_id int identity(201, 1), dept_name varchar(20));
insert into depart (dept_name) values('IT'),('SALES'),('HR'), (NULL), ('MKTG');

select * from depart;
select count(*) from depart;
select count(dept_name) from depart;

--==========================================================

create table t4 (name varchar(25), mark int);
insert into t4 (name, mark) values('a',5), ('b',10), ('b',10), ('b',20), ('c',20), ('d',30);

update t4 set mark = 20 where name = 'b' and mark = 30;

select * from (select *, rank() over(order by mark asc) rnk from t4) a1;
select * from (select *, dense_rank() over(order by mark asc) d_rnk from t4) a1;
select * from (select *, row_number() over(order by mark asc) rw_no from t4) a1;

select * from (select *, rank() over(partition by name order by mark asc) rnk from t4) a1;
select * from (select *, dense_rank() over(partition by name order by mark asc) d_rnk from t4) a1;
select * from (select *, row_number() over(partition by name order by mark asc) rw_no from t4) a1;

select * from (select *, lag(mark) over(partition by name order by mark asc) d_rnk from t4) a1;
select * from (select *, lead(mark) over(partition by name order by mark asc) rw_no from t4) a1;

--=========================================================

create table e1 (emp_id int, dept_id int, last_name varchar(25), salary int)
insert into e1 (emp_id, dept_id, last_name, salary) values 
               (201, 20, 'Hartstein', 13000),
			   (114, 30, 'Raphaely', 11000),
			   (123, 50, 'Vollman', 6500),
			   (122, 50, 'Kaufling', 7900),
			   (120, 50, 'Weiss', 8000),
			   (121, 50, 'Fripp', 8200),
			   (103, 60, 'Hunold', 9000),
			   (147, 80, 'Errazuriz', 12000),
			   (146, 80, 'Partners', 13500),
			   (145, 80, 'Russell', 14000),
			   (100, 90, 'King', 24000),
			   (108, 100, 'Greenberg', 12000)
select * from e1;

-- Which employees reeive more than the average salary of their department?
select e.emp_id, e.dept_id, e.last_name, e.salary from e1 e 
where e.salary > (select avg(i.salary) from e1 i where e.dept_id = i.dept_id)

-- ===============================================================================

--To swap the values in the gender column of the student table where the gender is 'female' and 'male'
create table j21(eno int, ename char(25), mgrno int, gender char(25));
insert into j21(eno, ename, mgrno, gender) values (10, 'Anil', Null, 'Male'),
                                      (20, 'Pavan', 10, 'Male'),
									  (30, 'Sunil', 20, 'Male'),
									  (40, 'Kumar', 10, 'Male'),
									  (50, 'Vijay', 20, 'Male'),
									  (42, 'Vijaya', 28, 'FeMale')
select * from j21;
update j21 set gender =(case gender when 'Male' then 'Female' else 'Male' end);
select * from j21;

--=================================================================

-- Write a query to display the names of teachers who teach the math subject only.
create table t21 (i_id int, sub char(25));
insert into t21(i_id, sub) values (1, 'Math'),(2, 'Math'), (4, 'CHEM'), (5, 'Math'), (2, 'ENG'), (3, 'PHY');
select * from t21;

select * from t21 where sub = 'Math' and i_id in (select i_id from t21 group by i_id having count(i_id) = 1); 

--===================================================

-- call duration 

create table c22(p1 int, p2 int, duration int);
insert into c22(p1, p2, duration) values (10, 20, 58), (20, 10, 12), (10, 30, 20), (30,40,100),
                                         (30, 40, 200), (30, 40, 200), (40, 30, 500)
select * from c22;

select p1, p2, count(duration) as call_count, sum(duration) as total_duration
from (select * from c22 union all select p1, p2, duration from c22) t1 where p1 < p2 group by p1, p2;

--========================
create table n21 (id int, fname char(25), lname char(25));
insert into n21 (id, fname, lname) values(1, 'Ram', Null), (1, Null, 'Kumar'), (2, 'Shyam', Null), (2, Null, 'Kumar'), (3, 'Sita', Null)
select * from n21;

select id, max(fname) as fname, max(lname) as lname from n21 group by id;

--=====================================================

--Find out the companies where revenue has only increased over the years and there was no decrease at all for any point. 
create table c21(company char(25), year int, revenue int);
insert into c21(company, year, revenue) values ('ABC', 2000, 100), ('ABC', 2001, 110), ('ABC', 2002, 120),
                                               ('XYZ', 2000, 100), ('XYZ', 2001, 90), ('XYZ', 2002, 120), 
											   ('RXC', 2000, 500),('RXC', 2001, 400),('RXC', 2002, 600),('RXC', 2003, 800)
select * from c21;

select * from c21 
where company in (select company from (select company, (revenue-lag(revenue, 1, 0) over (partition by company order by year)) diff from c21) t
group by company having min(diff) > 0 );


--================================================

CREATE TABLE employees1 (
	id INT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	salary INT
);

INSERT INTO employees1 (id, name, salary) VALUES (1, 'Sangeeta', 100000);
INSERT INTO employees1 (id, name, salary) VALUES (2, 'Ranjita', 150000);
INSERT INTO employees1 (id, name, salary) VALUES (3, 'Anita', 70000);
INSERT INTO employees1 (id, name, salary) VALUES (4, 'Sunita', 50000);
INSERT INTO employees1 (id, name, salary) VALUES (5, 'Anjeeta', 90000);

select * from employees1;

--Write a SQL query to find the second-highest salary from an employee table.
select max(salary) from employees1 where salary < (select max(salary) from employees1);

--SELECT DISTINCT(SALARY) FROM employees1 ORDER BY SALARY DESC LIMIT 1,1; 

--=================================================

CREATE TABLE employees2 (
	employee_id INT PRIMARY KEY,
	name VARCHAR(50));

INSERT INTO employees2 (employee_id, name)
VALUES
	(1, 'Raghav'),
	(2, 'Raashi'),
	(3, 'Rohan'),
	(4, 'Mohan');

CREATE TABLE projects (
	project_id INT PRIMARY KEY,
	name VARCHAR(50),
	employee_id INT,
	FOREIGN KEY (employee_id) REFERENCES employees2(employee_id)
);

INSERT INTO projects (project_id, name, employee_id)
VALUES
	(1, 'Project A', 1),
	(2, 'Project B', 2),
	(3, 'Project C', 1),
	(4, 'Project D', 3);

select * from employees2;
select * from projects;
--Write a SQL query to find the names of employees who have not been assigned to any project.

select name from employees2 where employee_id not in (select employee_id from projects);
select e.name from employees2 e left join projects on e.employee_id = projects.employee_id where projects.employee_id is null;

--================================================

CREATE TABLE Student1 (
	id INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	marks VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);
INSERT INTO Student1 (id, name, marks)
VALUES (1, 'Rohit', '87,92,76,89');


-- Student table, the marks column contains a list of values separated by commas. 
--    How can you determine the number of values in this comma-separated list?

select * from student1;
SELECT id, name, marks, LEN(marks) - LEN(REPLACE(marks, ',', '')) + 1 AS num_marks FROM Student1 WHERE id = 1;

--=======================================================================

CREATE TABLE employees (
	id INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	annual_salary DECIMAL(10, 2) NOT NULL,
	PRIMARY KEY (id)
);
INSERT INTO employees (id, name, annual_salary)
VALUES (1, 'Muskan', 60000);

INSERT INTO employees (id, name, annual_salary)
VALUES (2, 'Pallavi', 75000);

INSERT INTO employees (id, name, annual_salary)
VALUES (3, 'Raashi', 90000);

select * from employees;
--Display the monthly Salary of Employees given annual salary.
select annual_salary / 12 as monthly_salary from employees;

---==========================================================

--How do you delete duplicate rows in SQL?
--with ctl as (select col_name, row_number() over(partition By col_name order by col_name) as row_num from tbl) 
--delete from ctl where row_num > 1;


--COALESCE Function: The COALESCE() function returns the first non-NULL value in a list of expressions.

--SELECT COALESCE(phone_number, 'Not Available') FROM contacts;

--IFNULL() or ISNULL(): These functions can be used to replace NULL values with a specified value.

--SELECT ISNULL(salary, 0) FROM employees;

https://medium.com/@nirajan_DataAnalyst/15-common-sql-coding-interview-questions-and-answers-2024-e9e60cb4bd6b 

CREATE TABLE p25 (
	project_id INT PRIMARY KEY,
	name VARCHAR(50),
	employee_id INT,
	FOREIGN KEY (employee_id) REFERENCES employees2(employee_id)
);

INSERT INTO p25 (project_id, name, employee_id)
VALUES
	(1, 'Project A', 1),
	(2, 'Project B', 2),
	(3, 'Project C', 1),
	(4, 'Project D', 3),
	(5, 'Project C', 1),
	(6, 'Project C', 1),
	(7, 'Project D', 3);
select * from p25;

--  Write a SQL query to retrieve unique records without using DISTINCT or GROUP BY?
select distinct name, employee_id from p25 order by employee_id;
select name, employee_id from p25 group by name, employee_id order by employee_id ;
select * from (select *, row_number() over(partition by name order by employee_id) a1 from p25) a2 where employee_id=1 ;

--=======================================

--Find the employees earning more than managers
create table e27 (id int, name varchar(25), salary int, mid int);
insert into e27 (id, name, salary, mid) values (1, 'John', 6000, 4),
                                                (2, 'Kevin', 11000, 4),
												(3, 'Bob', 8000, 5),
												(4, 'Laura', 9000, Null),
												(5, 'Sarah', 10000, Null)
select * from e27;
select emp.* from e27 emp join e27 mgr on emp.mid = mgr.id where emp.salary > mgr.salary;
--===============================

-- 1741. Find Total Time Spent by Each Employee.

CREATE TABLE e26 (
	emp_id INT,
	event_day VARCHAR(50),
	in_time INT,
	out_time INT);
insert into e26(emp_id , event_day , in_time, out_time) values 
                                       (1, '2020-11-28', 4 , 32 ),
									   (1, '2020-11-28', 55, 200),
									   (1, '2020-12-03', 1 , 42 ),
									   (2, '2020-11-28', 3 , 33 ),
									   (2, '2020-12-09', 47, 74 )
select * from e26;

select  day, emp_id, (otime-itime) as total_time from 
(select event_day as day, emp_id, sum(in_time) as itime, sum(out_time) as otime from e26 group by emp_id, event_day) a;

--==========================================

create table e102 (employee_id int, fname varchar(25), lname varchar(25), department_id int, Manager_id int);
insert into e102 (employee_id, fname, lname, department_id, Manager_id) values (1, 'John', 'Doe', 1, 3), 
                                                        (2, 'Jane', 'Smith', 2, 3),
														(3, 'Adam', 'Johnson', 1, Null),
														(4, 'Emily', 'Davis', 2, 3),
														(5, 'Michael', 'Brown', 1, 3),
														(6, 'Sarah', 'Wilson', 2, 3),
														(7, 'David', 'Lee', 1, 3),
														(8, 'Laura', 'Garcia', 2, 3),
														(9, 'Ashley', 'MartineZ', 4, 10),
														(10, 'Christopher', 'Anderson', 4, Null),
														(11, 'Jessika', 'Taylor', 4, 10),
														(12, 'Mattew', 'Thomas', 4, 10)

create table d102(department_id int, department_name varchar(25));
insert into d102 (department_id, department_name) values(1, 'Marketing'),(2,'Sales'),(3,'Finance'),(4, 'Human Resources');

-- Write a SQL query to retrieve employee details along with their department and manager information from three tables: 
-- employees, departments, and employees (self-join for manager).
select * from e102;
select * from d102;

select e.employee_id, concat(e.fname,' ', e.lname) as employee_name, d.department_name ,
coalesce(concat(m.fname, ' ', m.lname), 'N/A') as manager_name
from e102 e inner join d102 d 
on e.department_id = d.department_id
left join 
e102 m on m.employee_id = e.Manager_id;

--===============================================================================

create table r202 (order_id int, prod_cat varchar(25), order_amnt int);
insert into r202 (order_id, prod_cat, order_amnt) values (1, 'Electronics', 500),
                                    (2, 'Clothing', 200),
									(3, 'Electronics', 800),
									(4, 'Electronics', 700),
									(5, 'Clothing', 300),
									(6, 'Electronics', 600),
									(7, 'Books', 150),
									(8, 'Clothing', 400),
									(9, 'Books', 250),
									(10, 'Electronics', 900),
									(11, 'Electronics', 750),
									(12, 'Clothing', 350),
									(13, 'Electronics', 1000),
									(14, 'Books', 200),
									(15, 'Clothing', 450),
									(16, 'Electronics', 850),
									(17, 'Electronics', 950),
									(18, 'Clothing', 500),
									(19, 'Books', 300),
									(20, 'Electronics', 1200)

-- Calculate the total sales revenue for each product category, including the number of orders and average order value, from a sales database.
select * from r202;

select prod_cat, 
count(order_id) as num_orders,
sum(order_amnt) as total_revenue, 
avg(order_amnt) as total_revenue
from r202 group by prod_cat

--======================================================

create table u202 (intr_id int, post_id int, user_id int, inter_type varchar(25));
insert into u202(intr_id, post_id, user_id, inter_type) values
									(1, 101, 1, 'Like'),
 									(2, 102 ,2, 'Like'),
									(3, 103 ,3, 'Comment'),
									(4, 104, 1, 'Share'),
									(5, 105,2, 'Like'),
									(6, 106,3, 'Share'),
									(7, 107,1, 'Comment'),
									(8, 108,2, 'Like'),
									(9, 109,3, 'Comment'),
									(10, 110,1, 'Like')
/*
Let’s write a complex query to calculate the following metrics for each post:
- Total number of likes, comments, and shares.
- Number of unique users who interacted with the post.
- Average number of interactions per user.   */
select * from u202;
select user_id, 
count(case when inter_type = 'Like' then 1 end) as num_likes,
count(case when inter_type = 'Comment' then 1 end) as num_comments,
count(case when inter_type = 'Share' then 1 end) as num_shares,
count(distinct(user_id)) as num_unique_users,
count(*) /count(distinct(user_id)) as avg_interactions_per_user
from u202 group by user_id ;

--==========================================================

create table esalary202 (emp_id int, dep_id int, salary int);
insert into esalary202(emp_id, dep_id, salary) values
(2, 1, 6000),
(3, 1, 5500),
(1, 1, 5000),
(6, 2, 6500),
(5, 2, 5800),
(4, 2, 6200),
(8, 3, 7200),
(9, 3, 6900),
(7, 3, 7000),
(10, 4, 5300)

--Determine the top highest-paid employees in each department based on their salary, using the RANK() window function.

select * from esalary202;
select emp_id, dep_id, salary , rank() over(partition by dep_id order by salary desc) as a1 from esalary202;

--========================================

create table prod202 (prod_id int, prod_name varchar(25), Prod_cat varchar(25));
insert into prod202 (prod_id,prod_name,Prod_cat) values  
(1, 'ProductA', 'Category 1'),
(2, 'ProductB', 'Category 1'),
(3, 'ProductC', 'Category 1'),
(4, 'ProductD', 'Category 2'),
(5, 'ProductE', 'Category 2'),
(6, 'ProductF', 'Category 2')

create table sale202 (sale_id int, prod_id int, revenue int);
insert into sale202 (sale_id,prod_id,revenue) values  
(1, 1, 100),
(2, 1, 150),
(3, 2, 200),
(4, 2, 250),
(5, 3, 300),
(6, 3, 350),
(7, 4, 400),
(8, 4, 450),
(9, 5, 500),
(10,5, 550),
(11,6, 600),
(12,6, 650)

--Rank the products based on their total revenue, assigning a rank to 
--each product category, and display the top 3 products within each category.
select * from prod202;
select * from sale202;

with prod_revenue_rank as (
select p.prod_id, p.prod_name, p.Prod_cat,
sum(s.revenue) as total_revenue, 
rank() over(partition by p.prod_cat order by sum(s.revenue) desc) as rev_rank
from prod202 p inner join sale202 s
on p.prod_id = s.prod_id
group by p.prod_id, p.prod_name, p.Prod_cat
)
select * from prod_revenue_rank where rev_rank <= 3;

--=========================

create table mva202 (sale_id int, prod_id int, revenue int, date date);
insert into mva202 (sale_id,prod_id,revenue, date) values  
(1, 1, 100, '2024-01-01'),
(2, 1, 150, '2024-01-02'),
(3, 2, 200, '2024-01-03'),
(4, 2, 250, '2024-01-04'),
(5, 3, 300, '2024-01-05'),
(6, 3, 350, '2024-01-06'),
(7, 4, 400, '2024-01-07'),
(8, 4, 450, '2024-01-08'),
(9, 5, 500, '2024-01-09'),
(10,5, 550, '2024-01-10'),
(11,6, 600, '2024-01-11'),
(12,6, 650, '2024-01-12')

--Calculate the 7-day moving average of daily sales revenue for each product, considering the past 7 days of sales data for each day.
select * from mva202;

select *, avg(revenue)
over(partition by prod_id order by date rows between 6 preceding and current row) as '7_day_moving_avg'
from mva202 order by prod_id , date;

--===================================================

create table tper202 (sale_id int, sales_repr varchar(25), region varchar(25), revenue int);
insert into tper202 (sale_id,sales_repr,region, revenue) values  
(1,  'John', 'North', 100),
(2,  'Sarah', 'South', 150),
(3,  'John', 'North', 200),
(4,  'Michael', 'East', 250),
(5,  'Sarah', 'South', 300),
(6,  'Emily', 'East', 350),
(7,  'Michael', 'East', 400),
(8,  'John', 'North', 450),
(9,  'Sarah', 'South', 500),
(10, 'Emily', 'East', 550),
(11, 'Michael', 'East', 600),
(12, 'John', 'North', 650)

--Identify the top-performing sales representatives by comparing their total sales revenue to the average revenue for all sales representatives, partitioning by region.

select sales_repr, region, revenue,
case when revenue > avg_revenue then 'Top Performer' else 'Regular Performer'
end as performer_status
from
(select sales_repr, region, revenue,
avg(revenue) over(partition by region) as avg_revenue
from tper202) as s1;

--============================================
create table trends202 (sale_id int, prod_cat varchar(25), sale_year int, revenue int);
insert into trends202 (sale_id, prod_cat, sale_year, revenue) values 
                                    (1, 'Electronics', 2020, 100),
                                    (2, 'Electronics', 2021, 150),
									(3, 'Clothing', 2020, 200),
									(4, 'Clothing', 2021, 250),
									(5, 'Electronics', 2020, 300),
									(6, 'Electronics', 2021, 350),
									(7, 'Clothing', 2020, 400),
									(8, 'Clothing', 2021, 450),
									(9, 'Electronics', 2020, 500),
									(10, 'Electronics', 2021, 550),
									(11, 'Clothing', 2020, 600),
									(12, 'Clothing', 2021, 650)
-- Calculate the year-over-year growth rate of sales revenue for each product category, 
--  comparing the current year’s revenue to the previous year’s revenue.

select prod_cat,sale_year, revenue,
(revenue - lag(revenue) over(partition by prod_cat order by sale_year)) / lag(revenue) over(partition by prod_cat order by sale_year) as growth_rate
from trends202
order by prod_cat, sale_year;

--======================================================================

create table cte202 (employee_id int, ename varchar(25), m_id int);
insert into cte202 (employee_id, ename, m_id) values 
            (1, 'John',  3), 
            (2, 'Jane',  3),
			(3, 'Adam',  Null),
			(4, 'Emily',  3),
			(5, 'Michael', 4),
			(6, 'Sarah', 4),
			(7, 'David',  3),
			(8, 'Laura', 4)
--Write a recursive CTE to generate a hierarchical report showing the organizational structure of employees,
--including their direct and indirect managers.
select * from cte202;

WITH RECURSIVE EmployeeHierarchy AS (
    SELECT employee_id, ename, m_id, 0 AS level
    FROM cte202
    WHERE m_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.ename, e.m_id, eh.level + 1
    FROM cte202 e
    INNER JOIN EmployeeHierarchy eh ON e.m_id = eh.m_id
)
SELECT 
    employee_id,
    ename,
    m_id,
    level
FROM 
    EmployeeHierarchy;

--================================

create table c202 (sales_repr varchar(25), region varchar(25), sales_amount int);
insert into c202 (sales_repr, region, sales_amount) values 
            ('John', 'North', 1000), 
            ('Bob', 'North', 1200),
			('Charlie', 'South',  800),
			('David', 'South',  900),
			('Emily', 'East', 1500),
			('Frank', 'East', 1800)
--Find the sales representatives who have achieved sales greater than the average sales of their respective regions, using a correlated subquery.

select sales_repr, region, sales_amount 
from c202 s1
where sales_amount > ( select avg(sales_amount) from c202 s2 where s1.region=s2.region) order by region, sales_amount desc;

--=========================================================

https://medium.com/@gunjansinghtandon/essential-sql-interview-questions-for-data-engineers-a3691c18f52e
