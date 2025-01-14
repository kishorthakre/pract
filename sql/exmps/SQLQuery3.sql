create database test2  

SELECT name, database_id, create_date  
FROM sys.databases ;

--CREATE TABLE Worker (
--	WORKER_ID INT IDENTITY(001,1) PRIMARY KEY,
--	FIRST_NAME CHAR(25),
--	LAST_NAME CHAR(25),
--	SALARY INT,
--	JOINING_DATE DATETIME,
--	DEPARTMENT CHAR(25)); 
--drop table Worker

--exec sp_fkeys 'Worker' 

--BEGIN
--DECLARE @stmt VARCHAR(300);
 
---- Cursor to generate ALTER TABLE DROP CONSTRAINT statements  
--DECLARE cur CURSOR FOR
--    SELECT 'ALTER TABLE ' + OBJECT_SCHEMA_NAME(parent_object_id) + '.' + OBJECT_NAME(parent_object_id) +
--                ' DROP CONSTRAINT ' + name
--    FROM sys.foreign_keys 
--    WHERE OBJECT_SCHEMA_NAME(referenced_object_id) = 'dbo' AND 
--            OBJECT_NAME(referenced_object_id) = 'Worker';
 
--OPEN cur;
--FETCH cur INTO @stmt;
 
---- Drop each found foreign key constraint 
--WHILE @@FETCH_STATUS = 0
--    BEGIN
--    EXEC (@stmt);
--    FETCH cur INTO @stmt;
--    END
 
--CLOSE cur;
--DEALLOCATE cur;

--END
--GO

--drop table Worker




