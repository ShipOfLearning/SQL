--============================================================
-- SHIP OF LEARNING
-- TOPIC: Find the Top 3 Customers by Total Purchase Amount
--============================================================
SELECT * FROM CustomerOrders

SELECT TOP 3
	CustomerID,CustomerName,
	SUM(OrderAmount) TA
FROM CustomerOrders
WHERE OrderStatus = 'Completed'
GROUP BY 
	CustomerID,CustomerName
ORDER BY SUM(OrderAmount) DESC
	