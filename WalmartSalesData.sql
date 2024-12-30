create database if not exists WalmartSales;

create table if not exists sales(
	invoice_id varchar(30) not null primary key,
    branch varchar(5) not null,
    city varchar(30) not null,
    customer_type varchar(30) not null,
    gender varchar(10) not null,
    product_line varchar(100) not null,
    unit_price decimal (10,2) not null,
    quantity int not null,
    vat float(6, 4) not null,
    total decimal(12, 4) not null,
    date_ datetime not null,
    time_ time not null,
    payment_method varchar (15) not null,
    cogs decimal(10, 2) not null,
    gross_margin_pct float(11, 9),
    gross_income decimal(12, 4) not null,
    rating float(2, 1)
	
);


-- Feature Engneering 
-- time of day
select time_,
 (case
	when `time_` between "00:00:00" and "12:00:00" then "Morning"
    when `time_` between "12:01:00" and "16:00:00" then "Afternoon"
    else "Evening"
end
) as time_of_day
from sales;

alter table sales add column time_of_day varchar(20);

update sales 
set time_of_day = (case
	when `time_` between "00:00:00" and "12:00:00" then "Morning"
    when `time_` between "12:01:00" and "16:00:00" then "Afternoon"
    else "Evening"
end
);
-- ------------------------------------------------------------------------------------------------
-- day name 
select 
	date_ ,
	dayname(date_) 
from sales;

alter table sales add column day_name varchar(10);

update sales
set day_name = dayname(date_);
-- ------------------------------------------------------------------------------------------------
-- Month name

select 
	date_,
    monthname(date_)
from sales;

alter table sales add column month_name varchar (10);

update sales 
set month_name = monthname(date_)
-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------
-- --------------------------------------- Generic Question ----------------------------------------------

-- How many unique cities does the data have?
select 
	distinct city 
    from sales;
-- In which city is each branch?
select 
	distinct city,
    branch
from sales;

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------- Product --------------------------------------------

-- How many unique product lines does the data have?
select 
	distinct product_line
from sales;
-- What is the most common payment method?
select 
	payment_method,
    count(payment_method) as cnt
from sales
group by payment_method
order by cnt desc;
-- What is the most selling product line?
select 
	product_line,
    count(product_line) as pdl
from sales
group by product_line
order by pdl desc;
-- What is the total revenue by month?
select 
	month_name as mon,
    sum(total) as total_revenue
from sales
group by month_name
order by total_revenue desc;
-- What month had the largest COGS?
select 
	month_name as mon,
    sum(cogs) as total_cogs
from sales
group by month_name
order by total_cogs desc;
-- What product line had the largest revenue?
select 
	product_line as pdl,
    sum(total) as total_revenue
from sales
group by product_line
order by total_revenue desc;
-- What is the city with the largest revenue?
select 
	branch,
	city ,
    sum(total) as total_revenue
from sales
group by city, branch
order by total_revenue desc;
-- What product line had the largest VAT?
select 
	product_line,
    avg(vat) as avg_tax
from sales
group by product_line
order by avg_tax desc;
-- Which branch sold more products than average product sold?
select 
	branch ,
    sum(quantity) as qty
from sales
group by branch
having sum(quantity) > (select avg (quantity) from sales );
-- What is the most common product line by gender?
select 
	gender, 
    product_line,
    count(gender) as total_cnt
from sales
group by gender, product_line
order by total_cnt desc;
-- What is the average rating of each product line?
select 
	round (avg(rating), 2) as avg_rate,
    product_line
from sales
group by product_line
order by avg_rate desc;


-- --------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------Sales--------------------------------------------------------

-- Number of sales made in each time of the day per weekday
select 
	time_of_day,
    count(*) as total_sales
from sales
where day_name = "monday"
group by time_of_day
order by total_sales desc;

-- Which of the customer types brings the most revenue?
select 
	customer_type,
    sum(total) as total_rev
from sales
group by customer_type
order by total_rev desc;
-- Which city has the largest tax percent/ VAT (Value Added Tax)?
select 
	city,
    avg(vat) as avg_vat
from sales
group by city
order by avg_vat desc;
-- Which customer type pays the most in VAT?
select 
	customer_type,
    avg(vat) as vat
from sales
group by customer_type
order by vat desc;

-- --------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------Customer---------------------------------------------------
-- How many unique customer types does the data have?
select 
	count(customer_type) as cx_cnt,
	customer_type
from sales
group by customer_type
order by cx_cnt desc;
-- How many unique payment methods does the data have?
select
	payment_method,
    count(payment_method) as pay
from sales
group by payment_method
order by pay desc;
-- What is the gender of most of the customers?
select 
	gender,
    count(*) as gen_cnt
from sales
group by gender
order by gen_cnt;
-- What is the gender distribution per branch?
select
	gender,
    count(*) as gen_cnt
from sales
where branch = "B"
group by gender
order by gen_cnt;
-- Which time of the day do customers give most ratings?
select 
	time_of_day,
    avg(rating) as avg_rate
from sales
group by time_of_day
order by avg_rate desc;
-- Which time of the day do customers give most ratings per branch?
select 
	time_of_day,
    avg(rating) as avg_rate
from sales
where branch = "A"
group by time_of_day
order by avg_rate desc;
-- Which day fo the week has the best avg ratings?
select 
	day_name,
    avg(rating) as avg_rate
from sales
group by day_name
order by avg_rate desc;
-- Which day of the week has the best average ratings per branch
select 
	day_name,
    avg(rating) as avg_rate
from sales
where branch = "B"
group by day_name
order by avg_rate desc;

