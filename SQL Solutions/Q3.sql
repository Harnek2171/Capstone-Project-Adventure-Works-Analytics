-- 3. Top & Underperforming Products
-- Identify the best- and worst-selling products in terms of quantity sold and revenue generation.


select * from products;
select * from sales;

# Best Selling Product

SELECT 
p.ProductName,
SUM(s.OrderQuantity) AS Total_Units_Sold,
ROUND(SUM(s.OrderQuantity * p.ProductPrice),2) AS Total_Revenue
FROM Sales s
JOIN products p ON s.ProductKey = p.ProductKey
GROUP BY p.ProductName
ORDER BY Total_Units_Sold DESC
LIMIT 10;

# Worst Selling Product

SELECT 
p.ProductName,
SUM(s.OrderQuantity) AS Total_Units_Sold,
ROUND(SUM(s.OrderQuantity * p.ProductPrice),2) AS Total_Revenue
FROM Sales s
JOIN products p ON s.ProductKey = p.ProductKey
GROUP BY p.ProductName
ORDER BY Total_Revenue DESC
LIMIT 10;
