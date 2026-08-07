-- @ShipOfLearning
-- Find the customer who made multiple purchase
--	but never retrun a single product

--SELECT * FROM Customers
--SELECT * FROM Orders
--SELECT * FROM Returns

SELECT 
	C.CustomerID, C.CustomerName,
	COUNT(DISTINCT O.OrderID) TOTAL_ORDER,
	COUNT(DISTINCT R.OrderID) TOTAL_RETURNS
FROM Customers C
INNER JOIN Orders O
ON C.CustomerID = O.CustomerID
LEFT JOIN Returns R
ON O.OrderID = R.OrderID
GROUP BY C.CustomerID, C.CustomerName
HAVING COUNT(DISTINCT R.OrderID) = 0
