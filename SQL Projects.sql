create database practice;
create table departments ( department_id int Primary Key,
department_name varchar(50),
location varchar(50));

insert into departments (department_id, department_name, location)
VALUES
(1, "HR", "New York"),
(2, "Finance", "Chicago"),
(3, "IT", "San Francisco"),
(4, "Marketing", "Boston"),
(5, "Operations", "Seattle"),
(6, "Legal", "Washington"),
(7, "Sales", "Los Angeles"),
(8, "Precurement", "Austin"),
(9, "Admin", "Denver"),
(10, "Product", "San Diago"),
(11, "Support", "Orlando"),
(12, "Research", "Palo Alto"),
(13, "Quality", "Dallas"),
(14, "Security", "Huston"),
(15, "Strategy", "Atlanta");



Create Table employees (
employee_id int primary key,
full_name varchar(100),
email varchar(100),
salary decimal (10, 2),
hire_date date,
department_id int,
manager_id int,
bonus decimal (10, 2),
performance_rating int,
foreign key (department_id) references departments(department_id));


Insert into employees (employee_id, full_name, email, salary, hire_date, department_id, manager_id, bonus, performance_rating)
values
(1, "Alice Johnson", "alice.j@example.com", 75000, "2018-03-12", 1, null, 5000, 4),
(2, "Bob Smith", "bob.s@example.com", 85000, "2017-06-25", 2, 1, 6000, 5),
(3, "Cahrles Ray", "charlie.r@example.com", 72000, "2019-01-15", 3, 1, 6000, 5),
(4, "Diana King", "Diana.K@example.com", 95000, "2016-11-30", 4, 2, 7000, 5),
(5, "Ethan Hunt", "ethan.h@example.com", 62000, "2020-09-01", 5, 2, null, 2),
(6, "Fiona White", "fiona.W@example.com", 88000, "2021-04-21", 6, 1, 3000, 3),
(7, "George Bell", "george.b@example.com", 88000, "2021-04-21", 7, 3, 4000, 4),
(8, "Helen Brooks", "Helen.b@example.com", 79000, "2019-10-10", 8, 4, 4500, 4),
(9, "Ian Clark", "ian.c@example.com", 93000, "2015-02-05", 9, null, 8000, 5),
(10, "Jane Box", "Jane.f@example.com", 71000, "2022-01-15", 10 , 4, 2500, 2),
(11, "Kyle Nash", "Kyle.n@example.com", 64000, "2023-05-01", 11, 9, null, 3),
(12, "Laura Dean", "Laura.d@example.com", 81000, "2021-12-20", 12, 4, 5200, 4),
(13, "Mark Twain", "mark.t@example.com", 86000, "2020-03-03", 13, 6, 6100, 4),
(14, "Nina Scott", "nina.s@example.com", 57000, "2018-08-25", 14, 6, null, 3),
(15, "Owen Grey", "owen.g@example.com", 92000, "2016-06-30", 15, null, 7500, 5);

select e.full_name as employees, m.full_name as manager
from employees e
join employees m on e.manager_id = m.employee_id
where e.hire_date < m.hire_date;


select reverse(full_name) from employees;


select d.location, count(*) as count from employees e
join departments d on e.department_id = d.department_id
group by d.location;


select d.department_name from employees e
join departments d on e.department_id = d.department_id
group by d.department_name
having avg(salary) < 75000;

select * from employees order by hire_date asc limit 1;

select * from employees where dayofweek(hire_date) = 2;


select m.full_name as manager, sum(e.salary) as team_salary from employees e
join employees m on e.manager_id = m.employee_id
group by m.full_name;

select year(hire_date) as year_joined, count(*) as total from employees
group by year_joined;


select * from employees where
performance_rating = (select max(performance_rating) from employees);
