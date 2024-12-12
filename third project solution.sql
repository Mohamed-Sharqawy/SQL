create database company 

create table department(
	dept_id int primary key,
	dept_name varchar(30) not null)

create table employee(
	emp_id int primary key,
	emp_name varchar(30) not null,
	dept_id int foreign key (dept_id)
	references department(dept_id));
alter table employee
add salary float
alter table employee 
add age int
create table project(
	project_id int primary key,
	project_name varchar(30) not null,
	dept_id int foreign key (dept_id)
	references department (dept_id));

alter table department
add emp_id int foreign key (emp_id)
references employee(emp_id), project_id int foreign key (project_id)
references project(project_id)

INSERT INTO project (project_id, project_name) VALUES
(1, 'Website Development'),
(2, 'Mobile App'),
(3, 'Cloud Migration'),
(4, 'Employee Portal'),
(5, 'Data Analysis'),
(6, 'AI Integration'),
(7, 'CRM Upgrade'),
(8, 'Market Research'),
(9, 'Sales Optimization'),
(10, 'Cybersecurity Enhancements'),
(11, 'IT Infrastructure'),
(12, 'Finance Automation'),
(13, 'HR Recruitment Portal'),
(14, 'Customer Feedback System'),
(15, 'Expansion Strategy'),
(16, 'Employee Training'),
(17, 'Annual Report'),
(18, 'Product Launch'),
(19, 'Cost Optimization'),
(20, 'Project Optimization');

INSERT INTO department (dept_id, dept_name, project_id) VALUES
(1, 'IT', 1),
(2, 'HR', 2),
(3, 'Finance', 3),
(4, 'Marketing', 4),
(5, 'Sales', 5),
(6, 'Logistics', 6),
(7, 'Support', 7),
(8, 'Development', 8),
(9, 'Operations', 9),
(10, 'R&D', 10),
(11, 'Legal', 11),
(12, 'Procurement', 12),
(13, 'Public Relations', 13),
(14, 'Administration', 14),
(15, 'Executive', 15);

INSERT INTO employee (emp_id, emp_name, salary, age, dept_id) VALUES
(1, 'Alice', 70000, 30, 1 ),
(2, 'Bob', 80000, 35, 1),
(3, 'Charlie', 60000, 28, 2),
(4, 'David', 75000, 33, 3),
(5, 'Eva', 72000, 29, 3),
(6, 'Frank', 65000, 26, 4),
(7, 'Grace', 68000, 27, 5),
(8, 'Hank', 77000, 34, 5),
(9, 'Isabel', 69000, 32, 6),
(10, 'Jack', 63000, 25, 7),
(11, 'Karen', 80000, 40, 8),
(12, 'Leo', 75000, 38, 9),
(13, 'Mia', 72000, 31, 10),
(14, 'Nina', 62000, 24, 11),
(15, 'Oscar', 76000, 28, 12),
(16, 'Paul', 70000, 35, 13),
(17, 'Quinn', 68000, 29, 14),
(18, 'Rachel', 82000, 36, 15),
(19, 'Steve', 79000, 37, 1),
(20, 'Tina', 75000, 30, 2),
(21, 'Uma', 69000, 28, 3),
(22, 'Victor', 73000, 33, 4),
(23, 'Wanda', 72000, 31, 5),
(24, 'Xavier', 67000, 27, 6),
(25, 'Yara', 74000, 29, 7),
(26, 'Zane', 81000, 34, 8),
(27, 'Aaron', 65000, 26, 9),
(28, 'Bella', 68000, 30, 10),
(29, 'Carl', 69000, 32, 11),
(30, 'Diana', 72000, 29, 12);

alter table employee 
add department varchar(30)


UPDATE employee
SET department = CASE 
    WHEN emp_id BETWEEN 1 AND 2 THEN 'IT'
    WHEN emp_id BETWEEN 3 AND 4 THEN 'HR'
    WHEN emp_id BETWEEN 5 AND 6 THEN 'Finance'
    WHEN emp_id BETWEEN 7 AND 8 THEN 'Marketing'
    WHEN emp_id BETWEEN 9 AND 10 THEN 'Sales'
    WHEN emp_id BETWEEN 11 AND 12 THEN 'Logistics'
    WHEN emp_id BETWEEN 13 AND 14 THEN 'Support'
    WHEN emp_id BETWEEN 15 AND 16 THEN 'Development'
    WHEN emp_id BETWEEN 17 AND 18 THEN 'Operations'
    WHEN emp_id BETWEEN 19 AND 20 THEN 'R&D'
    WHEN emp_id BETWEEN 21 AND 22 THEN 'Legal'
    WHEN emp_id BETWEEN 23 AND 24 THEN 'Procurement'
    WHEN emp_id BETWEEN 25 AND 26 THEN 'Public Relations'
    WHEN emp_id BETWEEN 27 AND 28 THEN 'Administration'
    WHEN emp_id BETWEEN 29 AND 30 THEN 'Executive'
