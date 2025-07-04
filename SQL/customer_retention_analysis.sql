USE superstore_db;
--  For each customer, calculate the number of days between their current order and their previous order
SELECT 
    `Customer Name`,
    STR_TO_DATE(`Order Date`, '%Y-%m-%d') AS Clean_Order_Date,
    LAG(STR_TO_DATE(`Order Date`, '%Y-%m-%d')) OVER (
        PARTITION BY `Customer Name` 
        ORDER BY STR_TO_DATE(`Order Date`, '%Y-%m-%d')
    ) AS Prev_Order,
    DATEDIFF(
        STR_TO_DATE(`Order Date`, '%Y-%m-%d'),
        LAG(STR_TO_DATE(`Order Date`, '%Y-%m-%d')) OVER (
            PARTITION BY `Customer Name`
            ORDER BY STR_TO_DATE(`Order Date`, '%Y-%m-%d')
        )
    ) AS Days_Between_Orders
FROM 
    superstore_data
ORDER BY 
    `Customer Name`, `Clean_Order_Date`;

--  How does monthly performance vary across regions? Which months had the highest sales in each region?
WITH monthly_sales AS (
  SELECT
    Region,
    CONCAT(
      YEAR(STR_TO_DATE(`Order Date`, '%Y-%m-%d')),
      '-',
      LPAD(MONTH(STR_TO_DATE(`Order Date`, '%Y-%m-%d')), 2, '0')
    ) AS Order_Month,
    ROUND(SUM(Sales), 2) AS Total_Sales
  FROM superstore_data
  GROUP BY 
    Region,
    CONCAT(
      YEAR(STR_TO_DATE(`Order Date`, '%Y-%m-%d')),
      '-',
      LPAD(MONTH(STR_TO_DATE(`Order Date`, '%Y-%m-%d')), 2, '0')
    )
)

SELECT
  Region,
  Order_Month,
  Total_Sales,
  RANK() OVER (PARTITION BY Region ORDER BY Total_Sales DESC) AS Sales_Rank
FROM monthly_sales
ORDER BY Region, Sales_Rank;
--  Which product category has the highest profit margin overall?

SELECT
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percentage
FROM
    superstore_data
GROUP BY
    Category
ORDER BY
    Profit_Margin_Percentage DESC;
 --   Cumulative Profit Trend Over Time
WITH monthly_profit AS (
    SELECT
         DATE_FORMAT(
            STR_TO_DATE(`Order Date`, '%Y-%m-%d'),
            '%Y-%m'
        ) AS Order_Month,
        ROUND(SUM(Profit), 2) AS Monthly_Profit
    FROM
        superstore_data
    GROUP BY
        Order_Month
)

SELECT
    Order_Month,
    Monthly_Profit,
    ROUND(SUM(Monthly_Profit) OVER (ORDER BY Order_Month), 2) AS Cumulative_Profit
FROM
    monthly_profit;

 --   Top 10 Most Profitable Customers (Ranked)
SELECT 
    `Customer Name`,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    RANK() OVER (ORDER BY SUM(Profit) DESC) AS Profit_Rank
FROM 
    superstore_data
GROUP BY 
    `Customer Name`
ORDER BY 
    Profit_Rank
LIMIT 10;
   

   
    



