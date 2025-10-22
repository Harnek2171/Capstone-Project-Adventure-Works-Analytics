-- 5. Geographic Sales Leadership
-- Identify top countries and regions by total sales and average order size.

SELECT
t.Continent, 
t.Country,
t.Region,
ROUND(SUM(p.ProductPrice * s.OrderQuantity),2) AS Total_Sales,
ROUND(AVG(p.ProductPrice * s.OrderQuantity),2) AS Avg_Order_Value
FROM sales s
JOIN territories t ON s.TerritoryKey = t.SalesTerritoryKey
JOIN products p ON s.ProductKey = p.ProductKey
GROUP BY t.Continent, t.Country, t.Region
ORDER BY Total_Sales DESC;



