-- @ShipOfLearning
-- Find Best Selling Products by Quantity and Rank it


--SELECT * FROM Products
--SELECT * FROM Sales

SELECT
	P.ProductName,
	SUM(S.Quantity) AS TOTAL,
	DENSE_RANK() OVER (ORDER BY SUM(S.Quantity) DESC) AS RN
FROM Sales S
INNER JOIN Products P
ON S.ProductID = P.ProductID
GROUP BY P.ProductName