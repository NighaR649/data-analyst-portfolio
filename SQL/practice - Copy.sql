-- Create database
CREATE DATABASE IF NOT EXISTS job_db;
USE job_db;

-- Drop tables if they already exist (for clean re-run)
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Create departments table
CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50),
  location VARCHAR(50)
);

-- Insert data into departments
INSERT INTO departments (dept_id, dept_name, location) VALUES
(101, 'Finance', 'New York'),
(102, 'Marketing', 'Chicago'),
(103, 'IT', 'San Francisco'),
(104, 'HR', 'Boston');

-- Create employees table
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  salary DECIMAL(10,2),
  hire_date DATE,
  dept_id INT,
  manager_id INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
  FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

-- Insert data into employees
INSERT INTO employees (emp_id, emp_name, salary, hire_date, dept_id, manager_id) VALUES
(1, 'Alice Johnson', 70000.00, '2018-03-15', 101, NULL),
(2, 'Bob Smith', 50000.00, '2019-06-20', 102, 1),
(3, 'Carol White', 82000.00, '2017-09-10', 101, 1),
(4, 'David Brown', 60000.00, '2020-01-25', 103, 1),
(5, 'Emma Davis', 75000.00, '2021-11-30', 104, 1),
(6, 'Frank Miller', 65000.00, '2016-03-12', 102, 1),
(7, 'Grace Lee', 90000.00, '2015-07-19', 103, 1),
(8, 'Hank Wilson', 55000.00, '2018-12-05', 104, 1),
(9, 'Ivy Martinez', 58000.00, '2021-08-08', 102, 1),
(10, 'Jack Taylor', 85000.00, '2019-10-17', 103, 1);
select * from employees;
select * from departments;
--  find the total salary of all employees
select sum(salary) as total_salary from employees ;
select dept_id , avg(salary) as avg_salary from employees group by dept_id;
--  list departments with total salary exceeding 150000.
select dept_id from employees group by dept_id having sum(salary)> 150000;
--  Find the max salary in each location.
select d.location , max(e.salary) as max_salary from employees e join departments d on e.dept_id=d.dept_id group by d.location;
select dept_id ,min(salary) as min_salary from employees group by dept_id;
--  Count employees in each location.
select d.location , count(*) as employee_count from employees e join departments d on e.dept_id = d.dept_id group by d.location;
--   List departments where avg salary is greater than 70000.
select dept_id from employees group by dept_id having avg(salary)>70000;
--   List locations where total salary is below 120000.
select d.location,sum(e.salary) as total_salary from employees e join departments d on e.dept_id = d.dept_id  group by d.location having sum(e.salary) <160000;
--  Find locations where min salary is above 60000.
select d.location from employees e join departments d on e.dept_id = d.dept_id group by d.location having min(e.salary) > 60000;
--  Find the number of employees hired after 2018 grouped by department.
select dept_id , count(*) as employee_hired from employees where hire_date > '2018-12-05' group by dept_id;
--  List dept_name where total salary > 130000 and min salary > 50000.
select dept_id from employees group by dept_id having sum(salary)>130000 and min(salary) > 50000; 
--   Find locations having more than 2 employees.
select d.location from employees e join departments d on e.dept_id = d.dept_id group by d.location having count(*) > 2;
--  Show departments where max salary < 90000.
select dept_id from employees  group by dept_id having max(salary)<90000;
--  List locations with average salary between 60000 and 80000.
select d.location from employees e join departments d on e.dept_id=d.dept_id group by d.location having avg(salary) between 60000 and 80000;
--  List dept_name and sum salary where sum salary > 140000.
select dept_id, sum(salary) as sum_salary from employees  group by dept_id having sum(salary)>140000;
--  Find departments where employee count = 2.
select dept_id  from employees  group by dept_id having count(*)=2;
-- Find departments where avg salary is not between 50000 and 75000.
select dept_id , avg(salary) from employees group by dept_id  having avg(salary) not between 50000 and 75000;
--  List locations where total salary is between 100000 and 200000.
select d.location,sum(e.salary) as salary from employees e join departments d on e.dept_id = d.dept_id group by d.location having sum(e.salary) between 100000 and 200000;
--  Find departments where highest salary is less than 85000.
select dept_id , max(salary) as maximum_salary from employees group by dept_id having max(salary)<85000;
--  List dept_name with total employees greater than 1 and average salary greater than 60000
select dept_id , count(*) as employee_count,avg(salary) as average_salary from employees group by dept_id having count(*)>1 and avg(salary)>60000; 
--  List emp_name, dept_name and location.
select e.emp_name,d.dept_name,d.location from employees e join departments d on e.dept_id=d.dept_id;
--   List emp_name and dept_name for employees in Boston.
select e.emp_name, d.dept_name,d.location from employees e join departments d on e.dept_id = d.dept_id where d.location ='Boston';
-- Show emp_name, dept_name, salary for salaries > 70000.
select e.emp_name ,d.dept_name ,e.salary from employees e join departments d on e.dept_id=d.dept_id where e.salary>70000;
--  List dept_name and avg salary in that department.
select d.dept_name,avg(e.salary)from employees e join departments d on e.dept_id=d.dept_id group by d.dept_name;
--  Find emp_name, dept_name where dept location = 'New York'.
select e.emp_name,d.dept_name,d.location from employees e join departments d on e.dept_id=d.dept_id where d.location='New York';
-- List all employees (even those without dept if any).
select e.emp_name,d.dept_name from employees e left join departments d on e.dept_id=d.dept_id;
--   List all departments (even those without employees).
select d.dept_name,e.emp_name from departments d left join employees e on e.dept_id=d.dept_id;
--  Show location and total salary by location.
select d.location ,sum(e.salary) from employees e join departments d on e.dept_id=d.dept_id group by d.location;
--   List dept_name and count of employees in that dept.
select d.dept_name ,count(e.emp_id) from departments d left join employees e on e.dept_id=d.dept_id group by d.dept_name;
--   List all depts with sum salary of their employees (even if sum is null).
select d.dept_name ,sum(e.salary) from departments d left join employees e on e.dept_id = d.dept_id group by d.dept_name;
--  List emp_name and their manager’s emp_name.
select e1.emp_name as employer, e2.emp_name as manager from employees e1 left join employees e2 on e1.manager_id=e2.emp_id;
--  Show employees who don’t have a manager.
select emp_name from employees where manager_id is null;
--   List employees who report to manager_id = 1.
select emp_name from employees where manager_id =1;



