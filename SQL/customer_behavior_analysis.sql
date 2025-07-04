USE superstore_db;
--  --  Top 10 Customers by Order Count
SELECT 
    `Customer Name`, 
    COUNT(*) AS Total_Orders
FROM 
    superstore_data
GROUP BY 
    `Customer Name`
ORDER BY 
    Total_Orders DESC
LIMIT 10;
--  Top 10 Customers by Total Sales
 SELECT 
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM 
    superstore_data
GROUP BY 
    `Customer Name`
ORDER BY 
    Total_Sales DESC
LIMIT 10;
--  Segment Customers by Order Frequency We’ll group customers as: Low → 1 to 3 orders Medium → 4 to 6 orders High → more than 6 orders
select `Customer Name`, count(*) as total_orders,
case
    when count(*)<=3 then 'low'
    when count(*) between 4 and 6 then 'Medium'
    else 'high'
end as order_frequency_segmentation
FROM 
    superstore_data
group by
       `Customer Name`
order by 
       total_orders desc;
-- How many customers ordered only once, and how many ordered multiple times (returning customers) 
SELECT 
    CASE
        WHEN Order_Count = 1 THEN 'One-Time'
        ELSE 'Returning'
    END AS Customer_Type,
    COUNT(*) AS Number_of_Customers
FROM (
    SELECT 
        `Customer Name`, 
        COUNT(*) AS Order_Count
    FROM 
        superstore_data
    GROUP BY 
        `Customer Name`
) AS sub
GROUP BY 
    Customer_Type;
-- Which customer segments are receiving higher discounts, and are those discounts helping or hurting profit
SELECT 
    Segment,
    ROUND(AVG(Discount), 2) AS Avg_Discount,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    COUNT(*) AS Total_Orders
FROM 
    superstore_data
GROUP BY 
    Segment
ORDER BY 
    Avg_Profit DESC;
-- --  Which customers bring in high profit while receiving minimal discount
SELECT 
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Discount), 2) AS Avg_Discount
FROM 
    superstore_data
GROUP BY 
    `Customer Name`
HAVING 
    Avg_Discount < 0.2 AND Total_Profit > 500
ORDER BY 
    Total_Profit DESC
LIMIT 10;
--  Which region earns the highest profit from returning customers       
SELECT 
    Region,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(*) AS Orders
FROM (
    SELECT 
        `Customer Name`,
        Region,
        Profit
    FROM 
        superstore_data
    WHERE 
        `Customer Name` IN (
            SELECT `Customer Name`
            FROM superstore_data
            GROUP BY `Customer Name`
            HAVING COUNT(*) > 1
        )
) AS returning_customers
GROUP BY 
    Region
ORDER BY 
    Total_Profit DESC
    limit 5;
-- Find the most profitable Sub-Category in each Region.

WITH ranked_subcategories AS (
    SELECT 
        Region,
        `Sub-Category`,
        ROUND(SUM(Profit), 2) AS Total_Profit,
        RANK() OVER (PARTITION BY Region ORDER BY SUM(Profit) DESC) AS Rank_in_Region
    FROM 
        superstore_data
    GROUP BY 
        Region, `Sub-Category`
)

SELECT 
    Region,
    `Sub-Category`,
    Total_Profit
FROM 
    ranked_subcategories
WHERE 
    Rank_in_Region = 1
ORDER BY 
    Region;








       




           
       




   

      








       





