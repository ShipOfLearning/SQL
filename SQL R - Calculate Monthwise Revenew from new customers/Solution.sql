/*=========================================================
  SHIP OF LEARNING (MS SQL Server)
  Topic: Calculate Monthwise Revenue from New Customers 
  Asked at: Microsoft 
==========================================================*/
SELECT * FROM Orders
;WITH CTE AS 
(
	SELECT
		CustomerID,CustomerName,OrderDate,Amount,
		ROW_NUMBER() OVER
		(
			PARTITION BY CUSTOMERID
			ORDER BY OrderDate, ORDERID
		) AS RN
	FROM Orders
)
SELECT
	FORMAT(OrderDate, 'yyyy-MM') AS MB,
	SUM(Amount) AS NCR,
	COUNT(*) AS CC
FROM CTE
WHERE RN = 1
GROUP BY FORMAT(OrderDate, 'yyyy-MM')