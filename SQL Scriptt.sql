Create Database CompanyDB;
use companydb;

create table employees(empid int primary key, name varchar(50), department varchar(50), salary int, age int);

insert into employees(empid, name, department, salary, age) values(101,'Amit','IT',50000,28);
insert into employees(empid, name, department, salary, age) values(102,'Riya','HR',40000,25);
insert into employees(empid, name, department, salary, age) values(103,'John','IT',60000,30);
insert into employees(empid, name, department, salary, age) values(104,'Sneha','Finance',55000,29);
insert into employees(empid, name, department, salary, age) values(105,'Raj','Finance',45000,26);
insert into employees(empid, name, department, salary, age) values(106,'Priya','HR',48000,27);
insert into employees(empid, name, department, salary, age) values(107,'Arjun','IT',70000,32);

select*from employees;

select count(empid) from employees;
select department,count(empid) from employees group by department;

select department,avg(salary) as AvgSalary from employees group by department;
select avg(salary) from employees;
select department, avg(salary) from employees group by department having avg(salary) > 50000;

select department,sum(salary) from employees group by department;
select sum(salary) from employees;

select department, max(salary) from employees group by department;
select max(salary) from employees;
select *from employees where age = (select max(age) from employees);

select department, min(salary) from employees group by department;
select min(salary) from employees;
select*from employees where age=(select min(age) from employees);
select empid,name,department,salary, min(age) from employees group by empid,name,department,salary,age having age<27;

-- View with Complex SELECT
CREATE VIEW DeptSalaryStats AS SELECT department, COUNT(empid) AS total_employees, AVG(salary) AS average_salary,
MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary FROM employees GROUP BY department;

SELECT * FROM DeptSalaryStats;

--  View for Abstraction and Security
CREATE VIEW PublicEmployeeDirectory AS SELECT empid, name, department FROM employees;

SELECT * FROM PublicEmployeeDirectory;

