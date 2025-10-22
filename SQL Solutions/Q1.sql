-- 1. Annual Revenue Trends
-- Analyze year-over-year revenue growth and identify peak performing years.

# Method - 01

SELECT 
YEAR(s.OrderDate) AS Sales_Year,
SUM(OrderQuantity * p.ProductPrice) AS Total_Revenue,
LAG(SUM(OrderQuantity * p.ProductPrice)) OVER(ORDER BY YEAR(s.OrderDate)) AS Prev_Year_Rev,
ROUND((SUM(OrderQuantity * p.ProductPrice) - LAG(SUM(OrderQuantity * p.ProductPrice))  
OVER(ORDER BY YEAR(s.OrderDate))) / LAG(SUM(OrderQuantity * p.ProductPrice)) 
OVER (ORDER BY YEAR(OrderDate)) * 100, 2) AS YoY_Growth_Percent
FROM sales s
JOIN products p 
ON s.ProductKey = p.ProductKey
GROUP BY YEAR(OrderDate)
ORDER BY Sales_Year;


# Method - 02

WITH A AS(
	SELECT YEAR(OrderDate) AS Years,
	ROUND(SUM(s.OrderQuantity * p.ProductPrice),2) AS Curr_Year
	FROM sales s
	JOIN products p
	ON s.ProductKey = p.ProductKey
	GROUP BY YEAR(OrderDate)),
    
B AS 
(SELECT *,
LAG(Curr_Year, 1) OVER(ORDER BY Years) AS Prev_Year FROM A)

SELECT *, ROUND(((Curr_Year - Prev_Year) / Prev_Year) * 100, 2) AS YOY_Growth FROM B
