In this project, I took raw pizza sales data and performed data cleaning and transformation to ensure consistency and accuracy. I then developed an interactive Power BI dashboard that provides insights into key sales metrics, trends, and performance. The dashboard includes visualizations for total revenue, orders, and pizza category performance, allowing for easy analysis of best and worst-selling items, busiest sales periods, and customer preferences. This project demonstrates my ability to handle end-to-end data analysis, from cleaning to visualization.

 



# Home Page
<img width="1509" alt="Screenshot 2024-09-07 at 3 34 18 PM" src="https://github.com/user-attachments/assets/6a5f63f0-0288-4f13-a08b-ba438104a58d">

# Best / Worst 
 <img width="1509" alt="Screenshot 2024-09-07 at 3 34 40 PM" src="https://github.com/user-attachments/assets/4405abf0-1a0e-4bcd-9e96-a754504c7e3f">DATA OF THE REPORT:-[pizza db.xlsx](https://github.com/user-attachments/files/16921335/pizza.db.xlsx)




# WORD DOC OF SQL QUERIES
[Pizza sql project.docx](https://github.com/user-attachments/files/16918979/Pizza.sql.project.docx)


# KPI’S (Queries) 
 
## 1) TOTAL REVENUE:- 

select sum(total_price)  

as Total_Revenue  

from pizza_sales; 

 
 

 

## 2)AVG ORDER VALUE:- 

select  

sum(total_price)/count (distinct order_id)  

as Avg_order_value 

from pizza_sales; 

 

 

 

 

## 3)Total pizza sold:- 

select  SUM(quantity) as total_pizzza_sold from pizza_sales; 

 
 

 ## 4)Total orders:- 
select count(distinct order_id)as total_order 

from pizza_sales; 

 

## 5) Avg pizza per order  
select  cast(cast(sum(quantity)as decimal (10,2)) / cast(count(distinct order_id) as decimal (10,2)) as decimal(10,2)) as Avg_pizza_per_order from pizza_sales; 

 

 ________________________________________________________________________________________________________________________________________________________________________________________________________________________

 

# B)CHART QUERIES

 

## 1)DAILY TREND FOR TOTAL ORDERS 

SELECT  

   TO_CHAR(order_date, 'Day') AS order_day,  

   COUNT(DISTINCT order_id) AS total_orders 

FROM  

   pizza_sales 

GROUP BY  

   TO_CHAR(order_date, 'Day'), EXTRACT(DOW FROM order_date) 

ORDER BY  

   EXTRACT(DOW FROM order_date); 

 

## 2)MONTHLY TREND OF TOTAL ORDERS 
SELECT   

TO_CHAR(order_date, 'MONTH') AS order_day,  COUNT(DISTINCT order_id) AS total_orders  

 FROM    pizza_sales  

 GROUP BY   

TO_CHAR(order_date, 'MONTH'), EXTRACT(MONTH FROM order_date)  

 ORDER BY   EXTRACT(MONTH FROM order_date); 

 

 

## 3)PERCENTAGE OF SALES BY PIZZA CATEGORY 

select pizza_category,sum(total_price)*100/ 

(select sum(total_price) from pizza_sales) as pts 

from pizza_sales 

group by pizza_category 

  
 

 

 

 

## 4) BY PIZZA SIZE  

SELECT pizza_size, 

   cast(SUM(total_price) * 100.0 / 

   (SELECT SUM(total_price) 

   FROM pizza_sales)as decimal(10,2)) AS pts 

FROM pizza_sales 

GROUP BY pizza_size 

order by pts desc; 

 

## 5)TOTAL PIZZA SOLD BY PIZZA CATEGORY 

SELECT pizza_category,sum(quantity)as total_quant 

   FROM pizza_sales 

GROUP BY pizza_category; 

 

 

 

 

## 6)TOP 5 BESTSELLERS BY REVENUE,QUANTITY,TOTAL ORDERS 

###  By revenue 

SELECT pizza_name, SUM(total_price) AS Total_Revenue 

FROM pizza_sales 

GROUP BY pizza_name 

ORDER BY Total_Revenue DESC 

LIMIT 5; 

 

###  By quantity 

SELECT pizza_name, SUM(quantity) AS Total_quantity 

FROM pizza_sales 

GROUP BY pizza_name 

ORDER BY Total_quantity DESC 

LIMIT 5; 

 

### Total orders 
SELECT pizza_name,COUNT(DISTINCT order_id) AS Total_Orders 

FROM pizza_sales 

GROUP BY pizza_name 

ORDER BY Total_orders DESC 

LIMIT 5; 

 

## 7)BOTTOM 5  

Total order 

SELECT pizza_name,COUNT(DISTINCT order_id) AS Total_Orders 

FROM pizza_sales 

GROUP BY pizza_name 

ORDER BY Total_orders asc 

LIMIT 5; 

 

### By quantity 
SELECT pizza_name, SUM(quantity) AS Total_quantity  

FROM pizza_sales  

GROUP BY pizza_name  

ORDER BY Total_quantity asc 

LIMIT 5; 

 

### By revenue 

SELECT pizza_name, SUM(total_price) AS Total_Revenue  

FROM pizza_sales  

GROUP BY pizza_name  

ORDER BY Total_Revenue asc 

LIMIT 5; 

 

 

 

 

# NOTE 

## Want to apply the pizza_category or pizza_size filters to the above queries you can use WHERE clause. Follow some of below examples 

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders 

FROM pizza_sales 

WHERE pizza_category = 'Classic' 

GROUP BY pizza_name 

ORDER BY Total_Orders ASC 

 
