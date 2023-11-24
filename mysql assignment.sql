### Assignment
## Database HR

-- First --

#1. Display all information in the tables EMP and DEPT

select * 
from employees , departments;

#2. Display only the hire date and employee name for each employee

select hire_date, first_name
from employees;

#3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title.

select concat(first_name," ",last_name) as Employee, job_id as Title 
from employees;

#4. Display the hire date, name and department number for all clerks.

select hire_date, first_name, department_id, job_title 
from employees join jobs using(job_id)
where job_title like "%clerk";

#5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT.

select concat(employee_id,',',first_name,',',last_name,',',job_id,',',salary,',',manager_id,',',department_id) as output from employees;

#6. Display the names and salaries of all employees with a salary greater than 2000. 

select first_name, salary
from employees 
where salary > 2000;

#7. Display the names and dates of employees with the column headers "Name" and "Start Date" .

select first_name as Name, hire_date as Startdate
from employees;

#8. Display the names and hire dates of all employees in the order they were hired. 

select first_name, hire_date
from employees
order by hire_date;

#9. Display the names and salaries of all employees in reverse salary order.

SELECT first_name, salary
from employees
order by salary desc;

#10. Display 'ename' and "deptno" who are all earned commission and display salary in reverse order. 

select first_name, department_id, salary
from employees
where commission_pct is not null
order by salary desc;

#11. Display the last name and job title of all employees who do not have a manager .

select last_name, job_title
from employees join jobs using(job_id)
where manager_id is null;

#12. Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000.

select  last_name,job_title, salary
from employees join jobs using(job_id)
where job_title in ('salaes representative', 'stock clerk') and salary not in ('2500', '3500', '5000');
 
 
 -- Second --
 
 #1) Display the maximum, minimum and average salary and commission earned. 
 
select avg(salary), avg(commission_pct), max(salary), max(commission_pct), min(salary), min(commission_pct)
from employees;

#2) Display the department number, total salary payout and total commission payout for each department. 

select department_id, sum(salary), sum(commission_pct)
from employees
group by department_id;

#3) Display the department number and number of employees in each department. 

select department_id, count(*)
from employees
group by department_id;

#4) Display the department number and total salary of employees in each department. 

select department_id, sum(salary)
from employees
group by department_id;

#5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name.

select first_name
from employees
where commission_pct is null;

#6) Display the employees name, department id and commission. If an Employee doesnt earn the commission, then display as 'No commission'. Name the columns appropriately.

select first_name, department_id,
 case 
  when commission_pct is null then 'no commission'
  else commission_pct
  end as commission
from employees;

#7) Display the employee name, salary and commission multiplied by 2. If an Employee doesnt earn the commission, then display as 'No commission'. Name the column appropriately.

select first_name, department_id,
case
when commission_pct is not null then commission_pct * 2
when commission_pct is null then 'no commission'
end as commission
from employees;

#8) Display the employee name, department id who have the first name same as another employee in the same department.

Select first_name, department_id
from employees
group by department_id, first_name
having count(first_name) > 1;

#9) Display the sum of salaries of the employees working under each Manager. 

select manager_id, sum(salary)
from employees
group by manager_id;

#10) Select the Managers name, the count of employees working under and the department ID of the manager. 

select m.first_name manager_name, count(e.employee_id) emp_count,m.department_id
from  employees e join employees m on e.manager_id = m.employee_id
group by m.employee_id;

#11) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a'.

select e.first_name, e.department_id, e.salary, m.first_name manager_name
from employees e join employees m on e.manager_id = m.employee_id
where e.last_name like '_a%';

#12) Display the average of sum of the salaries and group the result with the department id.Order the result with the department id.

SELECT avg(SALARY), DEPARTMENT_ID
FROM employees 	
group by department_id;

#13) Select the maximum salary of each department along with the department id .

select max(salary), department_id
from employees
group by department_id;

#14) Display the commission, if not null display 10% of salary, if null display a default value 1.

select employee_id, 
case
when commission_pct is not null then salary * 0.1
when commission_pct is null then 1
end as commisssion
from employees;


-- Third --

#1. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label.

select concat(upper(substring(last_name,2,1)),lower(substring(last_name,3,3)))
from employees;

#2. Write a query that displays the employee first name and last name along with "-" in  between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the  month on which the employee has joined.

select concat(first_name,'-',last_name) name , month(hire_date) month
from employees;
#3. Write a query to display the employees last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label.

select last_name, salary,
case
  when salary > 10000 then (salary+10/100+1500)
  else (salary+11.5/100+1500)
  end as bonus
  from employees;

#4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, if the Manager name 
select concat(substring(e.employee_id,1,2), "00" ,substring(e.employee_id,3),"E") 
as "New_EMP_id", e.department_id,e.salary,
REPLACE(m.last_name,"Z","$")"Replace Name"
from employees as e join employees as m on e.manager_id=m.employee_id;

#5. Write a query that displays the employees last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees last name.

SELECT CONCAT(UPPER(LEFT(last_name, 1)), LOWER(RIGHT(last_name, LENGTH(last_name) - 1))) AS "Formatted Last Name",
LENGTH(last_name) AS "Name Length"
FROM employees
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY last_name;

#6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY 
SELECT last_name,lpad(CONCAT('$', salary), 15, '$') 
AS SALARY
FROM employees;


#7. Display the employee name if it is a palindrome
select first_name, case
when first_name = reverse(first_name) then "palindrome"
else "not palindrone" 
end
" "
from employees;

#8. Display First names of all employees with initcaps.
select first_name, city from employees join departments using (department_id) join locations using (location_id)
where city=
 (select  distinct city from employees join departments using (department_id) join locations using (location_id)
where first_name like "%Trenna"); 
 

