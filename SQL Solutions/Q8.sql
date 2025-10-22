-- 8. Sales Seasonality
-- Detect monthly or quarterly sales peaks and troughs—identify key seasonal patterns.


 SELECT
 YEAR(OrderDate) AS Year,
 QUARTER(OrderDate) As Qtr,
 MONTH(OrderDate) AS Month,
 ROUND(SUM(s.OrderQuantity * p.ProductPrice),2) AS Total_Revenue,
 ROUND(SUM(SUM(s.OrderQuantity * p.ProductPrice)) 
	OVER(PARTITION BY YEAR(OrderDate), QUARTER(OrderDate) 
		 ORDER BY MONTH(OrderDate)), 2) AS Running_Total
 FROM sales s
 JOIN products p ON s.ProductKey = p.ProductKey
 GROUP BY YEAR(OrderDate), QUARTER(OrderDate), MONTH(OrderDate)
 ORDER BY Year, Qtr, Month DESC;
 
 
