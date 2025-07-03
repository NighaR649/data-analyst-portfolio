--  What is the total sales and total profit?
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM 
    superstore_data;
-- Show total sales by region (highest to lowest)  
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM 
    superstore_data
GROUP BY 
    Region
ORDER BY 
    Total_Sales DESC;
--  Top 5 customers by total sales
SELECT 
    Customer_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM 
    superstore_data
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Sales DESC
LIMIT 5;
-- Monthly order trend (Year-Month)
select 
      date_format(order_date,'%Y-%m') as order_month, 
      count(*) as total_orders 
from 
    superstore_data
group by
       order_month 
order by
       order_month;
--  Total Sales by Category & Sub-Category  
select 
      Category,`Sub-Category`,
      round(sum(Sales),2 ) as total_sales 
from 
    superstore_data 
group by 
        Category , `Sub-Category` 
order by
         total_sales desc;
--Profit Margin by Category Profit Margin = (Profit / Sales) × 100  
select Category, 
       round(sum(Profit),2)as total_profit,
       round(sum(Sales),2)as total_sales,
       round((sum(Profit)/sum(Sales))*100,2) as percentage_profit_margin 
from 
     superstore_data 
group by 
         Category 
order by 
         percentage_profit_margin desc;
--   Region with Lowest Total Profit
select 
      Region,
      round(sum(Profit) ,2)  as total_profit 
from 
    superstore_data 
group by 
       region 
order by 
       total_profit asc 
limit 1;  

--  Analyze Discount vs. Profit (High Discount, Low Profit?)

select
       `Discount`,
       round(avg(Profit),2)as avg_profit ,
       count(*) as orders 
from 
     superstore_data 
group by 
       `Discount` 
order by 
        `Discount`;

         