#9. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column. 
select first_name,  salary
from employees 
where salary = (select min(salary) from employees);

SELECT first_name, salary
FROM employees
ORDER BY salary
LIMIT 1;

#10. Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. All characters should be in lower case. Display this along with their First Name.

select concat(Upper(substring(first_name,1,1)), lower(last_name), "@systechusa.com")
 as "email address", first_name
from employees;


#11. Display the names and job titles of all employees with the same job as Trenna.
select first_name, job_title
from employees join jobs using (job_id)
where first_name like "%Trenna";

#12. Display the names and department name of all employees working in the same city as Trenna. 
select first_name, city from employees join departments using (department_id) join locations using (location_id)
where city=
 (select  distinct city from employees join departments using (department_id) join locations using (location_id)
where first_name like "%Trenna"); 

#13. Display the name of the employee whose salary is the lowest. 
 
 select first_name, salary
 from employees
 order by salary
 limit 1;
 
 #14. Display the names of all employees except the lowest paid.
select first_name, salary
from employees
where salary <> (select min(salary) from employees);



-- Fourth --

#1. Write a query to display the last name, department number, department name for all employees. 

select last_name, department_id, department_name
from employees join departments using(department_id);

#2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output. 

select distinct(job_id), location_id
from employees join departments using(department_id)
where department_id = 40;

#3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.

select last_name, department_name, location_id, city
from employees join departments using(department_id) join locations using(location_id)
where commission_pct is not null;

#4. Display the employee last name and department name of all employees who have an 'a' in their last name.

select last_name, department_name
from employees join departments using(department_id)
where last_name like '%a%'
order by last_name;

#5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA.

select last_name, job_id, department_id, department_name, country_name
from employees join departments using(department_id) join locations using(location_id) join countries using(country_id)
where country_name = 'atlanta';

 #6. Display the employee last name and employee number along with their manager last name and manager number.

select e.employee_id, e.last_name, m.employee_id, m.last_name 
from employees e join employees m on e.manager_id = m.employee_id;

#7. Display the employee last name and employee number along with their manager last name and manager number (including the employees who have no manager).

select e.employee_id, e.last_name, m.employee_id, m.last_name
from employees e join employees m on e.manager_id = m.employee_id;

#8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee.

select last_name, department_id
from employees
order by department_id;

#9. Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 

select first_name, job_id, department_id, salary,
case
when salary >=50000 then 'A'
when salary >=30000 then 'B'
when salary <30000 then 'C'
end as grade
from employees;

#10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee name, emp_hire_date,manager name,man_hire_date

select e.first_name as Employee_name,e.hire_date as emp_hire_date,m.first_name as manager_name,m.hire_date as man_hire_date
from employees as e join employees as m on e.manager_id= m.employee_id
where date(m.hire_date)>date(e.hire_date);
 
 
 -- Fifth --
 
#1. Write a query to display the last name and hire date of any employee in the same department as SALES.
 
 select last_name, hire_date
 from employees join departments using(department_id)
 where department_name = 'sales';
 
 #2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary. 

 select employee_id, last_name, salary
 from employees
 where salary >(select avg(salary)from employees);

#3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u'
 
 select employee_id, last_name, department_id
 from employees
 where last_name like '%u%'
 order by department_id;

#4. Display the last name, department number, and job ID of all employees whose department location is ATLANTA.
 
 select last_name, department_id, job_id
 from employees join departments using(department_id) join locations using(location_id) join countries using(country_id)
 where country_name = 'atlanta';

#5. Display the last name and salary of every employee who reports to FILLMORE.
 
 

#6. Display the department number, last name, and job ID for every employee in the OPERATIONS department. 

select last_name, department_id, job_id
 from employees join departments using(department_id)
 where department_name = 'operations';
 
#7. Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any employee with a 'u'in their name. 
 
 select employee_id, last_name, salary,department_id
 from employees 
 where last_name like '%u%' and salary > (select avg(salary) from employees)
 order by department_id;
 
 #8. Display the names of all employees whose job title is the same as anyone in the sales dept. 

 select first_name
 from employees join jobs using(job_id)
 where job_title; 

#9. Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, employees in department 2 are given a 10% raise, employees in departments 4 and 5 are given a 15% raise, and employees in department 6 are not given a raise.
 
 select employee_id, salary,
 case
 when department_id = 10 then '5%'
 when department_id = 20 then '10%'
 when department_id = 30 then '5%'
 when department_id = 40 then '15%'
 when department_id = 50 then '15%'
 when department_id = 60 then 'none'
 end as raise
 from employees;

#10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.
 
 select last_name, salary
 from employees
 order by salary desc
 limit 3;
#11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column
 
 select first_name, salary,
 case
 when commission_pct is not null then commission_pct
 when commission_pct is null then 'O'
 end as commission
 from employees;

#12. Display the Managers (name) with top three salaries along with their salaries and department information.
 
 select m.first_name manager_name, m.salary, m.department_id
 from employees e join employees m on e.manager_id = m.employee_id
 group by m.employee_id
order by 2 desc
limit 3;


## date function
 use hr;
 create table empdate(emp_id int,hire_date date, resignation_date date);
 insert into empdate values(1,'2000-1-1' ,'2013-10-7'),
(2,'2003-12-04','2017-08-03'),(3,'2012-9-22','2015-06-21');
insert into empdate (emp_id ,hire_date)values(4,'2015-04-13'),(5,'2016-06-03'),(6,'2017-08-08'),(7,'2016-11-13');

 
 select emp_id,floor(datediff(resignation_date,hire_date)/365)as years, floor(datediff(resignation_date,hire_date)%365/30) as month,datediff(resignation_date,hire_date)%30 as days 
 from empdate where resignation_date is not null;
 
   