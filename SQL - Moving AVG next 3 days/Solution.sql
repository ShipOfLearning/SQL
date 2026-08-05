-- @ShipOfLearning
-- Moving AVG of 3 Days
SELECT * FROM DailySales

SELECT
	SaleDate,SaleAmount,
	AVG(SaleAmount)
	OVER (ORDER BY SaleDate
	ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MA
FROM DailySales
