-- =====================================
-- Superstore SQL Analysis
-- Dataset: Superstore (CSV assumed as table: superstore)
-- Purpose: Practice SQL for Data Analyst Interviews
-- =====================================

-- 1. Total Revenue (Overall)
SELECT
    SUM(Sales) AS total_revenue
FROM superstore;

-- 2. Total Revenue by Region
SELECT
    Region,
    SUM(Sales) AS total_revenue
FROM superstore
GROUP BY Region
ORDER BY total_revenue DESC;

-- 3. Total Profit by Category
SELECT
    Category,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Category
ORDER BY total_profit DESC;

-- 4. Top 3 Products by Profit
SELECT
    Product_Name,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Product_Name
ORDER BY total_profit DESC
LIMIT 3;

-- 5. Average Order Value (AOV)
SELECT
    AVG(Sales) AS average_order_value
FROM superstore;

-- 6. Total Orders Count
SELECT
    COUNT(DISTINCT Order_ID) AS total_orders
FROM superstore;

-- 7. Monthly Sales Trend
SELECT
    YEAR(Order_Date) AS order_year,
    MONTH(Order_Date) AS order_month,
    SUM(Sales) AS monthly_sales
FROM superstore
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY order_year, order_month;

-- 8. Yearly Sales Trend
SELECT
    YEAR(Order_Date) AS order_year,
    SUM(Sales) AS yearly_sales
FROM superstore
GROUP BY YEAR(Order_Date)
ORDER BY order_year;

-- 9. Customers with More Than 10 Orders
SELECT
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM superstore
GROUP BY Customer_Name
HAVING COUNT(DISTINCT Order_ID) > 10
ORDER BY total_orders DESC;

-- 10. Top 5 Customers by Revenue
SELECT
    Customer_Name,
    SUM(Sales) AS total_revenue
FROM superstore
GROUP BY Customer_Name
ORDER BY total_revenue DESC
LIMIT 5;

-- 11. Region-wise Average Profit
SELECT
    Region,
    AVG(Profit) AS avg_profit
FROM superstore
GROUP BY Region
ORDER BY avg_profit DESC;

-- 12. Category-wise Average Discount
SELECT
    Category,
    AVG(Discount) AS avg_discount
FROM superstore
GROUP BY Category
ORDER BY avg_discount DESC;

-- 13. Orders with Negative Profit (Loss-making Orders)
SELECT
    Order_ID,
    Customer_Name,
    Sales,
    Profit
FROM superstore
WHERE Profit < 0;

-- 14. Sales Contribution by Segment
SELECT
    Segment,
    SUM(Sales) AS total_sales
FROM superstore
GROUP BY Segment
ORDER BY total_sales DESC;

-- 15. Top 5 Cities by Sales
SELECT
    City,
    SUM(Sales) AS total_sales
FROM superstore
GROUP BY City
ORDER BY total_sales DESC
LIMIT 5;
