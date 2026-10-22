--=========================================================
-- SHIP OF LEARNING
-- Topic : Find Average Order Value (AOV)
-- AOV = Completed Order Revenue / Completed Order Count
--=========================================================
SELECT * FROM Orders

SELECT
	CAST(AVG(OrderAmount) AS decimal(10,2)) AS AOV
FROM Orders
WHERE OrderStatus = 'Completed'