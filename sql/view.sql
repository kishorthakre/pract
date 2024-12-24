
--VIEW
--  https://www.youtube.com/watch?v=cLSxasHg9WY&list=PLavw5C92dz9Ef4E-1Zi9KfCTXS_IN8gXZ&index=12 
--View is a Database object 
--View is created over an SQL Query 
--View does not store any data  but it will store structure of the query 
--View is like a virtual table 

use newtest1;

drop table if exists tb_customer_data ;
drop table if exists tb_product_info ;
drop table if exists tb_order_details ;
drop view if exists order_summary;

--CREATE TABLE IF NOT EXISTS tb_customer_data

CREATE TABLE tb_customer_data (
    cust_id         varchar(10) primary key,
    cust_name       varchar(50) not null,
    phone           bigint,
    email           varchar(50),
    address         varchar(250));

create table tb_product_info (
    prod_id         varchar(10) primary key,
    prod_name       varchar(50) not null,
    brand           varchar(50) not null,
    price           int
);

create table  tb_order_details(
    ord_id          bigint primary key,
    prod_id         varchar(10) references tb_product_info(prod_id),
    quantity        int,
    cust_id         varchar(10) references tb_customer_data(cust_id),
    disc_percent    int,
    date            date
);

insert into tb_customer_data values
('C1', 'Mohan Kumar', 9900807090, 'mohan@demo.com', 'Bangalore'),
('C2', 'James Xavier', 8800905544, 'james@demo.com', 'Mumbai'),
('C3', 'Priyanka Verma', 9900223333, 'priyanka@demo.com', 'Chennai'),
('C4', 'Eshal Maryam', 9900822111, 'eshal@demo.com', 'Delhi');

insert into tb_product_info values
('P1', 'Samsung S22', 'Samsung', 800),
('P2', 'Google Pixel 6 Pro', 'Google', 900),
('P3', 'Sony Bravia TV', 'Sony', 600),
('P4', 'Dell XPS 17', 'Dell', 2000),
('P5', 'iPhone 13', 'Apple', 800),
('P6', 'Macbook Pro 16', 'Apple', 5000);

insert into tb_order_details values
(1, 'P1', 2, 'C1', 10, '01-01-2020'),
(2, 'P2', 1, 'C2', 0, '01-01-2020'),
(3, 'P2', 3, 'C3', 20, '02-01-2020'),
(4, 'P3', 1, 'C1', 0, '02-01-2020'),
(5, 'P3', 1, 'C1', 0, '03-01-2020'),
(6, 'P3', 4, 'C1', 25, '04-01-2020'),
(7, 'P3', 1, 'C1', 0, '05-01-2020'),
(8, 'P5', 1, 'C2', 0, '02-01-2020'),
(9, 'P5', 1, 'C3', 0, '03-01-2020'),
(10, 'P6', 1, 'C2', 0, '05-01-2020'),
(11, 'P6', 1, 'C3', 0, '06-01-2020'),
(12, 'P6', 5, 'C1', 30, '07-01-2020');

create view order_summary as 
select o.ord_id, o.date, p.prod_name, c.cust_name, 
(p.price * o.quantity) - ((p.price * o.quantity) * disc_percent/100) as cost 
from tb_customer_data c 
join tb_order_details o on o.cust_id = c.cust_id 
join tb_product_info p on p.prod_id = o.prod_id; 

select * from order_summary;

-- what is the main purpose of using a view / advantages of views. 
--1) Security 
--   By hiding the query used to generate the VIEW
--2) To simplfy complex sql queris. 
--      Sharing a view is better than sharing complex query 
--      Avoid re-writing same complex query multiple times 

-- create role james login password 'james';
-- grant select on order_summary to james;

create view order_summary 
as 
select o.ord_id, o.date, p.prod_name, c.cust_name, 
(p.price * o.quantity) - ((p.price * o.quantity) * disc_percent/100) as cost 
from tb_customer_data c 
join tb_order_details o on o.cust_id = c.cust_id 
join tb_product_info p on p.prod_id = o.prod_id; 

-- Using create or replace we can modify view 
-- replace wont work in sql use alter 

create or alter view order_summary 
as 
select o.ord_id, o.date, p.prod_name, c.cust_name, 
(p.price * o.quantity) - ((p.price * o.quantity) * disc_percent/100) as cost 
from tb_customer_data c 
join tb_order_details o on o.cust_id = c.cust_id 
join tb_product_info p on p.prod_id = o.prod_id; 



--Rules when using create or replace 
--  - Cannot change column name of the existing view 
--  - We cannot chage the datatype 
--  - Cannot change order of columns in between (but we can add column at end) 

select * from order_summary;

-- rename column of the view
alter view order_summary rename column date to order_date; 
alter view order_summary rename to order_summary_2;

drop view order_summary;


create view expensive_products 
as 
select * from tb_product_info where price > 1000;

select * from expensive_products; 

alter table tb_product_info add column prod_config varchar(100);

select * from tb_product_info; 
select * from expensive_products; 

-- To see new table structure rerun view (but new data  will show) 
create or alter view expensive_products 
as 
select * from tb_product_info where price > 1000;
select * from expensive_products; 


-- Updatable views 
--  1) views should be created using 1 table/view only 
--  2) view query cannot have distinct clause
--  3) view query cannot have group by clause
--  4) view query cannot have with clause
--  5) view query cannot have window by clause
