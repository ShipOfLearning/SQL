--===========================================================
--SHIP OF LEARNING
--Topic: Find Least Expensive Product in Each Category
--===========================================================
SELECT * FROM Products

;WITH CTE AS
(
SELECT
	ProductName,Category,Price,
	RANK() OVER
	(
		PARTITION BY Category
		ORDER BY Price
	) RN
FROM Products
)
SELECT
	ProductName,Category,ISNULL(Price,0) Price
FROM CTE WHERE RN = 1