

use newtest1
/*
𝐒𝐐𝐋 𝐐𝐮𝐞𝐬𝐭𝐢𝐨𝐧𝐬:

1, How would you differentiate between a Primary Key, a Natural Key, and a Surrogate Key in a database schema?
2, Given two tables, how would you find the count of records using INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN?
3, Write a SQL query to delete the 10th highest salary from the employee table?
4, How would you find the top 3 highest-paid employees in an organization?
5, How can you optimize an SQL query?
7, Write a SQL query to calculate the average salary of employees in each department?
8, Explain how you would handle NULL values in JOIN operations in SQL?
*/

--6, Write a SQL query to retrieve unique records without using DISTINCT or GROUP BY?
select distinct name, employee_id from p25 order by employee_id;
select name, employee_id from p25 group by name, employee_id order by employee_id ;
select * from (select *, row_number() over(partition by name order by employee_id) a1 from p25) a2 where employee_id=1 ;


-- 1741. Find Total Time Spent by Each Employee

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


--==============================



select salary as SecondHighestSalary from (select salary, rank() over(order by salary desc) as s1 from Employee) as s2 where s1 = 2; 
/* Write your T-SQL query statement below */
select max(salary) as SecondHighestSalary from Employee where salary< (select max(salary) from employee);

--Delete Duplicate Emails
delete from person where id not in (select min(ID) from person group by email);

--Write a solution to report all the duplicate emails. 
select distinct(email) from person where id not in (select max(id) from Person group by email) ;


--Write a solution to find all customers who never order anything.
select Name as Customers from Customers
where Id not in (select CustomerId from Orders);

--Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.
select employee.name, Bonus.bonus from employee left join bonus on bonus.empID = employee.empID where bonus <1000 or bonus is null;

--Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
select product.product_name , year, price from Sales inner join product on Sales.product_id = Product.product_id;

--A country is big if:
--	it has an area of at least three million (i.e., 3000000 km2), or
--	it has a population of at least twenty-five million (i.e., 25000000).
--Write a solution to find the name, population, and area of the big countries. 

select name, population, area from world where area >= 3000000 or population >= 25000000;

--1070 Write a solution to select the product id, year, quantity, and price for the first year of every product sold.

select product_id,first_year,quantity,price from
(select product_id,year as first_year,quantity,price,
rank() over (partition by product_id order by year) as rn from Sales) a
where rn = 1;


Select s1.product_id,s1.year as first_year,s1.quantity,s1.price
from Sales s1 inner join (select product_id,Min(year) as year
from Sales
group by product_id) s on s1.product_id=s.product_id and s1.year=s.year



-- 1757. Recyclable and Low Fat Products
-- Write a solution to find the ids of products that are both low fat and recyclable. 
select product_id from products where low_fats='Y' and low_fats = recyclable ;
select product_id from (select * from products where low_fats='Y') a where low_fats = recyclable;
(98.96) select product_id from (select * from products where low_fats = recyclable) a where low_fats='Y';


--584. Find Customer Referee
select name from customer where referee_id != 2 or referee_id is null;


select  distinct(author_id) as id from (select * from Views where author_id=viewer_id) a ;



--1581. Customer Who Visited but Did Not Make Any Transactions
select customer_id, count(customer_id) as count_no_trans from visits 
where visit_id not in(select visit_id from transactions ) group by customer_id order by count(customer_id);


--570. Managers with at Least 5 Direct Reports 
select name from employee where id in (select managerId from employee group by managerId having count(managerId) >= 5) ;

--620. Not Boring Movies
select * from cinema where (id %2) != 0  and description not like '%boring%' order by rating desc;

--596
select class from courses group by class having count(student) >= 5;

-- 2356 
select teacher_id, count(distinct(subject_id)) as cnt from Teacher group by teacher_id; 

--1280 
SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

--619 
select max(num) as num
from
(select num from mynumbers group by num having count(*) = 1 ) a

--1667
select user_id, concat(upper(substring(name, 1,1)), lower(substring(name,2,50))) as name
from users
order by user_id

--1527 
select *
from Patients
where conditions like '% DIAB1%' or conditions like 'DIAB1%';

--196
DELETE FROM Person
    WHERE ID NOT IN
    ( SELECT MIN(ID) FROM Person GROUP BY email );


--7131
SELECT M.Employee_id, M.name, COUNT(R.age) AS reports_count, ROUND(SUM(R.age)/CAST(COUNT(R.age) as float),0) AS average_age
FROM Employees AS M
INNER JOIN Employees AS R
ON M.employee_id = R.reports_to
GROUP BY M.Employee_id, M.name
Order by M.employee_id


--1729
select user_id, count(follower_id) as followers_count from followers group by user_id;



-- H 

SELECT CAST(MIN(LAT_N) AS DEC(20,4))
FROM STATION WHERE LAT_N > 38.7780

SELECT CITY.NAME FROM CITY INNER JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE WHERE COUNTRY.CONTINENT = 'Africa';


SELECT MAX(SALARY * MONTHS), COUNT(EMPLOYEE_ID) FROM EMPLOYEE WHERE(SALARY * MONTHS)= (SELECT MAX(SALARY * MONTHS) FROM EMPLOYEE) ;

select CAST(sum(lat_n) as decimal(18,2)), CAST(sum(long_w) as decimal(18,2)) from station;

