show databases;
use employees;
show tables;


-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? 
-- Answer that in a comment in your SQL file.
select DISTINCT title
from titles; 
-- 7 

-- Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
select DISTINCT last_name
from employees
where last_name like 'e%e'
GROUP BY last_name; 

-- Write a query to to find all unique combinations of first and last names 
-- of all employees whose last names start and end with 'E'.

select DISTINCT first_name, last_name
from employees
where last_name like 'e%e'
GROUP BY first_name, last_name
;
 
-- Write a query to find the unique last names with a 'q' but not 'qu'. 
-- Include those names in a comment in your sql code.

select DISTINCT last_name
from employees
where last_name like '%q%'
	and last_name not like '%qu%'
;
-- chileq, lindqvist, qiwen

-- Add a COUNT() to your results (the query above) to find the number of employees with the same last name.

select DISTINCT last_name, count(*)
from employees
where last_name like '%q%'
	and last_name not like '%qu%'
GROUP BY last_name
;

-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) 
-- and GROUP BY to find the number of employees for each gender with those names.

select first_name, gender, count(*)
from employees
where first_name IN ('Irena','Vidya','Maya')
GROUP BY first_name, gender
;

-- Using your query that generates a username for all of the employees, 
-- generate a count employees for each unique username.

select lower(concat(left(first_name, 1),
    left(last_name,4),'_',
    substr(birth_date,6,2), 
    substr(birth_date,3,2))) as username, 
    count(*)
from employees
GROUP BY username
;

-- From your previous query, are there any duplicate usernames? What is the higest number of times a username shows up?

select lower(concat(left(first_name, 1),
    left(last_name,4),'_',
    substr(birth_date,6,2), 
    substr(birth_date,3,2))) as username, 
    count(*)
from employees
GROUP BY username
ORDER BY count(*) 
;
 
-- Bonus: How many duplicate usernames are there from your previous query?

select lower(concat(left(first_name, 1),
    left(last_name,4),'_',
    substr(birth_date,6,2), 
    substr(birth_date,3,2))) as username, 
    count(*)
from employees
GROUP BY username
HAVING count(*) > 1
ORDER BY count(*) DESC
;







