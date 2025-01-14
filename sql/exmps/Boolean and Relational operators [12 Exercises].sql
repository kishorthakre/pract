-- SQL Boolean and Relational operators [12 Exercises] 

use test3 

--1 SQL query to find the details of the customers who have a gradevalue above 100. Return customer_id, cust_name, city, grade, and salesman_id.  
select * from customer 
where grade >100; 

--2SQL query to find all the customers in �New York� city who have a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id. 
select * from customer
where city = 'New York' and grade >100;

--3 SQL query to find the customers who belong to either the city �New York� or have a grade above 100. Return customer_id, cust_name, city, grade, and salesman_id. 
select * from customer
where city = 'New York' or grade > 100;

--4 SQL query to find the customers who belong to either the city �New York� or not have a grade above 100. Return customer_id, cust_name, city, grade, and salesman_id. 
select * from customer
where city ='New York' or not grade > 100; 

--5 SQL query to find those customers who belong to neither the �New York� city nor their grade value exceeds 100. Return customer_id, cust_name, city, grade, and salesman_id
select * from customer  
where not(city='New York' or grade > 100);

--6 find details of all order excluding combination of ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
select * from orders 
where not((ord_date = '2012-09-10' and salesman_id >5005) or purch_amt >1000);

--7 SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12. Return salesman_id, name, city, and commission. 
select * from salesman 
where (commission > 0.10 and commission < 0.12);

--8  SQL query to find details of all order where purchase amount less than 200 or excluding combination of order date greater than or equal to '2012-02-10' and customer ID less than 3009. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
select * from orders
where (purch_amt < 200 or not (ord_date >= '2012-02-10' and customer_id < 3009));

--9  SQL query to find all orders subject to following conditions. Exclude combination of order date equal to '2012-08-17' or customer ID higher than 3005 and purchase amount less than 1000.
select * from orders 
where not((ord_date = '2012-08-17' or customer_id > 3005) and purch_amt <1000);

--10 SQL query to display order number, purchase amount, achieved, the unachieved percentage for those order which exceeds the 50% of the target value of 6000. 
select ord_no, purch_amt, (100*purch_amt) /6000 as 'Achieved %',
(100*(6000-purch_amt)/6000) as 'Unachieved %' from orders 
where (100*purch_amt)/6000>50; 

-- 11 SQL query to find the details of all employees whose last name is �Dosni� or �Mardy�. Return emp_idno, emp_fname, emp_lname, and emp_dept. 
select * from emp_details
where emp_lname = 'Dosni' or emp_lname = 'Mardy' ;

--12 SQL query to find the employees who works at depart 47 or 63. Return emp_idno, emp_fname, emp_lname, and emp_dept. 
select * from emp_details
where emp_dept = 47 or EMP_DEPT = 63; 

