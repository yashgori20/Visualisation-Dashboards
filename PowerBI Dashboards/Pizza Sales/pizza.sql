CREATE TABLE pizza_sales (
    pizza_id INT PRIMARY KEY,
    order_id INT,
    pizza_name_id VARCHAR(50),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price DECIMAL(5, 2),
    total_price DECIMAL(7, 2),
    pizza_size VARCHAR(5),
    pizza_category VARCHAR(50),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(100)
);

select * from pizza_sales

select sum(total_price) / count (distinct order_id) AS avg_ov from pizza_sales

select sum (total_price) as total_revenue
from pizza_sales


select sum(total_price) / count (distinct order_id) AS avg_ov from pizza_sales

select sum(quantity) AS total_sold from pizza_sales

select sum (total_price) as total_revenue
from pizza_sales

select count (distinct order_id) as total_orders from pizza_sales

select cast (cast (count (distinct order_id) as decimal (10,2)) / cast(sum (quantity)as decimal (10,2)) as decimal(10,2)) as avg_pizza_per_order from pizza_sales


SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS avg_pizza_per_order FROM 
    pizza_sales;

 select TO_CHAR(order_date, 'Day') as order_day, count (distinct order_id) as total_orders
from pizza_sales
group by TO_CHAR(order_date, 'Day')

 select TO_CHAR(order_date, 'month') as order_month, count (distinct order_id) as total_orders
from pizza_sales
group by TO_CHAR(order_date, 'month')

 select pizza_category, sum (total_price) * 100 /( select sum (total_price) as total_orders from pizza_sales)
from pizza_sales
group by pizza_category

 select pizza_size, sum (total_price) * 100 / (select sum (total_price) as total_orders from pizza_sales)
from pizza_sales
group by pizza_size

 select pizza_name, sum (total_price) from pizza_sales 
group by pizza_name

 select pizza_name, sum (total_price) as total from pizza_sales 
group by pizza_name 
order by total desc limit 5 

 select pizza_name as worst_selling, sum (total_price) as total from pizza_sales 
group by pizza_name 
order by total limit 5 

