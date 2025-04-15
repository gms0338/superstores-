-- 1. Total Sales by Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 2. Top 10 Customers by Total Sales
SELECT Customer_Name, SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 3. Monthly Sales Trend
SELECT 
  DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
  SUM(Sales) AS Monthly_Sales
FROM Superstore
GROUP BY Month
ORDER BY Month;

-- 4. Category & Sub-Category-wise Profit
SELECT Category, Sub_Category, SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Category, Sub_Category
ORDER BY Total_Profit DESC;

-- 5. Discount Impact on Profit
SELECT Discount, ROUND(AVG(Profit), 2) AS Avg_Profit
FROM Superstore
GROUP BY Discount
ORDER BY Discount;

-- 6. Top 5 Products by Quantity Sold
SELECT Product_Name, SUM(Quantity) AS Total_Quantity
FROM Superstore
GROUP BY Product_Name
ORDER BY Total_Quantity DESC
LIMIT 5;

-- 7. Sales and Profit by Segment
SELECT Segment, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 8. Products with Negative Profit
SELECT Product_Name, SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Product_Name
HAVING Total_Profit < 0
ORDER BY Total_Profit ASC
LIMIT 10;

-- 9. Customer Order Frequency
SELECT Customer_Name, COUNT(DISTINCT Order_ID) AS Orders_Placed
FROM Superstore
GROUP BY Customer_Name
ORDER BY Orders_Placed DESC
LIMIT 10;

-- 10. Cumulative Sales (Running Total)
SELECT 
  Order_Date,
  SUM(Sales) OVER (ORDER BY Order_Date) AS Running_Total_Sales
FROM Superstore;
