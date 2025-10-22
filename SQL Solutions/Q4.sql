-- 4. Customer Segmentation by Spend
-- Segment customers based on their total lifetime spend (e.g., low, mid, high) and determine their share of total revenue.

WITH Customer_Spent AS (
SELECT 
c.CustomerKey,
c.FirstName,
c.LastName,
ROUND(SUM(s.OrderQuantity * p.ProductPrice),2) AS Total_Spend
FROM customers c
JOIN sales s ON c.CustomerKey = s.CustomerKey
JOIN products p ON s.ProductKey = p.Productkey
GROUP BY c.CustomerKey, c.FirstName, c.LastName
)
SELECT 
Customerkey,
FirstName,
LastName,
Total_Spend,
CASE
	WHEN Total_Spend < 1000 THEN 'Low Spend'
    WHEN Total_SPend BETWEEN 1000 AND 5000 THEN 'Mid Spend'
    ELSE 'High Spend'
END AS Spend_Class
FROM Customer_Spent
ORDER BY Total_Spend DESC
