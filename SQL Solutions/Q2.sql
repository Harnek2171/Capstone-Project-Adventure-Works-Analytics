-- 2. Category Performance
-- Rank product categories by total sales and compare margins across categories.


select * from product_categories;

SELECT 
pc.CategoryName,
ROUND(SUM(s.OrderQuantity * p.ProductPrice),2) AS Total_Sales,
ROUND(SUM((p.ProductPrice - p.ProductCost) * s.OrderQuantity),2) AS Total_Profit,
ROUND(SUM((p.ProductPrice - P.ProductCost) * s.OrderQuantity) / 
	  SUM(s.OrderQuantity * p.ProductPrice) * 100, 2) AS Profit_Marign_Percent    
FROM sales s
JOIN products p ON s.ProductKey = p.ProductKey
JOIN product_subcategories ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN product_categories pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY pc.CategoryName
ORDER BY Total_Sales DESC


 
