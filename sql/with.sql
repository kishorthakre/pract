use newtest1

-- WITH clause 

create table emp
( emp_ID int
, emp_NAME varchar(50)
, SALARY int);

insert into emp values(101, 'Mohan', 40000);
insert into emp values(102, 'James', 50000);
insert into emp values(103, 'Robin', 60000);
insert into emp values(104, 'Carol', 70000);
insert into emp values(105, 'Alice', 80000);
insert into emp values(106, 'Jimmy', 90000);

-- Fetch employees who earn more than avaerage salary of all employees 
with tb1 as (select * from emp)
select * from tb1;

with average (avg_sa) as
   (select cast(avg(salary) as int) from emp)
select * 
from emp e, average av where e.salary > av.avg_sa; 

-- or 
select * from emp where salary > (select avg(salary) from emp);


-- QUERY 2 :
DrOP table sales ;
create table sales
(
	store_id  		int,
	store_name  	varchar(50),
	product			varchar(50),
	quantity		int,
	cost			int
);
insert into sales values
(1, 'Apple Originals 1','iPhone 12 Pro', 1, 1000),
(1, 'Apple Originals 1','MacBook pro 13', 3, 2000),
(1, 'Apple Originals 1','AirPods Pro', 2, 280),
(2, 'Apple Originals 2','iPhone 12 Pro', 2, 1000),
(3, 'Apple Originals 3','iPhone 12 Pro', 1, 1000),
(3, 'Apple Originals 3','MacBook pro 13', 1, 2000),
(3, 'Apple Originals 3','MacBook Air', 4, 1100),
(3, 'Apple Originals 3','iPhone 12', 2, 1000),
(3, 'Apple Originals 3','AirPods Pro', 3, 280),
(4, 'Apple Originals 4','iPhone 12 Pro', 2, 1000),
(4, 'Apple Originals 4','MacBook pro 13', 1, 2500);

select * from sales;
-- Find stores who's sales where better than the average sales accross all stores 

-- 1) Total sales per each store -- Total_Sales 

select s.store_id, sum(cost) as total_sales_per_store 
from sales s group by s.store_id;

-- 2) Find the average sales with respect all the stores

select cast(avg(total_sales_per_store) as int) as avg_sale_for_all_store
from (select s.store_id, sum(cost) as total_sales_per_store 
from sales s group by s.store_id) a;

-- 3) Find the stores where Total_sales > avg_sales_per_store 

select * from (select s.store_id, sum(cost) as total_sales_per_store 
               from sales s group by s.store_id) total_sales 
join ( select cast(avg(total_sales_per_store) as int) as avg_sale_for_all_store
            from (select s.store_id, sum(cost) as total_sales_per_store 
            from sales s group by s.store_id) x) avg_sales 
     on total_sales.total_sales_per_store > avg_sales.avg_sale_for_all_store;

-- using with 

with Total_sales (store_id, total_sales_per_store) as 
   (select s.store_id, sum(cost) as total_sales_per_store
   from sales s group by s.store_id), 
   avg_sales (avg_sales_for_all_stores) as 
    (select cast(avg(total_sales_per_store) as int) as avg_sales_for_all_stores
	from Total_sales) 
select * from Total_sales ts 
join avg_sales av 
on ts.total_sales_per_store > av.avg_sales_for_all_stores;

