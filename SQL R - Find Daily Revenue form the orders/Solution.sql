--========================================================
--Ship of Learning | Swiggy
--Topic: Find Daily Revenue from Orders
--========================================================
SELECT * FROM Orders

SELECT
	CAST(order_date AS DATE),SUM(AMOUNT) AS SUM_AMOUNT
FROM Orders
GROUP BY CAST(order_date AS DATE)