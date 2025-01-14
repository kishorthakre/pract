

--Quering on Multiple Tables [8 Exercises] 

--1 find the salespersons and customers who live in same city. Return customer name, salesperson name and salesperson city. 

select customer.cust_name, salesman.name, salesman.city 
from salesman, customer 
where salesman.city = customer.city; 

--2 find all the customers along with the salesperson who works for them. Return customer name, and salesperson name. 

select customer.cust_name, salesman.name 
from salesman, customer
where salesman.salesman_id = customer.salesman_id;

--3 find those sales people who generated orders for their customers but not located in the same city. Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table). 

select orders.ord_no, customer.cust_name, customer.customer_id, salesman.salesman_id
from orders, customer, salesman
where customer.city <> salesman.city 
and orders.customer_id = customer.customer_id
and orders.salesman_id = salesman.salesman_id; 

--4 find those orders made by customers. Return order number, customer name.  

select orders.ord_no, customer.cust_name
from orders, customer
where orders.customer_id = customer.customer_id;

--5 find those customers where each customer has a grade and served by at least a salesperson who belongs to a city. Return cust_name as "Customer", grade as "Grade" and order_no as "Order No.".   

select customer.cust_name as 'Customer', customer.grade as 'Grade', orders.ord_no as 'Order No'
from customer, orders, salesman
where orders.customer_id = customer.customer_id
and orders.salesman_id = salesman.salesman_id 
and salesman.city is not null 
and customer.grade is not null;  

--6 find those customers who served by a salesperson and the salesperson works at the commission in the range 12% to 14% (Begin and end values are included.). Return cust_name AS "Customer", city AS "City".  

select customer.cust_name as 'Customer', customer.city as 'City', salesman.name as 'Salesman'
from salesman, customer
where salesman.salesman_id = customer.salesman_id 
and salesman.commission between .12 and .14;

--7 find those orders executed by the salesperson, ordered by the customer whose grade is greater than or equal to 200. Compute purch_amt*commission as "Commission". Return customer name, commission as "Commission%" and Commission.  
select ord_no, cust_name, commission as 'Commission%', purch_amt*commission as 'Commission'
from customer, salesman, orders
where orders.salesman_id = salesman.salesman_id
and orders.customer_id = customer.customer_id 
and customer.grade >= 200 ; 

--8 find those customers who made orders on October 5, 2012. Return customer_id, cust_name, city, grade, salesman_id, ord_no, purch_amt, ord_date, customer_id and salesman_id. 

select * 
from customer a, orders b
where a.customer_id = b.customer_id 
and b.ord_date = '2012-10-05';