END;

CREATE TABLE employee_projects (
    emp_id INT NOT NULL,
    project_id INT NOT NULL,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id)
);

INSERT INTO employee_projects (emp_id, project_id) VALUES
-- Employee 1
(1, 1), (1, 2), (1, 3),
-- Employee 2
(2, 3), (2, 4),
-- Employee 3
(3, 5), (3, 6), 
-- Employee 4
(4, 7), (4, 8),
-- Employee 5
(5, 9), (5, 10), (5, 1),
-- Employee 6
(6, 2), (6, 4),
-- Employee 7
(7, 3), (7, 5), (7, 7),
-- Employee 8
(8, 9), (8, 11),
-- Employee 9
(9, 12), (9, 13),
-- Employee 10
(10, 14), (10, 15), (10, 1),
-- Employee 11
(11, 2), (11, 3),
-- Employee 12
(12, 5), (12, 6), (12, 8),
-- Employee 13
(13, 7), (13, 9), (13, 10),
-- Employee 14
(14, 11), (14, 12),
-- Employee 15
(15, 13), (15, 14), (15, 15),
-- Employee 16
(16, 1), (16, 3), (16, 5),
-- Employee 17
(17, 7), (17, 9), (17, 11),
-- Employee 18
(18, 13), (18, 15),
-- Employee 19
(19, 2), (19, 4), (19, 6),
-- Employee 20
(20, 8), (20, 10), (20, 12),
-- Employee 21
(21, 1), (21, 2), (21, 3),
-- Employee 22
(22, 4), (22, 5), (22, 6),
-- Employee 23
(23, 7), (23, 8), (23, 9),
-- Employee 24
(24, 10), (24, 11), (24, 12),
-- Employee 25
(25, 13), (25, 14), (25, 15),
-- Employee 26
(26, 1), (26, 2), (26, 3),
-- Employee 27
(27, 4), (27, 5), (27, 6),
-- Employee 28
(28, 7), (28, 8), (28, 9),
-- Employee 29
(29, 10), (29, 11), (29, 12),
-- Employee 30
(30, 13), (30, 14), (30, 15);

ALTER TABLE project ADD budget FLOAT;

UPDATE project
SET budget = CASE project_id
    WHEN 1 THEN 50000.00
    WHEN 2 THEN 75000.00
    WHEN 3 THEN 60000.00
    WHEN 4 THEN 45000.00
    WHEN 5 THEN 85000.00
    WHEN 6 THEN 70000.00
    WHEN 7 THEN 65000.00
END;


--1. Select All Employees.
select * from employee
--2. Get All Employees in the 'IT' Department.
select * from employee 
where department = 'IT'
--3. Get All Projects and the Employees Working on Them.
select p.project_id, project_name, e.emp_id, emp_name
from project p left join employee_projects ep on p.project_id = ep.project_id
left join employee e on ep.emp_id = e.emp_id
--4. Get Total Salary Cost per Department.
select sum(salary) , department from employee group by department
--5. Find Employees Working on More Than One Project
select distinct emp_name 
from employee_projects ep left join project p 
on p.project_id = ep.project_id left  join employee e on ep.emp_id = e.emp_id
--6. Find the highest paid employees.
select emp_name, emp_id , department, salary from employee
where salary = (select max(salary) from employee)
--7. Get the Number of Employees in Each Department.
select count(e.emp_id), department from employee e join department d
on e.dept_id = d.dept_id group by department
--8. Get the Total Budget and Employees Assigned for Each Project.
select budget , count(e.emp_id) as working_employees , project_name 
from employee e left join employee_projects ep
on e.emp_id = ep.emp_id left join project p on p.project_id = ep.project_id
group by project_name, budget
--9. Find the project with the highest Budget.
select project_name , budget from project
where budget = (select max(budget) from project)
--10. Get Employees who are not assigned to any project.
select emp_name  from employee e , employee_projects ep
where ep.project_id IS NULL