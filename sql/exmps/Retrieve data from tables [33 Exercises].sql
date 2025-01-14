
--  SQL Retrieve data from tables [33 Exercises]


create database test3; 
use test3 wj

create table salesman(
salesman_id int primary key, name varchar(50) not null, 
city varchar(50) not null, commission float );

insert into salesman(salesman_id, name, city, commission ) 
values(5001,'James Hoog', 'New York' ,0.15),
    (5002,'Nail Knite', 'Paris' ,0.13),
    (5005,'Pit Alex', 'London', 0.11),
    (5006,'Mc Lyon' , 'Paris' ,0.14),
    (5007,'Paul Adam' , 'Rome', 0.13),
    (5003,'Lauson Hen' ,'San Jose', 0.12);

select * from salesman 


select 'This is SQL Exercise, Practice and Solution'; 

--3 Write a query to display three numbers in three columns.
select 5 as A, 10 as B, 15 as C;

--4 Write a query to display the sum of two numbers 10 and 15 from RDMS sever. 
select 10 + 15;

--6. Write a SQL statement to display specific columns like name and commission for all the salesmen. 
select name, commission from salesman; 



create table orders(
ord_no int primary key, purch_amt float not null, 
ord_date date not null, customer_id int, salesman_id int );

insert into orders(ord_no, purch_amt, ord_date, customer_id ,salesman_id) 
values (70001, 150.5, '2012-10-05',  3005,  5002),
		(70009,270.65, '2012-09-10',  3001, 5005),
		(70002,65.26, '2012-10-05',  3002, 5001),
		(70004,110.5, '2012-08-17',  3009, 5003),
		(70007, 948.5, '2012-09-10',  3005, 5002),
		(70005, 2400.6, '2012-07-27',  3007, 5001),
		(70008,5760, '2012-09-10',  3002, 5001),
		(70010,1983.43, '2012-10-10', 3004,5006),
		(70003, 2480.4, '2012-10-10',  3009, 5003),
		(70012, 250.45, '2012-06-27',  3008, 5002),
		(70011, 75.29, '2012-08-17',  3003, 5007),
		(70013, 3045.6, '2012-04-25',  3002, 5001);

select * from orders 

-- 8 write a SQL query to find the unique salespeople ID. Return salesman_id. 
select distinct salesman_id from orders; 

-- 9. write a SQL query to find the salespeople who lives in the City of 'Paris'. Return salesperson's name, city 
select name, city from salesman where city = 'Paris';


create table customer(
customer_id int primary key, cust_name varchar(50) not null, 
city varchar(50) not null, grade int, salesman_id int );

insert into customer(customer_id, cust_name, city, grade, salesman_id ) 
values( 3002 , 'Nick Rimando' ,'New York',100, 5001),
       ( 3007 , 'Brad Davis' ,'New York ',200 ,5001),
        (3005 , 'Graham Zusi' ,' California',200 , 5002),
        (3008 , 'Julian Green' ,'London ',300 , 5002),
        (3004 , 'Fabian Johnson',' Paris',300 ,5006),
        (3009 , 'Geoff Cameron',' Berlin ', 100 ,5003),
        (3003 , 'Jozy Altidor' ,'Moscow ',200 ,5007),
        (3001 , 'Brad Guzan' ,' London ', null , 5005);

select * from customer  
--drop table customer

--10. write a SQL query to find those customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id.  
select * from customer where grade = 200; 

--11. write a SQL query to find the orders, which are delivered by a salesperson of ID. 5001. Return ord_no, ord_date, purch_amt. 
select ord_no, ord_date, purch_amt from orders where salesman_id = 5001; 


create table nobel_win(
YEAR int, SUBJECT varchar(50) not null, 
WINNER varchar(50) not null, COUNTRY varchar(50), CATEGORY varchar(50) );

