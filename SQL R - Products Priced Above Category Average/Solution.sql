-- @ShipOfLearning
-- Products Priced Above Category Average

SELECT * FROM Products

;WITH CTE AS (
SELECT
	ProductID,ProductName,Price,
	AVG(PRICE) OVER (PARTITION BY CATEGORYID) AVGPRICE
FROM Products
)
SELECT 
	ProductID,ProductName,Price,AVGPRICE
FROM CTE WHERE Price > AVGPRICE