-- @ShipOfLearning
-- Product Name, Year & Price for Each Sale

SELECT * FROM Products
SELECT * FROM Sales

SELECT
	P.ProductName,YEAR(SaleDate) AS S_YEAR,
	P.Price
FROM Sales S
INNER JOIN Products P
ON S.ProductID = P.ProductID