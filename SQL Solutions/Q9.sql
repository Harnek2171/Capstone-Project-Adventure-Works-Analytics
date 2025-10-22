-- 9. New vs. Returning Customers
-- Determine revenue contribution from new customers versus repeat purchasers and assess changes over time.

WITH First_Purchase AS(
	SELECT
	CustomerKey,
	MIN(OrderDate) AS First_Order_Date
	FROM sales
	GROUP BY CustomerKey
) 
SELECT
	CASE 
		WHEN s.OrderDate = fp.First_Order_Date THEN 'New Customer'
        ELSE 'Returning Customer'
	END AS Customer_Type,
    ROUND(SUM(s.OrderQuantity * p.ProductPrice),2) AS Total_Revenue
FROM sales s
JOIN products p ON s.ProductKey = p.ProductKey
JOIN First_Purchase fp ON s.CustomerKey = fp.CustomerKey
GROUP BY Customer_Type;


