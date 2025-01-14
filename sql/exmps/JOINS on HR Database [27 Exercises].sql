

-- JOINS on HR Database [27 Exercises] 

--SQL query to find the first name, last name, department number, and department name for each employee.  

select e.first_name, e.last_name, e.department_id, d.department_name 
from employees e 
join departments d 
on e.department_id = d.department_id;

--2 query to find the first name, last name, department, city, and state province for each employee.

SELECT E.first_name,E.last_name, 
   D.department_name, L.city, L.state_province
     FROM employees E 
	 join departments D 
	 on E.department_id = D.department_id
	 join locations L 
	 on D.location_id = L.location_id; 

-- 3query to find the first name, last name, salary, and job grade for all employees.
create table job_grades(
grade_level char, lowest_sal int, highest_sal int)
insert into job_grades(grade_level, lowest_sal, highest_sal)
values('A',              1000,        2999),
		('B',              3000,        5999),
		('C',              6000,        9999),
		('D',             10000,       14999),
		('E',             15000,       24999),
		('F',             25000,       40000);

SELECT E.first_name, E.last_name, E.salary, J.grade_level
 FROM employees E 
   JOIN job_grades J 
   on E.salary between J.lowest_sal and J.highest_sal; 


 --4 SQL query to find all those employees who work in department ID 80 or 40. Return first name, last name, department number and department name.

select a.first_name, a.last_name, b.department_id, b.department_name 
from employees a 
join departments b 
on a.department_id = b.department_id 
and a.department_id in (80, 40)
order by a.last_name; 


--5 SQL query to find those employees whose first name contains a letter ‘z’. Return first name, last name, department, city, and state province.

select e.first_name, e.last_name, d.department_name, l.city, l.state_province 
from employees e 
join departments d 
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id 
where e.first_name like '%z%'; 


--6 SQL query to find all departments including those without any employee. Return first name, last name, department ID, department name. 

select e.first_name, e.last_name, d.department_id, d.department_name 
from employees e 
right outer join departments d 
on e.department_id = d.department_id;


--7 SQL query to find those employees who earn less than the employee of ID 182. Return first name, last name and salary. 

SELECT E.first_name, E.last_name, E.salary 
  FROM employees E 
  join employees S 
  on E.salary < S.salary 
  and S.employee_id = 182;

--8 SQL query to find the employees and their managers. Return the first name of the employee and manager. 

select e.first_name as 'Employee Name', m.first_name as 'Manager' 
from employees e 
join employees m 
on e.manager_id = m.employee_id; 

--9 SQL query to display the department name, city, and state province for each department.  

select d.department_name, l.city, l.state_province 
from departments d
join locations l 
on d.location_id = l.location_id;

--10 SQL query to find those employees who have or not any department. Return first name, last name, department ID, department name. 

SELECT E.first_name, E.last_name, E.department_id, D.department_name 
  FROM employees E 
  left outer join departments D
  on E.department_id = D.department_id ;
  

--11 SQL query to find the employees and their managers. These managers do not work under any manager. Return the first name of the employee and manager. 

select e.first_name, m.first_name 
from employees e 
left outer join employees m 
on e.manager_id = m.employee_id; 

--12 SQL query to find those employees who work in a department where the employee of last name 'Taylor' works. Return first name, last name and department ID.

SELECT E.first_name, E.last_name, E.department_id 
 FROM employees E 
   JOIN employees S
   on E.department_id = S.department_id
   and S.last_name = 'Taylor'; 

--13 SQL query to find those employees who joined between 1st January 1993 and 31 August 1997. Return job title, department name, employee name, and joining date of the job.

SELECT job_title, department_name, concat(first_name,' ',last_name) AS Employee_name, start_date 
	FROM job_history 
		JOIN jobs USING (job_id) 
			join departments using(department_id) 
		where start_date >= '1993-01-01' and start_date <= '1997-08-31'; 


--14 SQL query to find the difference between maximum salary of the job and salary of the employees. Return job title, employee name, and salary difference.

SELECT job_title, concat(first_name ,' ', last_name) AS Employee_name, 
	max_salary-salary AS salary_difference 
	FROM employees 
		NATURAL JOIN jobs;

--15 SQL query to compute the average salary, number of employees received commission in that department. Return department name, average salary and number of employees. 

SELECT department_name, AVG(salary), COUNT(commission_pct) 
	FROM departments 
	join employees using (department_id) 
group by department_name; 


