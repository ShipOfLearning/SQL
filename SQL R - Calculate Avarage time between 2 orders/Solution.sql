/* =====================================================
SHIP OF LEARNING — Zomato SQL Interview Question
Topic  : Average Time Between 2 Orders
======================================================*/
SELECT * FROM Orders

;WITH CTE AS
(
	SELECT
		OrderID,CustomerID,CustomerName,OrderDate,
		LAG(OrderDate) OVER
		(
			PARTITION BY CUSTOMERID
			ORDER BY OrderDate
		) AS PRE_ORDERDATE
	FROM Orders
)
SELECT
	CustomerID,CustomerName,
	AVG(DATEDIFF(HOUR,PRE_ORDERDATE,OrderDate)) DH
FROM CTE
WHERE PRE_ORDERDATE IS NOT NULL
GROUP BY CustomerID,CustomerName