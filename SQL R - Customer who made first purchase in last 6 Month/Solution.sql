-- @ShipOfLearning
-- Find Customers Whose FIRST Purchase Was in the Last 6 Months

SELECT * FROM orders
SELECT
	CustomerID,CustomerName,
	MIN(OrderDate) MIN_DATE
FROM orders
GROUP BY 
	CustomerID,CustomerName
HAVING
	MIN(OrderDate) >= DATEADD(MONTH,-6,GETDATE())

	PRINT GETDATE()
