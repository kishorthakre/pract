

--   SQL Wildcard and Special operators [22 Exercises] 

--1 SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission.
select * from salesman 
where city = 'Paris' or city='rome';

--2 SQL query to find the details of those salespeople who come from any of the City 'Paris' or 'Rome'. Return salesman_id, name, city, commission. 
select * from salesman
where city in ('paris', 'rome');

--3 SQL query to find the details of those salespeople who live in cities apart from 'Paris' and 'Rome'. Return salesman_id, name, city, commission. 
select * from salesman 
where city not in ('paris', 'rome'); 

--4 SQL query to find the details of the customers whose ID belongs to any of the values 3007, 3008 and 3009. Return customer_id, cust_name, city, grade, and salesman_id. 
select * from customer  
where customer_id in (3007, 3008, 3009);

--5 SQL query to find the details of salespeople who get the commission in the range from 0.12 to 0.14 (begin and end values are included). Return salesman_id, name, city, and commission. 
select * from salesman  
where commission between 0.12 and 0.14;

--6 SQL query to select orders value within a range 500, 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. 
select * from orders 
where (purch_amt between 500 and 4000) and not purch_amt in (948.50, 1983.43);

--7 SQL query to find the details of those salespeople whose name starts with any letter within 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission. 
select * from salesman 
where name between 'a' and 'l'; 

--8 SQL query to find the details of all salespeople except whose name starts with any letter within 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.  
select * from salesman  
where name not between 'a' and 'l';

--9 SQL query to find the details of the customers whose name begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id. 
select * from customer
where cust_name like 'B%';

--10 SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.
select * from customer
where cust_name like '%n'; 

-- 11 SQL query to find the details of those salespeople whose name starts with ‘N’ and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission. 
select * from salesman 
where name like 'N__l%'; 

--12 SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1. 

create table testtable (col1 varchar(50)); 

insert into testtable(col1)
values('A001/DJ-402\44_/100/2015'),
	('001_\DJ-402\44_/100/2015'),
	('A001_DJ-402-2014-2015'),
	('A002_DJ-401-2014-2015'),
	('A001/DJ_401'),
	('A001/DJ_402\44'),
	('A001/DJ_402\44\2015'),
	('A001/DJ-402%45\2015/200'),
	('A001/DJ_402\45\2015%100'),
	('A001/DJ_402%45\2015/300'),
	('A001/DJ-402\44');
select * from testtable
where col1 like '%/_%' escape '/';

--13 SQL query to find those rows where col1 does not contain the escape character underscore ( _ ). Return col1. 
select * from testtable
where col1 not like '%/_%' escape '/'; 

--14 SQL query to find those rows where col1 contains the forward slash character ( / ). Return col1. 
select * from testtable 
where col1 like '%//%' escape '/' ; 

--15 SQL query to find those rows where col1 does not contains the forward slash character ( / ). Return col1. 
select * from testtable 
where col1 not like '%//%' escape '/' ; 

--16 SQL query to find those rows where col1 contains the string ( _/ ). Return col1.  
select * from testtable 
where col1 like '%/_//%' escape '/' ;

--17 SQL query to find those rows where col1 does not contains the string ( _/ ). Return col1.  
select * from testtable 
where col1 not like '%/_//%' escape '/';

--18 SQL query to find those rows where col1 contains the character percent ( % ). Return col1.  
select * from testtable 
where col1 like '%/%%' escape '/';

--19 SQL query to find those rows where col1 does not contains the character percent ( % ). Return col1.  
select * from testtable 
where col1 not like '%/%%' escape '/';


--20 SQL query to find all those customers who does not have any grade. Return customer_id, cust_name, city, grade, salesman_id.  
select * from customer 
where grade is null;

--21 SQL query to find all those customers whose grade value exists. Return customer_id, cust_name, city, grade, salesman_id.  
select * from customer 
where grade is not null;

--22 SQL query to find the employees whose last name begins with the character 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept.
select * from emp_details
where emp_lname like 'D%';

