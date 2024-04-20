CREATE TABLE cannes (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);


INSERT INTO cannes (ProductID, ProductName, Category, Price) VALUES
(1, 'Mustard Oil', 'Edible Oil', 250.00),
(2, 'Soybean Oil', 'Edible Oil', 200.00),
(3, 'Red Chilli Powder', 'Spices', 50.00),
(4, 'Turmeric Powder', 'Spices', 150.00),
(5, 'Coriander Powder', 'Spices', 100.00);
select * from cannes
select productname,category,
case
when productname = 'Mustard Oil' then 'Moga'
when productname = 'Soybean Oil'then 'Moga'
else 'Gujrat'
end as adress
from cannes

-----
-- Create Orders table
CREATE TABLE Order1 (
    delivery_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

-- Insert values into Orders table
INSERT INTO Order1 (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES
(1, 1, '2019-08-01', '2019-08-02'),
(2, 5, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-11'),
(4, 3, '2019-08-24', '2019-08-26'),
(5, 4, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13');

select * from order1

select (count(case when category = 'immediate' then 1 end)::float/count(*)*100) as percentage 
from 
(select *,
case
when customer_pref_delivery_date = order_date then 'immediate'
else 'scheduled'
end as category
from order1)




FROM order1;

select 5::float/2

SELECT ROUND(CAST((SELECT COUNT(executed_date) 
         FROM orders_executed) AS 
         FLOAT(3,2))/
         CAST((SELECT COUNT(quotation_date) 
         FROM orders_issued'') AS 
         FLOAT(3,2)),2) AS 
         rate_of_execution;
         
         
----
-- Create orderissued table
CREATE TABLE order_issued (
    distributor_id INT,
    company_id INT,
    quotation_date DATE
);

-- Insert values into orderissued table
INSERT INTO order_issued (distributor_id, company_id, quotation_date) VALUES
(101, 202, '2019-11-15'),
(101, 203, '2019-11-15'),
(101, 204, '2019-11-15'),
(102, 202, '2019-11-16'),
(102, 201, '2019-11-15'),
(103, 203, '2019-11-17'),
(103, 202, '2019-11-17'),
(104, 203, '2019-11-18'),
(104, 204, '2019-11-18');
---
-- Create orderexecuted table
CREATE TABLE order_executed (
    orders_from INT,
    executed_from INT,
    executed_date DATE
);

-- Insert values into orderexecuted table
INSERT INTO order_executed (orders_from, executed_from, executed_date) VALUES
(101, 202, '2019-11-17'),
(101, 203, '2019-11-17'),
(102, 202, '2019-11-17'),
(103, 203, '2019-11-18'),
(103, 202, '2019-11-19'),
(104, 203, '2019-11-20');

--- using select statement
select * from order_issued
select * from order_executed

select cast(count(executed_date) as float) / cast(count(quotation_date) as float) as a
from order_executed, order_issued;

select 100 as float(3,2)

SELECT CAST(COUNT(executed_date) AS FLOAT) FROM order_executed;

SELECT 
    (CAST(COUNT(executed_date) AS FLOAT) / 
    CAST(COUNT(quotation_date) AS FLOAT)) AS rate_of_execution
FROM 
    order_executed, order_issued;
----
SELECT (CAST(COUNT(executed_date) AS FLOAT) 
from order_executed



-- This is ho wto call between two dates
select * from order_issued 
where quotation_date between '2019-11-15' and '2019-11-16'
--now extract particular day
select extract(year from quotation_date) as order_year,
extract(day from quotation_date) as order_day,
count (*) as order_count
from order_issued
group by order_year,order_day
--This means that the grouping is performed based on the result of the 
--EXTRACT() function, not on the original column names.
---Now  coverting it into diffrent format
select company_id, to_char(quotation_date,'Month DD,YYYY') as new_format
from order_issued

------Diffrent date time functions in sql
--1 Age: Calculates the diffrence between two dates : earlier and later date
select age(current_date,'2023-10-17')
--Using Extract() 
select extract(year from age(current_date,'2019-06-01'))
--This will extract age in years 

---Current date & current time:
select current_date, current_time;
---both in one 
select current_timestamp

---get local time
select localtime

--using date_trunc
select date_trunc('year',quotation_date)
from order_issued
-- it takes date to the first day 
--for month
select date_trunc('month',quotation_date)
from order_issued
-- for day
select date_trunc('day',quotation_date)
from order_issued
--- doesnt do anything with day i guess
------STRING MANIPULATION
--1 UPPER
select upper('My Name is Azam') as name;
--2 lower
select lower('My Name is Azam') as name;
--3 Left syntax left('word', length)
select left('azam',2)
select category,left(category,4)
from cannes
--4 Right
select right('azam',2)
select category, right(category,4)
from cannes
--5 Substring
select substring('My name is azam' 5,4) -- not working
select * from cannes
select category, substring(category,4,2)
from cannes
--6 Cocat
select concat(productname,'_',price) as name_price
from cannes
----PRACTICE 
CREATE TABLE movies (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255),
  release_date DATE
);

INSERT INTO movies (id, title, release_date)
VALUES
  (1, 'The Shawshank Redemption', '1994-10-14'),
  (2, 'The Godfather', '1972-03-24'),
  (3, 'The Godfather: Part II', '1974-12-20'),
  (4, 'The Dark Knight', '2008-07-18'),
  (5, '12 Angry Men', '1957-04-10'),
        (6, 'The Godfather: Part III', '1990-12-25'),
  (7, 'Pulp Fiction', '1994-10-14'),
  (8, 'The Lord of the Rings: The Fellowship of the Ring', '2001-12-19'),
  (9, 'The Dark Knight Rises', '2012-07-20'),
  (10, 'The Lion King', '1994-06-15'),
        (11, 'Forrest Gump', '1994-07-06'),
  (12, 'The Silence of the Lambs', '1991-02-14'),
  (13, 'Jurassic Park', '1993-06-11'),
  (14, 'Titanic', '1997-12-19'),
  (15, 'The Matrix', '1999-03-31'),
  (16, 'The Avengers', '2012-05-04'),
  (17, 'La La Land', '2016-12-09'),
  (18, 'Joker', '2019-10-04'),
  (19, 'Inception', '2010-07-16'),
  (20, 'The Social Network', '2010-10-01');

select * from movies
---Write a query to find all movies that were released in the year 1972
select title,release_date
from movies
where extract(year from release_date) = 1974

--Write a query to find all movies that were released in the month April.
select title, to_char(release_date,'Month,DD,YYYY') as new_format
from movies
where extract(month from (to_char(release_date,'Month,DD,YYYY')) = 'April'
--where to_char(release_date,'Month,DD,YYYY') = 'April'

---we dont have to make it complex
select title, release_date
from movies
where extract(month from release_date) = 04
--Write a query to find the title and release date of the oldest movie in the database.
select title, release_date
from movies
order by release_date asc
limit 1

-- Write a query to find the title and release date of the newest movie in the database.
select title, release_date
from movies
order by release_date desc
limit 1

--Write a query to find the title and release date of all movies released in the 21st century.
select title, release_date
from movies
where release_date >= '2000-01-01' and release_date <= '2100-01-01'

--Write a query to find the title and release date of all movies that were released on a Friday.
--select title, extract(day from release_date)
--from movies
--select title,to_char(release_date,'YYYY-MM-DAY')
--from movies
--where 'DAY' = 'FRIDAY'

select title, to_char(release_date, 'YYYY-MM-Day')
from movies
where TO_CHAR(release_date, 'dy') = 'fri';

--Write a query to find the title and release date 
--of all movies that have a title containing the word 'King'.
select title,release_date
from movies
where title like '%King'
--Write a query to find the title and release date of all 
--movies that have a title consisting of only 3 words.

------------------------------------------------
CREATE TABLE content (
    content_id INT,
    title VARCHAR(255),
    Kids_content CHAR(1),
    content_type VARCHAR(50)
);

INSERT INTO content (content_id, title, Kids_content, content_type)
VALUES 
    (1, 'Leetcode Movie', 'N', 'Movies'),
    (2, 'Alg. for Kids', 'Y', 'Series'),
    (3, 'Database Sols', 'N', 'Series'),
    (4, 'Aladdin', 'Y', 'Movies'),
    (5, 'Cinderella', 'Y', 'Movies');
    
    
CREATE TABLE program (
    program_date DATE,
    content_id INT,
    channel VARCHAR(50)
);

INSERT INTO program (program_date, content_id, channel)
VALUES 
    ('2020-06-10 08:00', 1, 'LC-Channel'),
    ('2020-05-11 12:00', 2, 'LC-Channel'),
    ('2020-05-12 12:00', 3, 'LC-Channel'),
    ('2020-05-13 14:00', 4, 'Disney Ch'),
    ('2020-06-18 14:00', 4, 'Disney Ch'),
    ('2020-07-15 16:00', 5, 'Disney Ch');

select * from content
select * from program
----
--Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.
select c.title,c.kids_content,c.content_type,p.program_date
from content c
join program p
on c.content_id = p.content_id
where program_date between '2020-06-01' and '2020-06-30'
and kids_content = 'Y'

------ Data Realated to a problem on portal
---1st data
CREATE TABLE runners (
    runner_id INT,
    registration_date DATE
);

INSERT INTO runners (runner_id, registration_date)
VALUES 
    (1, '2021-01-01'),
    (2, '2021-01-03'),
    (3, '2021-01-08'),
    (4, '2021-01-15');

--2nd data
CREATE TABLE orders2 (
    order_id INT,
    customer_id INT,
    pizza_id INT,
    exclusions VARCHAR(255),
    extras VARCHAR(255),
    order_time TIMESTAMP
);

INSERT INTO orders2 (order_id, customer_id, pizza_id, exclusions, extras, order_time)
VALUES 
    (1, 101, 1, NULL, NULL, '2020-01-01 18:05'),
    (2, 101, 1, NULL, NULL, '2020-01-01 19:00'),
    (3, 102, 1, NULL, NULL, '2020-01-02 23:51'),
    (3, 102, 2, 'None', NULL, '2020-01-02 23:51'),
    (4, 103, 1, '4', NULL, '2020-01-04 13:23'),
    (4, 103, 1, '4', NULL, '2020-01-04 13:23'),
    (4, 103, 2, '4', NULL, '2020-01-04 13:23'),
    (5, 104, 1, NULL, '1', '2020-01-08 21:00'),
    (6, 101, 2, NULL, NULL, '2020-01-08 21:03'),
    (7, 105, 2, NULL, '1', '2020-01-08 21:20'),
    (8, 102, 1, NULL, NULL, '2020-01-09 23:54'),
    (9, 103, 1, '4', '1, 5', '2020-01-10 11:22'),
    (10, 104, 1, NULL, NULL, '2020-01-11 18:34'),
    (10, 104, 1, '2, 6', '1, 4', '2020-01-11 18:34');

--3rd data
drop table orders3
CREATE TABLE orders3 (
    order_id INT,
    runner_id INT,
    pickup_time TIMESTAMP,
    distance VARCHAR(20),
    duration VARCHAR(20),
    cancellation VARCHAR(20)
);

INSERT INTO orders3 (order_id, runner_id, pickup_time, distance, duration, cancellation)
VALUES 
    (1, 1, '2020-01-01 18:15', '20km', '32 minutes', NULL),
    (2, 1, '2020-01-01 19:10', '20km', '27 minutes', NULL),
    (3, 1, '2020-01-03 00:12', '13.4km', '20 mins', 'None'),
    (4, 2, '2020-01-04 13:53', '23.4km', '40', 'None'),
    (5, 3, '2020-01-08 21:10', '10km', '15', 'None'),
    (6, 3, NULL, NULL, NULL, 'Cancelled'),
    (7, 2, '2020-01-08 21:30', '25km', '25mins', NULL),
    (8, 2, '2020-01-10 00:15', '23.4 km', '15 minute', NULL),
    (9, 2, NULL, NULL, NULL, 'Cancelled'),
    (10, 1, '2020-01-11 18:50', '10km', '10minutes', NULL);
    
    
----4 data
CREATE TABLE pizza (
    pizza_id INT,
    pizza_name VARCHAR(50)
);

INSERT INTO pizza (pizza_id, pizza_name)
VALUES 
    (1, 'Meatlovers'),
    (2, 'Vegetarian');
    
---5 data
CREATE TABLE pizza_top (
    pizza_id INT,
    toppings VARCHAR(255)
);

INSERT INTO pizza_top (pizza_id, toppings)
VALUES 
    (1, '1, 2, 3, 4, 5, 6, 8, 10'),
    (2, '4, 6, 7, 9, 11, 12');

---6 data
CREATE TABLE toppings (
    topping_id INT,
    topping_name VARCHAR(50)
);

INSERT INTO toppings (topping_id, topping_name)
VALUES 
    (1, 'Bacon'),
    (2, 'BBQ Sauce'),
    (3, 'Beef'),
    (4, 'Cheese'),
    (5, 'Chicken'),
    (6, 'Mushrooms'),
    (7, 'Onions'),
    (8, 'Pepperoni'),
    (9, 'Peppers'),
    (10, 'Salami'),
    (11, 'Tomatoes'),
    (12, 'Tomato Sauce');


---- Now Execution
select * from runners
select * from orders2
select * from orders3
select * from pizza
select * from pizza_top
select * from toppings
-----------------------------
select runner_id,
case
when registration_date between '2021-01-01' and '2021-01-03' then 'Week1'
when registration_date between '2021-01-03' and '2021-01-08' then 'Week2'
when registration_date between '2021-01-08' and '2021-01-015' then 'Week3'

else 'Week4'
end as runner_signups
from runners
group by registration_date,runner_id


------Window function question
CREATE TABLE sales2 (
  id SERIAL PRIMARY KEY,
  date DATE,
  customer_name TEXT,
  product_name TEXT,
  quantity INTEGER,
  price NUMERIC
);

INSERT INTO sales2 (date, customer_name, product_name, quantity, price)
VALUES
  ('2022-03-01', 'John', 'Shoes', 2, 100),
  ('2022-03-02', 'Mike', 'Shirt', 3, 50),
  ('2022-03-02', 'Mike', 'Shoes', 1, 150),
  ('2022-03-03', 'Jane', 'Hat', 1, 25),
  ('2022-03-04', 'John', 'Shirt', 2, 60),
  ('2022-03-05', 'Jane', 'Shoes', 1, 120),
  ('2022-03-06', 'Mike', 'Shoes', 2, 150),
  ('2022-03-06', 'Jane', 'Shirt', 1, 30),
  ('2022-03-07', 'John', 'Hat', 3, 15),
  ('2022-03-08', 'Mike', 'Hat', 1, 20),
  ('2022-03-09', 'Jane', 'Shoes', 2, 120),
  ('2022-03-09', 'Mike', 'Shirt', 1, 50);


select * from sales2
--Display the total sales amount for each customer.
select customer_name,sum(quantity * price)
from sales2
group by customer_name    ---Tried using partition by here but that should not be used here 

--Rank the customers based on their total sales amount.
select customer_name,
rank() over(order by sum(quantity * price) desc ) as rank 
from sales2
group by customer_name

---Display the daily sales amount for each product using a window function.
select date,product_name, sum(quantity*price) as daily_sales
from sales2
group by date,product_name
order by date asc
----
select date,product_name,
sum(quantity*price) over (partition by (product_name) order by product_name) as New
from sales2
---here it is showing revenue for one product name 

select date, product_name,
sum(quantity*price) over(partition by date,product_name)
from sales2
--- here it is showing sale on daily basis for producy

---Display the top-selling product for each customer.
select product_name,customer_name, sum(quantity*price)
from sales2
group by product_name, customer_name
order by sum(quantity*price) desc


---but use ranking function
---first find rank
select product_name,customer_name,total_sale
from 
(select product_name,customer_name,sum(quantity*price) as total_sale,
rank()over(partition by product_name order by sum(quantity*price) desc) 
from sales2
group by product_name,customer_name)
where rank = 1
--Display the average quantity of each product sold per day using a window function.
select date,product_name,
round(avg(quantity)over(partition by product_name order by date asc),2) as average
from sales2

---Display the products that were sold above their average quantity for each day
select date,product_name
from (
select date, product_name, round(avg(quantity),2) as average_qua, quantity
from sales2
group by date, product_name,quantity )
where average_qua > quantity



select  player_id,event_date,
sum(games_played)over(partition by player_id order by event_date ) as 'games_played_so_far'
from activity
order by player_id, games_played_so_far





----new
CREATE TABLE Customers2 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Customers2 (customer_id, name) VALUES
(1, 'Winston'),
(2, 'Jonathan'),
(3, 'Annabelle'),
(4, 'Marwan'),
(5, 'Khaled');

CREATE TABLE Orders4 (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    cost DECIMAL(10, 2)
);

INSERT INTO Orders4 (order_id, order_date, customer_id, cost) VALUES
(1, '2020-07-31', 1, 30.00),
(2, '2020-07-30', 2, 40.00),
(3, '2020-07-31', 3, 70.00),
(4, '2020-07-29', 4, 100.00),
(5, '2020-06-10', 1, 1010.00),
(6, '2020-08-01', 2, 102.00),
(7, '2020-08-01', 3, 111.00),
(8, '2020-08-03', 1, 99.00),
(9, '2020-08-07', 2, 32.00),
(10, '2020-07-15', 1, 2.00);

---
select * from customers2
select * from orders4
select name,customer_id,order_id,order_date
from (
select c.name,c.customer_id,o.order_id,o.order_date,
rank()over(partition by name order by order_date desc) as rank
from customers2 c
join orders4 o
on c.customer_id = o.customer_id)
where rank <=3
order by name,customer_id,order_date desc
--Write an SQL query to find the most recent three orders of each user. 
--If a user ordered less than three orders, return all of their orders.

-----------------------

CREATE TABLE Employees1 (
    company_id INT,
    employee_id INT,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO Employees1 (company_id, employee_id, employee_name, salary) VALUES
(1, 1, 'Tony', 2000.00),
(1, 2, 'Pronub', 21300.00),
(1, 3, 'Tyrrox', 10800.00),
(2, 1, 'Pam', 300.00),
(2, 7, 'Bassem', 450.00),
(2, 9, 'Hermione', 700.00),
(3, 7, 'Bocaben', 100.00),
(3, 2, 'Ognjen', 2200.00),
(3, 13, 'Nyancat', 3300.00),
(3, 15, 'Morninngcat', 7777.00);

select * from employees1
select company_id,employee_id,employee_name,
case
when salary < 1000 then salary-(salary*0)
when salary > 1000 or salary < 10000 then salary-(salary*0.24)
else salary-(salary*0.49)
end as tax
from employees1
group by company_id,employee_id,employee_name,salary
----- diffrent method
select *,
round(case
when max(salary) over (partition by company_id) < 1000 then salary
when max(salary) over (partition by company_id) between 1000 and 10000 then salary - (salary*0.24)
else salary-(salary*0.49)
end,0) as salary_after_tax
from employees1




------
-- Create the Students table
drop table students
CREATE TABLE Students (
    ID INT,
    Name VARCHAR(50),
    Marks INT
);

-- Insert data into the Students table
INSERT INTO Students (ID, Name, Marks) VALUES
(19, 'Samantha', 87),
(21, 'Julia', 96),
(11, 'Britney', 95),
(32, 'Kristeen', 100),
(12, 'Dyana', 55),
(13, 'Jenny', 66),
(14, 'Christene', 88),
(15, 'Meera', 24),
(16, 'Priya', 76),
(17, 'Priyanka', 77),
(18, 'Paige', 74),
(19, 'Jane', 64),
(21, 'Belvet', 78),
(31, 'Scarlet', 80),
(41, 'Salma', 81),
(51, 'Amanda', 34),
(61, 'Heraldo', 94),
(71, 'Stuart', 99),
(81, 'Aamina', 77),
(76, 'Amina', 89),
(91, 'Vivek', 84);

select * from students
-- Create the Grades table
CREATE TABLE Grades (
    Grade INT PRIMARY KEY,
    Min_Mark INT,
    Max_Mark INT
);

-- Insert data into the Grades table
INSERT INTO Grades (Grade, Min_Mark, Max_Mark) VALUES
(10, 90, 100),
(9, 80, 89),
(8, 70, 79),
(7, 60, 69),
(6, 50, 59),
(5, 40, 49),
(4, 30, 39),
(3, 20, 29),
(2, 10, 19),
(1, 0, 9);

select * from grades
select * from students
select * from cannes1

-----
CREATE table table1 (
    number int
);

INSERT INTO table1 (number)
VALUES
    (1),
    (1);
    
create table table2 (
number int
)
insert into table2(number)
values
(1),
(1),
(1);
update table2
set number = 1

insert into table2 (number)
values(null);
select * from table1
select * from table2

select *
from table1 t1
full join table2 t2
on t1.number = t2.number

-----
CREATE TABLE example_table (
    id INT,
    name VARCHAR(50)
);

INSERT INTO example_table (id, name) VALUES
(1, 'John'),
(2, 'Alice'),
(3, 'Bob'),
(1, 'John'),
(4, 'Alice');
select * from example_table


with new as(
select *, 
row_number() over (partition by name) as new_name from example_table)
select id,name from new
where new_name <2
order by id asc
select upper('Hello') as greeting
select * from sales
select *,
ntile(5) over(partition by sale_price ) as rownum
from sales

----
create table employee3(
firstname varchar(30),
lastname varchar(30),
gender varchar(2),
dateofbirth date);

insert into employee3 values('Mohammad','Azam','M','1996,06,01');
insert into employee3 values('Rakshanda','Yaqoob','F','2000,10,08');
insert into employee3 values('Subiya','Ayoub','F',',2000,03,07');
select * from employee3

select *,
case
when gender = 'M' then 'F'
when gender = 'F' then 'M'
else 'unknown'
end as new_gender
from employee3
with new as(
select *,
row_number() over (order by firstname asc) as rownum
from employee3)
select max(rownum),firstname,lastname
from new
group by firstname,lastname


------------
select * from menu
-- Create the table named "customers"
CREATE TABLE members (
    customer_id VARCHAR(50),
    join_date DATE
);

-- Insert data into the "customers" table
INSERT INTO members (customer_id, join_date) VALUES
    ('A', '2021-01-07'),
    ('B', '2021-01-09');
select * from members
-- Create the table named "sales"
CREATE TABLE sales3 (
    customer_id VARCHAR(50),
    order_date DATE,
    product_id INT
);

-- Insert data into the "sales" table
INSERT INTO sales3 (customer_id, order_date, product_id) VALUES
    ('A', '2021-01-01', 1),
    ('A', '2021-01-01', 2),
    ('A', '2021-01-07', 2),
    ('A', '2021-01-10', 3),
    ('A', '2021-01-11', 3),
    ('A', '2021-01-11', 3),
    ('B', '2021-01-01', 2),
    ('B', '2021-01-02', 2),
    ('B', '2021-01-04', 1),
    ('B', '2021-01-11', 1),
    ('B', '2021-01-16', 3),
    ('B', '2021-02-01', 3),
    ('C', '2021-01-01', 3),
    ('C', '2021-01-01', 3),
    ('C', '2021-01-07', 3);
select * from menu
select * from members
select * from sales3

with new as (
select s.customer_id, s.order_date,mm.product_name,mm.price,m.join_date
from sales3 s
join members m
on s.customer_id = m.customer_id
join menu mm
on s.product_id = mm.product_id )
select customer_id,order_date,product_name,price,
case 
when join_date > order_date then 'N'
when join_date < order_date then 'Y'
else 'N'
end as member
from new
order by order_date,customer_id

-----
SELECT 
  s.customer_id, 
  s.order_date, 
  m.product_name, 
  m.price,
  CASE WHEN mm.join_date > s.order_date THEN 'N'
          WHEN mm.join_date <= s.order_date THEN 'Y'
          ELSE 'N' END AS member
FROM sales3 AS s
LEFT JOIN menu AS m
        ON s.product_id = m.product_id
LEFT JOIN members AS mm
        ON s.customer_id = mm.customer_id
ORDER BY s.customer_id, s.order_date ;

select * from cannes
select productid, productname ||' is of'||category||' and price is'||price as new
from cannes
--when you want to write a query where you want to add statements also then table name (concat operator ||) 
--then in quotes write your stetement
--Lets work on a sql progra where we try our hand on making a triangle
select '*****' as Triangle
union all
select '****'
union all
select '***'
union all
select '**'
union all
select '*'
----recursive CTE
-- Create the categories table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    parent_id INTEGER
);

-- Insert data into the categories table
INSERT INTO categories (category_id, name, parent_id)
VALUES
    (1, 'Electronics', NULL),
    (2, 'Computers', 1),
    (3, 'Laptops', 2),
    (4, 'Desktops', 2),
    (5, 'Mobiles', 1),
    (6, 'Android', 5),
    (7, 'iOS', 5);
    
select * from categories

---create a table for studying self join
create table study (
s_id varchar(2),
c_id varchar(2),
year date
)
insert into study values
('S1','C1','2016-02-01'),
('S2','C1','2017-02-01'),
('S3','C2','2017-02-01')

select * from study
select *
from study s1
join study s2
on s1.s_id = s2.s_id

create table ex (
id int primary key,
revenue int)
insert into ex values
(1,10),
(2,20),
(3,30),
(4,40);
select * from ex

---cumulative addition
select *,
sum(revenue) over (order by id) as cumulative
from ex
--- now using self join over this
select *
from ex ex1
join ex ex2
on ex1.id >= ex2.id -- we sum up all the revenues from e2 where id <= to e1
group by ex1.id
order by ex1.id
-----
CREATE TABLE sales4 (
    sale_date DATE,
    product_name VARCHAR(50),
    sales_amount INT
);
INSERT INTO sales4 (sale_date, product_name, sales_amount) VALUES
('2022-01-01', 'Product A', 1000),
('2022-01-02', 'Product B', 2000),
('2022-01-02', 'Product C', 3000),
('2022-01-03', 'Product A', 1500),
('2022-01-03', 'Product B', 2500),
('2022-01-03', 'Product C', 3500),
('2022-01-04', 'Product A', 1200),
('2022-01-04', 'Product C', 3200),
('2022-01-05', 'Product B', 1800),
('2022-01-05', 'Product C', 2800);
with new1 as (select * from sales4
select product_name,sales_amount,
sum(sales_amount) over (partition by product_name order by sales_amount) as cumulative
from sales4
),
new2 as (SELECT product_name,sale_date,
SUM(sales_amount) AS revenue
FROM sales4
GROUP BY product_name, sale_date
order by product_name),
new3 as (select sum(revenue) as total_revenue
-------------------------------------------------

from new2)
select product_name,sale_date,revenue,cumulative,(revenue/total_revenue) *100 as percent
from new2

WITH product_revenue AS (
  SELECT
    product_name,
    sale_date,
    SUM(sales_amount) AS revenue
  FROM sales
  GROUP BY product_name, sale_date
),
product_cumulative_revenue AS (
  SELECT
    product_name,
    sale_date,
    revenue,
    SUM(revenue) OVER (PARTITION BY product_name ORDER BY sale_date) AS cumulative_revenue
  FROM product_revenue
),
total_revenue AS (
  SELECT SUM(revenue) AS total_revenue
  FROM product_cumulative_revenue
)
SELECT
  product_name,
  sale_date,
  revenue,
  cumulative_revenue,
  revenue / total_revenue * 100 AS percentage_of_total
FROM product_cumulative_revenue
JOIN total_revenue ON 1 = 1;

select *,
lag(revenue,1,0) over (order by revenue) as perday
from ex

create table social(
id int primary key,
Type varchar(20),
Sentiment varchar(20),
Score int
)
select * from social
insert into social values
(0,'happy','positive',10)

----------
-- Create Sales table
CREATE TABLE Sales5 (
    ProductName VARCHAR(50),
    RegionID INT,
    SalesQuantity INT
);

-- Insert data into Sales table
INSERT INTO Sales5 (ProductName, RegionID, SalesQuantity) VALUES
('ProductA', 1, 10),
('ProductA', 2, 15),
('ProductA', 3, 20),
('ProductB', 1, 12),
('ProductB', 2, 18),
('ProductB', 3, 8),
('ProductC', 1, 5),
('ProductC', 2, 10),
('ProductC', 3, 15);
--------------
-- Create Regions table
CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(50)
);

-- Insert data into Regions table
INSERT INTO Regions (RegionID, RegionName) VALUES
(1, 'Region1'),
(2, 'Region2'),
(3, 'Region3');

-----
-- Create Products table
CREATE TABLE Products1 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

-- Insert data into Products table
INSERT INTO Products1 (ProductID, ProductName) VALUES
(1, 'ProductA'),
(2, 'ProductB'),
(3, 'ProductC');
select * from sales5 
select * from products1
select * from regions

with new as(
select s.productname,s.salesquantity,r.regionname
from sales5 s
join regions r
on s.regionid = r.regionid
)
select * from new
pivot(
sum(s.salesquantity) for r.regionname in ('region1','region2','region3')
) as pivotnew
WITH new AS (
    SELECT s.productname, s.salesquantity, r.regionname
    FROM sales5 s
    JOIN regions r ON s.regionid = r.regionid
)
SELECT *
FROM crosstab(
    'SELECT productname, regionname, sum(salesquantity) AS total_sales
     FROM new
     GROUP BY productname, regionname
     ORDER BY productname, regionname'
) AS pivotnew(productname VARCHAR, "Region1" INT, "Region2" INT, "Region3" INT);
WITH new AS (
    SELECT s.productname, s.salesquantity, r.regionname
    FROM sales5 s
    JOIN regions r ON s.regionid = r.regionid
)
SELECT
    productname,
    SUM(CASE WHEN regionname = 'Region1' THEN salesquantity ELSE 0 END) AS "Region1",
    SUM(CASE WHEN regionname = 'Region2' THEN salesquantity ELSE 0 END) AS "Region2",
    SUM(CASE WHEN regionname = 'Region3' THEN salesquantity ELSE 0 END) AS "Region3"
FROM new
GROUP BY productname;



-- Create the table
CREATE TABLE occupations (
    name VARCHAR(50),
    occupation VARCHAR(50)
);

-- Insert the values
INSERT INTO occupations (name, occupation) VALUES
('Ashley', 'Professor'),
('Samantha', 'Actor'),
('Julia', 'Doctor'),
('Britney', 'Professor'),
('Maria', 'Professor'),
('Meera', 'Professor'),
('Priya', 'Doctor'),
('Priyanka', 'Professor'),
('Jennifer', 'Actor'),
('Ketty', 'Actor'),
('Belvet', 'Professor'),
('Naomi', 'Professor'),
('Jane', 'Singer'),
('Jenny', 'Singer'),
('Kristeen', 'Singer'),
('Christeen', 'Singer'),
('Eve', 'Actor'),
('Aamina', 'Doctor');

-- Verify the inserted values
SELECT * FROM occupations;

with new as (
select *,
row_number() over (partition by occupation order by name) as rownum
from occupations)
select
max(case when occupation = 'Doctor' then name end) as d,
max(case when occupation = 'Professor' then name end) as p,
max(case when occupation = 'Singer' then name end) as s,
max(case when occupation = 'Actor' then name end) as a
from new

group by rownum
order by rownum