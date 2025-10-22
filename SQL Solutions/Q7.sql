-- 7. Return Analysis
-- Calculate the return rate per category or product, and spotlight items with the highest returns.

SELECT 
p.ProductName,
SUM(r.ReturnQuantity) AS Total_Returns,
SUM(s.OrderQuantity) AS Total_Sold,
ROUND(SUM(r.ReturnQuantity) / SUM(s.OrderQuantity) * 100, 2) AS Return_Rate_Percent
FROM returns r
JOIN products p ON r.ProductKey = p.ProductKey
JOIN sales s ON s.ProductKey = p.ProductKey
GROUP BY p.ProductName
ORDER BY Return_Rate_Percent DESC;



