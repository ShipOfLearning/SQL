-- =========================================================
-- SHIP OF LEARNING | TCS SQL Interview Question
-- Topic: Find MIN and MAX Order Value with Full Order Details
-- Environment: MS SQL Server (T-SQL)
-- =========================================================
SELECT * FROM Orders

SELECT
	OrderID,CustomerID,CustomerName,OrderDate,
	OrderValue AS OVALUE
FROM Orders
WHERE OrderValue = 
	(
		SELECT MAX(OrderValue) FROM Orders
	)
UNION ALL
SELECT
	OrderID,CustomerID,CustomerName,OrderDate,
	OrderValue AS OVALUE
FROM Orders
WHERE OrderValue = 
	(
		SELECT MIN(OrderValue) FROM Orders
	)