insert into nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY ) 
values( 1970,'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
	  (1970 ,'Physics', 'Louis Neel', 'France', 'Scientist'),
		(1970 ,'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
		(1970 ,'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
		(1970 ,'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
		(1970 ,'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
		(1970 ,'Economics', 'Paul Samuelson', 'USA', 'Economist'),
		(1970 ,'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
		(1971 ,'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
		(1971 ,'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
		(1971 ,'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
		(1971 ,'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
		(1971 ,'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
		(1978 ,'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
		(1978 ,'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
		(1987 ,'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
		(1987 ,'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
		(1987 ,'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
		(1994 ,'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
		(1994 ,'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
		(1987 ,'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
		(1987 ,'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
		(1987 ,'Economics', 'Robert Solow', 'USA', 'Economist'),
		(1994 ,'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist');

select * from nobel_win  
--delete from nobel_win; 

-- 12.write a SQL query to find the Nobel Prize winner(s) in the year 1970. Return year, subject and winner. 
select year, subject, winner from nobel_win where year=1970;

--13. From the following table, write a SQL query to find the Nobel Prize winner in 'Literature' in the year 1971. Return winner.
select winner from nobel_win 
where year = 1971 And subject = 'Literature';

--14. write a SQL query to find the Nobel Prize winner 'Dennis Gabor'. Return year, subject.  
select year, subject 
from nobel_win 
where winner = 'Dennis Gabor';

--15 find the Nobel Prize winners in 'Physics' since the year 1950. Return winner.  
select winner from nobel_win 
where year >= 1950 and subject='Physics'; 

--16 write a SQL query to find the Nobel Prize winners in 'Chemistry' between the years 1965 to 1975. Begin and end values are included.
--Return year, subject, winner, and country 
select year, subject, winner, country from nobel_win 
where subject = 'chemistry' and year >=1965 and year <=1975; 

--17 Write a SQL query to show all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin. 
select * from nobel_win 
where year >1972 and winner in ('Menachem Begin', 'Yitzhak Rabin'); 

--18 find the details of the winners whose first name matches with the string 'Louis'. Return year, subject, winner, country, and category. 
select * from nobel_win
where winner like 'Louis%'; 

--19 write a SQL query to combine the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category.  
select * from nobel_win 
where (subject='Physics' and year=1970) union 
(select * from nobel_win where(SUBJECT='Economics' and year=1971)); 

-- 20 find the Nobel Prize winners in 1970 excluding the subjects Physiology and Economics. Return year, subject, winner, country, and category. 
select * from nobel_win
where year = 1970 and SUBJECT not in ('Physiology', 'Economics'); 

--21 combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category. 
select * from nobel_win
where (SUBJECT='Physiology' and year <=1971) union 
(select * from nobel_win where(subject = 'Peace' and year >=1874));

--22 write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.  
select * from nobel_win
where WINNER = 'Johannes Georg Bednorz'; 

--23 find the Nobel Prize winners for the subject not started with the letter 'P'. Return year, subject, winner, country, and category. 
--Order the result by year, descending. 
select * from nobel_win
where WINNER not like 'P%' 
order by year desc, winner; 

--24 find the details of 1970 Nobel Prize winners. Order the result by subject, ascending except ‘Chemistry’ and ‘Economics’ which will come 
--at the end of result set. Return year, subject, winner, country, and category. 
select * from nobel_win 
where year = 1970 
order by 
	case 
		when subject in ('Economics', 'chemistry') then 1 
		else 0 
	end asc, SUBJECT, WINNER;  




create table item_mast(
PRO_ID int primary key, PRO_NAME varchar(50) not null, 
PRO_PRICE float not null, PRO_COM int,);

insert into item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM ) 
values( 101, 'Mother Board', 3200.00, 15),
    (102, 'Key Board', 450.00, 16),
    (103, 'ZIP drive', 250.00, 14),
    (104, 'Speaker', 550.00, 16),
    (105, 'Monitor', 5000.00, 11),
    (106, 'DVD drive', 900.00, 12),
    (107, 'CD drive', 800.00, 12),
    (108, 'Printer', 2600.00, 13),
    (109, 'Refill cartridge', 350.00, 13),
    (110, 'Mouse', 250.00, 12);

select * from item_mast  

--25 select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com. 
select * from item_mast 
where pro_price between 200 and 600; 

--26 write a SQL query to calculate the average price for manufacturer code equal to 16. Return avg. 
select avg(pro_price) from item_mast
where PRO_COM=16; 

--27 write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.'  
select pro_name as 'Item Name', pro_price as 'Price in Rs.' from item_mast;

--28 write a SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, 
--then product name in ascending. Return pro_name and pro_price
select pro_name, pro_price from item_mast 
where pro_price >= 250 
order by PRO_PRICE desc, pro_name; 

--29 write a SQL query to calculate average price of the items of each company. Return average price and company code. 
select avg(pro_price), PRO_COM from item_mast
group by PRO_COM;

-- 30  write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.  
select pro_name, pro_price from item_mast
where PRO_PRICE = (select min(pro_price) from item_mast); 



create table emp_details(
EMP_IDNO int, EMP_FNAME varchar(50) not null, 
EMP_LNAME varchar(50) not null, EMP_DEPT int,);

insert into emp_details(EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT ) 
values(127323,'Michale', 'Robbin', 57),
   (526689, 'Carlos', 'Snares', 63),
   (843795 , 'Enric', 'Dosio', 57),
   (328717 , 'Jhon', 'Snares', 63),
   (444527 , 'Joseph', 'Dosni', 47),
   (659831 , 'Zanifer', 'Emily', 47),
   (847674 , 'Kuleswar', 'Sitaraman', 57),
   (748681 , 'Henrey', 'Gabriel', 47),
   (555935 , 'Alex', 'Manuel', 57),
   (539569 , 'George', 'Mardy', 27),
   (733843 , 'Mario', 'Saule', 63),
   (631548 , 'Alan', 'Snappy', 27),
   (839139 , 'Maria', 'Foster', 57);

select * from emp_details
--31 write a SQL query to find unique last name of all employees. Return emp_lname.
select distinct emp_lname from emp_details;

--32  write a SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept. 
select * from emp_details 
where EMP_LNAME = 'Snares'; 

--33 SQL query to find the details of the employees who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept. 
select * from emp_details
where EMP_DEPT = 57;