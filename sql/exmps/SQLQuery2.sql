create table EmployeeInfo 
(EmpId int not null,
EmpFname varchar(50) not null,
EmpLname varchar(50) not null,
Department varchar(50) not null, 
Project varchar(50) not null, 
Address varchar(50) not null, 
DOB date, 
Gender varchar(50) not null);

insert into EmployeeInfo
(EmpId, EmpFname, EmpLname, Department, Project, Address, DOB, Gender)
values(1,'Sanjay', 'Mehra','HR','P1','Hyderabad(HYD)','01/12/1976','M'),
(2,'Ananya', 'Mishra','Admin','P2', 'Delhi(DEL)', '02/05/1968', 'F'),
(3,'Rohan','Diwan','Account','P3','Mumbai(BOM)','01/01/1980','M'),
(4,'Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','02/05/1992','F'),
(5,'Ankit','Kapoor','Admin','P2','Delhi(DEL)','03/07/1994','M');

select * from EmployeeInfo;















































--alter table EmployeeInfo
--DROP PRIMARY KEY;


create table EmployeePosition 
(EmpID int not null,
EmpPosition varchar(50) not null, 
DateOfJoining date, 
Salary int not null);


insert into EmployeePosition
(EmpID, EmpPosition, DateOfJoining, Salary)
values(1,'Manager','01/05/2022',500000),
(2,'Executive', '02/05/2022', 75000),
(3,'Manager','01/05/2022',90000),
(2,'Lead','02/05/2022',85000),
(1,'Executive','01/05/2022',300000);

select * from EmployeePosition

--drop table EmployeePosition;



--Q1. Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName. 

select * from EmployeeInfo
select upper(EmpFname) as EmpName from EmployeeInfo;

--Write a query to fetch the number of employees working in the department ‘HR’.
select count(*) from EmployeeInfo where Department = 'HR'; 

--  Write a query to get the current date.
select GETDATE(); 

--Q4. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
select substring(EmpLname, 1, 4) from EmployeeInfo;

--Q5. Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
SELECT SUBSTRING(Address, 1, CHARINDEX('(',Address)) FROM EmployeeInfo;

--Q6. Write a query to create a new table which consists of data and structure copied from the other table.
select * into NewTable from EmployeeInfo where  1=0; 

--Q7. Write q query to find all the employees whose salary is between 50000 to 100000 
select * from EmployeePosition Where Salary Between '50000' and '100000';

--Q8. Write a query to find the names of employees that begin with ‘S’ 
select * from EmployeeInfo where EmpFname Like 'S%';

select * from EmployeePosition

--Q9. Write a query to fetch top N records
select top 2 * from EmployeePosition order by Salary desc; 

--Q10. Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
select concat(EmpFname, ' ',EmpLname) as 'Fullname' from EmployeeInfo;

--Q11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender 
select count(*), Gender from EmployeeInfo where DOB between '02/05/1970 ' AND '31/12/1975' group by Gender; 

--Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order. 
select * from EmployeeInfo order by EmpFname desc, Department asc;

--Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
SELECT * FROM EmployeeInfo WHERE EmpLname LIKE '____a';

--Q14. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table. 
select * from EmployeeInfo where EmpFname not in ('Sanjay', 'Sonia');

--Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.
select * from EmployeeInfo where address like 'DELHI(DEL)%';

--Q16. Write a query to fetch all employees who also hold the managerial position. 
select * from EmployeeInfo
select * from EmployeePosition
SELECT E.EmpFname, E.EmpLname, P.EmpPosition 
FROM EmployeeInfo E INNER JOIN EmployeePosition P ON
E.EmpID = P.EmpID AND P.EmpPosition IN ('Manager');



--Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order. 
select * from EmployeeInfo
select Department, count(EmpID) as EmpDepCount 
from EmployeeInfo group by Department
order by EmpDepCount asc; 

--Q18. Write a query to calculate the even and odd records from a table. 
--SELECT EmpID FROM (SELECT rowno, EmpID from EmployeeInfo) WHERE MOD(rowno,2)=0;

--Q19. Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table. 
select * from EmployeeInfo
select * from EmployeePosition
select * from EmployeeInfo E 
where Exists 
(select * from EmployeePosition P where E.EmpId = P.EmpID);

--Q20. Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table. 
--select distinct Salary from EmployeePosition E1 
--where 2 >= (SELECTCOUNT(DISTINCT Salary ) from EmployeePosition E2 
--where E1.Salary >= E2.Salary) order by E1.Salary DESC;  

--Q21. Write a query to find the Nth highest salary from the table without using TOP/limit keyword.  
--select Salary from EmployeePosition E1 
--where N-1 = (Select count(Distinct (E2.Salary))
--			from EmployeePosition E2 
--			where E2.Salary > E1.Salary);

--Q22. Write a query to retrieve duplicate records from a table. 
--select * from EmployeeInfo 
--SELECT EmpID, EmpFname, Department COUNT(*) 
--FROM EmployeeInfo GROUP BY EmpID, EmpFname, Department 
--HAVING COUNT(*) > 1;



