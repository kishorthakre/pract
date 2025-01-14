create database test4
--( for comment cntr cntr c +k, for uncomment cntr cntr u +k) 

-- select database from menu or write use test1 
use test4

create table testtable
(
emp_id int, 
last_name varchar(50) not null, 
first_name varchar(50) not null,
);

alter table testtable add age int 

alter table testtable drop column age

alter table testtable alter column emp_id char(10) 

select * from testtable;

drop table testtable 

drop database test5;


create table emp
	( emp_id int primary key, 
	l_name varchar(50) not null, 
	f_name varchar(50) not null,);

create table emp1
( emp_id int, 
l_name varchar(50) not null, 
f_name varchar(50) not null, 
constraint emp_pk primary key (emp_id)
);

-- primary key for multiple columns 
create table emp2
(l_name varchar(50) not null, 
f_name varchar(50) not null, 
salary money
constraint emp_pk1 primary key (l_name, f_name )
); 


create table emp4
( emp_id int not null, 
l_name varchar(50) not null, 
f_name varchar(50) not null, 
);

alter table emp4
add constraint emp_primarykey primary key (emp_id);

select * from emp4;


