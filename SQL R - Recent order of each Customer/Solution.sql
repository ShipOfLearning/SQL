-- @ShipOfLearning
-- Get Latest Order Placed by Each Customer

SELECT * FROM Customers
SELECT * FROM Orders
;WITH CTE AS(
	SELECT
		C.CustomerName,O.OrderDate,
		O.Amount,
		ROW_NUMBER() OVER
		(
			PARTITION BY C.CUSTOMERID
			ORDER BY O.ORDERDATE DESC,
				O.ORDERID DESC
		) AS RN
	FROM Orders O
	INNER JOIN Customers C
	ON O.CustomerID = C.CustomerID)
SELECT * FROM CTE WHERE RN = 1