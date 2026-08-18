-- @ShipOfLarning
-- Average Order Value Per Customer
--	Only Customers with >7 Orders

SELECT TOP 10 * FROM Orders

SELECT
	CustomerID,CustomerName,
	COUNT(ORDERID) ORDERCOUNT,
	ROUND(AVG(OrderAmount),2) AVGAMT
FROM Orders
GROUP BY CustomerID,CustomerName
HAVING COUNT(ORDERID) > 7