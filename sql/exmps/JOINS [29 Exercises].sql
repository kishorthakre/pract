

--JOINS [29 Exercises]

--1 find the salesperson and customer who belongs to same city. Return Salesman, cust_name and city.
SELECT salesman.name AS "Salesman",
customer.cust_name, customer.city 
FROM salesman,customer 
WHERE salesman.city=customer.city;

--2 find those orders where order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.  
select ord_no, purch_amt, cust_name, city 
from orders, customer 
where orders.customer_id = customer.customer_id 
and orders.purch_amt between 500 and 2000; 

--or

select a.ord_no, a.purch_amt, b.cust_name, b.city 
from orders a, customer b 
where a.customer_id = b.customer_id
and a.purch_amt between 500 and 2000; 

--3 find the salesperson(s) and the customer(s) he handle. Return Customer Name, city, Salesman, commission. 
SELECT a.cust_name AS "Customer Name", 
a.city, b.name AS "Salesman", b.commission 
FROM customer a 
inner join salesman b 
on a.salesman_id = b.salesman_id 

--4 find those salespersons who received a commission from the company more than 12%. Return Customer Name, customer city, Salesman, commission. 

select a.cust_name, a.city, b.name, b.commission 
from customer a
inner join salesman b 
on a.salesman_id = b.salesman_id 
where b.commission > .12;

--5 find those salespersons do not live in the same city where their customers live and received a commission
--from the company more than 12%. Return Customer Name, customer city, Salesman, salesman city, commission. 

select a.cust_name, a.city, b.name, b.commission 
from customer a
inner join salesman b 
on a.salesman_id = b.salesman_id
where a.city <> b.city
and b.commission >.12; 

--6 find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. 

SELECT a.ord_no,a.ord_date,a.purch_amt,
b.cust_name AS "Customer Name", b.grade, 
c.name AS "Salesman", c.commission 
FROM orders a 
INNER JOIN customer b 
on a.customer_id = b.customer_id
inner join salesman c
on a.salesman_id = c.salesman_id 


--7  join on the tables salesman, customer and orders in such a form that the same column of each table will appear once and only the relational rows will come

SELECT * 
FROM orders 
NATURAL JOIN customer  
NATURAL JOIN salesman;

--8 query to display the cust_name, customer city, grade, Salesman, salesman city. The result should be ordered by ascending on customer_id. 

select a.cust_name, a.city, a.grade, b.name as 'Salesman', b.city 
from customer a 
left join salesman b 
on a.salesman_id = b.salesman_id 
order by a.customer_id;

--9 query to find those customers whose grade less than 300. Return cust_name, customer city, 
--grade, Salesman, saleman city. The result should be ordered by ascending customer_id. 

select a.cust_name, a.city, a.grade, b.name, b.city 
from customer a 
left outer join salesman b 
on a.salesman_id = b.salesman_id 
where a.grade < 300 
order by a.customer_id ; 

--10  SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the 
--order date to find that either any of the existing customers have placed no order or placed one or more orders

SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount" 
FROM customer a 
left outer join orders b
on a.customer_id = b.customer_id
order by b.ord_date; 

--11 SQL statement to make a report with customer name, city, order number, order date, order amount salesman name and commission
--to find that either any of the existing customers have placed no order or placed one or more orders by their salesman or by own.

SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount", 
c.name,c.commission 
FROM customer a  
left outer join orders b 
on a.customer_id = b.customer_id
left outer join salesman c
on c.salesman_id=b.salesman_id;

--12 statement to make a list in ascending order for the salesmen who works either for one or more customer or not yet join under any of the customers.  

SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman", b.city 
FROM customer a  
right outer join salesman b
on b.salesman_id = a.salesman_id
order by b.salesman_id; 

--13  write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. 

SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman", 
c.ord_no, c.ord_date, c.purch_amt 
FROM customer a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id 
RIGHT OUTER JOIN orders c 
ON c.customer_id=a.customer_id;


--14 statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. 
--The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.

select a.cust_name, a.city, a.grade,
b.name as 'Salesman',
c.ord_no, c.ord_date, c.purch_amt 
from customer a 
right outer join salesman b 
on b.salesman_id = a.salesman_id
left outer join orders c
on c.customer_id = a.customer_id
where c.purch_amt>= 2000 
and a.grade is not null; 

