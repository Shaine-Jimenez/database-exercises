use employees;
show tables;

describe employees;

-- OUTER JOIN = everyting. 
-- To use OUTER JOIN use the 'UNION' 

describe dept_emp; 

show create table dept_emp; 

select *
from employees; 

select *
from dept_emp; 

select * 
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no; 
-- additionally -- 
select employees.first_name,
		employees.last_name, 
		departments.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no; 
-- OR -- 
select *
from employees
join dept_emp using(emp_no); 


show databases; 
use join_example_db; 
select database();
show tables;

select *
from users;

select *
from roles; 
-- JOIN/INNER JOIN -- 
SELECT users.name as user_name, roles.name as role_name
FROM users 
JOIN roles ON users.role_id = roles.id;

-- LEFT JOIN -- 
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

-- RIGHT JOIN -- 
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
-- Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
-- Hint: You will also need to use group by in the query.

SELECT *
FROM users; 

SELECT *
from roles; 

select *
from users
JOIN roles; 

SELECT users.name AS user_name, roles.name AS role_name, count(*)
FROM users
JOIN roles ON users.role_id = roles.id
GROUP BY user_name; 


show databases; 
use employees;
select database();
show tables; 

-- write a query that shows each department along with the name of the current manager for that department.
select *
from departments;
select *
from dept_manager; 
select *
from employees; 

select dept_name, concat(first_name, ' ', last_name) as full_name
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
where to_date = '9999-01-01'
order by dept_name; 


-- Find the name of all departments currently managed by women.
select dept_name, concat(first_name, ' ', last_name) as full_name
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
where to_date = '9999-01-01'
	and gender = 'f'
order by dept_name; 

-- 4. Find the current titles of employees currently working in the Customer Service department.
select title, count(*)
from titles
join dept_emp on titles.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'customer service'
	and dept_emp.to_date > now()
	and titles.to_date > now()
group by title
order by title asc;

-- 5. Find the current salary of all current managers.
select dept_name, concat(first_name, '  ', last_name) as full_name, salary
from salaries
join employees on salaries.emp_no = employees.emp_no
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
where dept_manager.to_date > now()
	and salaries.to_date > now()
ORDER by dept_name asc; 


-- 6. Find the number of current employees in each department.
select d.dept_no,
		d.dept_name,
        count(de.emp_no) as num_employees
from dept_emp as de
join departments as d using(dept_no)
where de.to_date > now()
group by dept_no, dept_name;  

-- 7. Which department has the highest average salary? Hint: Use current not historic information.
select d.dept_name, 
	round(avg(s.salary), 2) as average_salary
from dept_emp as de
join salaries as s on de.emp_no = s.emp_no
	and de.to_date > now()
    and s.to_date > now() 
join departments as d using(dept_no)
group by d.dept_name
order by average_salary desc
limit 1;

-- 8. Who is the highest paid employee in the Marketing department?
select e.first_name, 
		e.last_name, 
        s.salary, 
        dept_name
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
	and de.to_date > now()
join salaries as s on e.emp_no = s.emp_no
	and s.to_date > now()
join departments as d on de.dept_no = d.dept_no
	and d.dept_name = 'marketing'
order by s.salary desc
limit 1; 

-- 9. Which current department manager has the highest salary?
select e.first_name,
		e.last_name,
        s.salary,
        d.dept_name
from employees as e
join dept_manager as dm on e.emp_no = dm.emp_no
	and dm.to_date > now()
join salaries as s on e.emp_no = s.emp_no
	and s.to_date > now()
join departments as d using(dept_no)
order by s.salary desc
limit 1; 

-- 10. Determine the average salary for each department. Use all salary information and round your results.

select d.dept_name,
		roud(avg(s.salary), 2) as avg_dept_salary
from departments as d
join dept_emp as de using(dept_no)
join salaries as s using(emp_no)
group by d.dept_name
order by avg_dept_salary desc; 