--insert into Worker 
--	(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
--	VALUES	('Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR');
		--('Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		--('Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		--('Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		--('Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		--('Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		--('Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		--('Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin')
		--;




CREATE TABLE Worker (
	WORKER_ID INT identity(1,1) PRIMARY KEY,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATE,
	DEPARTMENT CHAR(25)); 
drop table Worker
SELECT * from Worker; 

insert into Worker 
(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
	VALUES	('Monika', 'Arora', 100000, '14/02/20', 'HR'),
		('Niharika', 'Verma', 80000, '14/06/11', 'Admin'),
		('Vishal', 'Singhal', 300000, '14/02/20', 'HR'),
		('Amitabh', 'Singh', 500000, '14/02/20', 'Admin'),
		('Vivek', 'Bhati', 500000, '14/06/11', 'Admin'),
		('Vipul', 'Diwan', 200000, '14/06/11', 'Account'),
		('Satish', 'Kumar', 75000, '14/01/20', 'Account'),
		('Geetika', 'Chauhan', 90000, '14/04/11', 'Admin')
		;



CREATE table EmployeeDetails(
 EmpId int identity(121,100), 
 FullName char(25),
 ManagerId int,
 DateOfJoining date, 
 City char(25));

 insert into EmployeeDetails
 ( FullName, ManagerId,DateOfJoining, City)values('John Snow',321,'2014-01-31', 'Toronto'),
					('Walter White',986, '2015-01-30', 'California'),
					('Kuldeep Rana',876, '2016-11-27', 'New Delhi');

CREATE table EmployeeSalary(
 EmpId int identity(121,100), 
 Project char(25),
 Salary int,
 Variable int);

 insert into EmployeeSalary ( Project, Salary, Variable)
 values('P1',8000,500 ),
	   ('P2',10000,1000 ),
	   ('P1',12000, 0);

select * from EmployeeDetails
select * from EmployeeSalary

--Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under Manager with id – ‘986’.
select EmpId, FullName from EmployeeDetails
where ManagerId = 986; 

--Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table. 
select Distinct(Project) 
from EmployeeSalary;

--Ques.3. Write an SQL query to fetch the count of employees working in project ‘P1’. 
select count(*) from EmployeeSalary
where Project = 'P1'; 

--Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees. 
select max(Salary) as MaxSa, Min(Salary)as MinSa, AVG(Salary) from EmployeeSalary; 

--Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
select EmpId, Salary from EmployeeSalary 
where Salary between 9000 and 15000; 

--Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under manager with ManagerId – 321.
select EmpId, City, ManagerId from EmployeeDetails 
where City = 'Toronto' And ManagerId = '321'; 

select EmpId, ManagerId, City from EmployeeDetails 
where City = 'California' or ManagerId = '321'; 

--Ques.8. Write an SQL query to fetch all those employees who work on Project other than P1.
select EmpId from EmployeeSalary 
where NOT Project != 'P1';

select EmpId from EmployeeSalary
where Project <> 'P1'; 

-- Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value. 
select EmpId, Salary+Variable as TotalSalary from EmployeeSalary; 

select * from EmployeeDetails
select * from EmployeeSalary 

--Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ending with any sequence of characters. 
--where ‘_’ matches a single character and ‘%’ matches ‘0 or multiple characters’.
select FullName from EmployeeDetails 
where FullName like '__hn%';

--Ques.11. Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’. 
select EmpId from EmployeeDetails
union 
select EmpId from EmployeeSalary; 

--Ques.14. Write an SQL query to fetch the EmpIds that are present in both the tables –   ‘EmployeeDetails’ and ‘EmployeeSalary.
select EmpId from EmployeeDetails
where EmpId in (select EmpId from EmployeeSalary);


--Ques.15. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.
select EmpId from EmployeeDetails 
where EmpId Not in (select EmpId from EmployeeSalary);

--Ques.16. Write an SQL query to fetch the employee full names and replace the space with ‘-’. 
select replace(FullName, ' ', '-') 
from EmployeeDetails;

--Ques.17. Write an SQL query to fetch the position of a given character(s) in a field. 
select INSTR(FullName, 'Snow')
from EmployeeDetails;

--Ques.18. Write an SQL query to display both the EmpId and ManagerId together.
select concat(EmpId, ManagerId) as NewId 
from EmployeeDetails;

--Ques.19. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.
select substring(FullName, 1, charindex(' ', FullName))
from EmployeeDetails; 

--Ques.20. Write an SQL query to upper case the name of the employee and lower case the city values.
select upper(FullName), lower(City)
from EmployeeDetails;

select * from EmployeeDetails
select * from EmployeeSalary 

--Ques.21. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.
select FullName, 
LENGTH(FullName) - LENGTH(replcae(FullName, 'n',''))
from EmployeeDetails; 

--Ques.22. Write an SQL query to update the employee names by removing leading and trailing spaces.
update EmployeeDetails 
set FullName = LTRIM(rtrim(FullName));

--Ques.23. Fetch all the employees who are not working on any project.
select EmpId from EmployeeSalary 
where Project IS NULL; 

--Ques.24. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000. 
select FullName from EmployeeDetails
where EmpId IN (select EmpId from EmployeeSalary
where Salary between 5000 and 10000);

--Ques.25. Write an SQL query to find the current date-time.
select getdate(); 

--Ques.26. Write an SQL query to fetch all the Employees details from EmployeeDetails table who joined in the Year 2020.
select * from EmployeeDetails 
where DateOfJoining between '2020/01/01' and '2020/12/31'; 

SELECT * FROM EmployeeDetails 
WHERE YEAR(DateOfJoining) = '2016';

--Ques.27. Write an SQL query to fetch all employee records from EmployeeDetails table who have a salary record in EmployeeSalary table. 
select * from EmployeeDetails E 
where exists (select * from EmployeeSalary S where E.EmpId = S.EmpId); 

--Ques.28. Write an SQL query to fetch project-wise count of employees sorted by project’s count in descending order.
select Project, count(EmpId) EmpProjectCount from EmployeeSalary 
group by Project order by EmpProjectCount DESC;

--Ques.29. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.
select E.FullName, S.Salary from EmployeeDetails E 
left JOIN EmployeeSalary S ON E.EmpId = S.EmpId; 