--15 make a report with customer name, city, order no. order date, purchase amount for those customers from the 
--existing list who placed one or more orders or which order(s) have been placed by the customer who is not on the list.

SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount"  
from customer a 
full outer join orders b 
on a.customer_id = b.customer_id ;

--16  make a report with customer name, city, order no. order date, purchase amount for only those customers on 
--the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who is neither in the list nor have a grade.

SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount" 
FROM customer a  
full outer join orders b
on a.customer_id = b.customer_id
where a.grade is not null;

-- 17 query to combine each row of salesman table with each row of customer table. 

select * from salesman a
cross join customer b;

--18 make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for that salesman who belongs to a city.  

select * from salesman a 
cross join customer b
where a.city is not null; 

--19  statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer
--and vice versa for those salesmen who belongs to a city and the customers who must have a grade.

SELECT * 
FROM salesman a 
cross join customer b 
where a.city is not null 
and b.grade is not null; 

--20  statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and 
--vice versa for those salesmen who must belong a city which is not the same as his customer and the customers should have an own grade.

select * from salesman a 
cross join customer b 
where a.city is not null 
and b.grade is not null 
and a.city <>b.city;

--21 query to select all rows from both participating tables as long as there is a match between pro_com and com_id. 
create table company_mast(
com_id int, com_name varchar(20));
insert into company_mast(com_id, com_name)
values ( 11, 'Samsung'), (12, 'iBall'),(13, 'Epsion'),
       (14, 'Zebronics'),(15, 'Asus'),(16, 'Frontech');
select * from company_mast; 

select * from item_mast
inner join company_mast 
on item_mast.PRO_COM = company_mast.com_id ;


--22 query to display the item name, price, and company name of all the products. 

SELECT item_mast.pro_name, pro_price, company_mast.com_name
   FROM item_mast 
     INNER JOIN company_mast
        ON item_mast.pro_com = company_mast.com_id; 

--23 calculate the average price of items of each company. Return average value and company name. 

select avg(pro_price), company_mast.com_name 
from item_mast 
inner join company_mast 
on item_mast.PRO_COM = company_mast.com_id 
group by company_mast.com_name; 

--24 query to calculate and find the average price of items of each company higher than or equal to Rs. 350. Return average value and company name. 
select avg(pro_price), company_mast.com_name
from item_mast
inner join company_mast 
on item_mast.PRO_COM = company_mast.com_id
group by company_mast.com_name 
having avg(pro_price) >= 350; 


--25 SQL query to find the most expensive product of each company. Return pro_name, pro_price and com_name.

SELECT A.pro_name, A.pro_price, F.com_name
   FROM item_mast A INNER JOIN company_mast F
   ON A.pro_com = F.com_id
     AND A.pro_price =
     (SELECT MAX(A.pro_price)
         FROM item_mast A
         WHERE A.pro_com = F.com_id);

--26 query to display all the data of employees including their department. 
SELECT emp_idno, A.emp_fname AS "First Name", emp_lname AS "Last Name",
    B.dpt_name AS "Department", emp_dept, dpt_code,  dpt_allotment
     FROM emp_details A 
	 inner join emp_department B 
	 on A.EMP_DEPT = B.dpt_code; 

--27 SQL to display the first name and last name of each employee, along with the name and sanction amount for their department.

SELECT emp_details.emp_fname AS "First Name", emp_lname AS "Last Name", 
emp_department.dpt_name AS "Department", 
dpt_allotment AS "Amount Allotted"
FROM emp_details 
inner join emp_department
on emp_details.EMP_DEPT = emp_department.dpt_code;

--28query to find the departments with a budget more than Rs. 50000 and display the first name and last name of employees.

SELECT emp_details.emp_fname AS "First Name", emp_lname AS "Last Name"
  FROM emp_details 
    INNER JOIN emp_department 
	on emp_details.EMP_DEPT = emp_department.dpt_code
	and emp_department.dpt_allotment > 5000;

--29 SQL query to find the names of departments where more than two employees are working. Return dpt_name. 

SELECT emp_department.dpt_name
  FROM emp_details 
     INNER JOIN emp_department
	 on EMP_DEPT =dpt_code
	 group by emp_department.dpt_name
	 having count(*) > 2;


