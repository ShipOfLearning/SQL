-- @ShipOfLearning
-- Find Product Never sold
--SELECT * FROM Products
--SELECT * FROM Sales

SELECT
	P.ProductID,P.ProductName,P.Price
FROM Products P
WHERE NOT EXISTS
(
	SELECT 1
	FROM Sales S
	WHERE S.ProductID = P.ProductID
)