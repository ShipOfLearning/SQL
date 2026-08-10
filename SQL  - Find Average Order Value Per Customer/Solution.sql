-- @ShipOfLearning
-- Find Average Order Value Per Customer

SELECT * FROM orders

SELECT 
	CustomerID, CustomerName,AVG(OrderAmount) AVG_ORDER
FROM Orders
GROUP BY CustomerName,CustomerID