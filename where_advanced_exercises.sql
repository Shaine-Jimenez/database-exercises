show databases;
use employees;
select database();

-- Find all curent or previous employees with first names. What is emp # of top 3 results? 
select *
from employees
where first_name IN ('Irena','Vidya','Maya');

-/* Find all current or previous employees with first names 
'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
What is the employee number of the top three results? Does it match the previous question?
*/
select first_name, emp_no
from employees
where first_name = 'Irena'
	OR first_name = 'Vidya'
    OR first_name = 'Maya';
	

-- 
select DISTINCT first_name, gender
from employees
where first_name = 'Irena'
	OR first_name = 'Vidya'
    OR first_name = 'Maya'
    OR gender = 'M';
    
-- Find all unique last names that start with 'E'.
select DISTINCT last_name
from employees
where last_name LIKE 'E%'; 

-- Find all unique last names that start or end with 'E'.
select last_name
from employees
where last_name LIKE 'E%'
	OR last_name LIKE '%E'; 

-- Find all unique last names that end with E, but does not start with E?
select last_name
from employees
where last_name LIKE '%E'
	AND last_name not LIKE 'E%'; 

-- Find all unique last names that start and end with 'E'.
select DISTINCT last_name
from employees
where last_name LIKE 'E%'
	AND last_name LIKE '%E';
    
-- Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers.
select *
from employees
where hire_date between '1990-01-01' AND '1999-12-30'; 

-- Find all current or previous employees born on Christmas. Enter a comment with top three employee numbers.
select *
from employees
where birth_date like '%12-25'; 

-- Find all current or previous employees hired in the 90s and born on Christmas. 
-- Enter a comment with top three employee numbers.
select *
from employees
where birth_date like '%12-25'
	and hire_date like '199%'; 

-- Find all unique last names that have a 'q' in their last name.
select distinct last_name
from employees
where last_name like '%q%'; 


-- Find all unique last names that have a 'q' in their last name but not 'qu'.
select distinct last_name
from employees
where last_name like '%q%'
	and last_name not like '%qu%'; 


	
	 


	

	 
	
	


