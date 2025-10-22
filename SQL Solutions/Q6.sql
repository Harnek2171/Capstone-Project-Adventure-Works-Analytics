-- 6. Profitability by Territory
-- Rank sales territories by profit margin percentage and highlight high-margin regions.

SELECT 
t.Country,
t.Region,
ROUND(SUM(p.ProductPrice * s.OrderQuantity),2) AS Total_Sales,
ROUND(SUM((p.ProductPrice - p.ProductCost) * s.OrderQuantity),2) AS Profit,
ROUND(SUM((p.ProductPrice - p.ProductCost) * s.OrderQuantity) / SUM(s.OrderQuantity * p.ProductPrice) * 100, 2) AS Profit_Margin_Perct
FROM sales s
JOIN territories t ON s.TerritoryKey = t.SalesTerritoryKey
JOIN products p ON s.ProductKey = p.ProductKey
GROUP BY t.Country, t.Region
ORDER BY Profit_Margin_Perct DESC;
