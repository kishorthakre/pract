
use newtest1;

--drop table employee;
create table employee(emp_id int, 
                      emp_name varchar(50),
					  dept_name varchar(50),
					  salary int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);

select * from employee;

select dept_name, max(salary) as max_salary from employee group by dept_name;

--window function
select e.*, max(salary) over(partition by dept_name) as max_salary from employee e; 


-- row_number, rank, dense_rank, lead and lag 

-- Fetch the first 2 employees from each department to join the company.

select * from (select e.*, row_number() over(partition by dept_name order by emp_id) as rnk from employee e) a where a.rnk <3; 

-- Fetch the top 3 employees in each department earning the max salary.

select * from (select e.*, rank() over(partition by dept_name order by salary desc) as rnk from employee e) a where a.rnk <4; 


-- Checking the different between rank, dense_rnk and row_number window functions:
select e.* ,
rank() over(partition by dept_name order by salary) as rnk, 
dense_rank() over(partition by dept_name order by salary) as dense_rnk,
row_number() over(partition by dept_name order by salary) as rn
from employee e;


-- lead and lag

-- fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee.

select e.*, 
lag(salary) over(partition by dept_name order by emp_id) as prev_emp_salary
from employee e;

select e.*, 
lag(salary) over(partition by dept_name order by emp_id) as prev_emp_salary,
lead(salary) over(partition by dept_name order by emp_id) as next_emp_salary
from employee e;

select e.*, 
lag(salary) over(partition by dept_name order by emp_id) as prev_emp_salary,
case when e.salary > lag(salary) over(partition by dept_name order by emp_id) then 'Higher than previous employee'
     when e.salary < lag(salary) over(partition by dept_name order by emp_id) then 'Lower than previous employee'
     when e.salary = lag(salary) over(partition by dept_name order by emp_id) then 'Same than previous employee'
	 end as sal_range
from employee e;







-- Example 2 

create table emp1(name varchar(25), age int, department varchar(25), salary int);
insert into emp1 (name, age, department, salary)
values ('Ramesh',20,'Finance',50000),
('Deep',25,'Sales',30000),
('Suresh',22,'Finance',50000),
('Ram',28,'Finance',20000),
('Pradeep',22,'Sales',20000)

-- Find average salary of employees for each department and order employees within a department by age.  

select e.*, avg(salary) over(partition by department) as aveg_salary from emp1 e; 

select e.*, avg(salary) over(partition by department order by age) as aveg_salary from emp1 e; 

select row_number() over(partition by department order by salary desc) as row_number, 
       e.*, 
	   rank() over(partition by department order by salary desc) as rnk, 
	   dense_rank() over(partition by department order by salary desc) as dense_rnk
from emp1 e; 


-- Different types of window functions 

--Aggregate window functions    They include SUM(), MAX(), COUNT(), and others.
--Value window functions        LAG(), LEAD(), FIRST_VALUE(), and others. 
--Ranking window functions      They include RANK(), DENSE_RANK(), ROW_NUMBER(), and others.

DROP TABLE IF EXISTS student_score;

CREATE TABLE student_score (
  student_id int PRIMARY KEY,
  student_name VARCHAR(30),
  dep_name VARCHAR(40),
  score INT);

INSERT INTO student_score VALUES (11, 'Ibrahim', 'Computer Science', 80);
INSERT INTO student_score VALUES (7, 'Taiwo', 'Microbiology', 76);
INSERT INTO student_score VALUES (9, 'Nurain', 'Biochemistry', 80);
INSERT INTO student_score VALUES (8, 'Joel', 'Computer Science', 90);
INSERT INTO student_score VALUES (10, 'Mustapha', 'Industrial Chemistry', 78);
INSERT INTO student_score VALUES (5, 'Muritadoh', 'Biochemistry', 85);
INSERT INTO student_score VALUES (2, 'Yusuf', 'Biochemistry', 70);
INSERT INTO student_score VALUES (3, 'Habeebah', 'Microbiology', 80);
INSERT INTO student_score VALUES (1, 'Tomiwa', 'Microbiology', 65);
INSERT INTO student_score VALUES (4, 'Gbadebo', 'Computer Science', 80);
INSERT INTO student_score VALUES (12, 'Tolu', 'Computer Science', 67);

select * from student_score;

-- compare the minimum score and maximum score from all the records in the table

select *, max(score) over() as maxscore, min(score) over() as minscore from student_score;

SELECT 
    *,
    MAX(score)OVER(PARTITION BY dep_name) AS dep_maximum_score,
    ROUND(AVG(score)OVER(PARTITION BY dep_name), 2) AS dep_average_score
FROM student_score;

select *, row_number() over(partition by dep_name order by score) as rn from student_score;

select *, rank() over(partition by dep_name order by score desc) as rnk from student_score;

select *, dense_rank() over(partition by dep_name order by score desc) as dense_rnk from student_score;


-- Lag, Lead

select *, lag(score) over(partition by dep_name order by score) as lg from student_score;

select *, lead(score) over(partition by dep_name order by score) as ld from student_score;




--When to Use a Window Function
--You've learned what window functions are in this tutorial. Some practical cases where you can use them are:

--When you want to compare an aggregate value in a window with individual records in that window.
--When you want to do things like ranking, percentile, cumulative sum or running total, moving average, and so on.

select *, 
sum(score) over(order by student_id rows between unbounded preceding and current row) as cummulative_sum 
from student_score;





--Example 3 

create table sales (year int, country varchar(25), product varchar(25), profit int);
insert into sales(year, country, product, profit)
values(2000 ,  'Finland' , 'Computer' , 1500), 
(2000 ,  'Finland' ,  'Phone'      , 100), 
(2001 ,  'Finland' ,  'Phone'      ,  10), 
(2000 ,  'India'   ,  'Calculator' ,  75), 
(2000 ,  'India'   ,  'Calculator' ,  75), 
(2000 ,  'India'   ,  'Computer'   ,1200), 
(2000 ,  'USA'     ,  'Calculator' ,  75), 
(2000 ,  'USA'     ,  'Computer'   ,1500), 
(2001 ,  'USA'     ,  'Calculator' ,  50), 
(2001 ,  'USA'     ,  'Computer'   ,1500), 
(2001 ,  'USA'     ,  'Computer'   ,1200), 
(2001 ,  'USA'     ,  'TV'         , 150), 
(2001 ,  'USA'     ,  'TV'         , 100)


select * from sales order by country, year, product; 

select country, sum(profit) as country_profit 
from sales group by country order by country; 

--  window operations do not collapse groups of query rows to a single output row. Instead, they produce a result for each row.

select year, country, product, profit, 
       sum(profit) over() as total_profit, 
	   sum(profit) over(partition by country) as country_profit
from sales order by country, year, profit;

SELECT year, country, product, profit,
         ROW_NUMBER() OVER(PARTITION BY country ORDER BY country) AS row_num1,
         ROW_NUMBER() OVER(PARTITION BY country ORDER BY year, product) AS row_num2
FROM sales;

