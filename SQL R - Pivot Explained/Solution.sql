-- @ShipOfLearning
-- Explain PIVOT

SELECT * FROM Sales

SELECT PRODUCTNAME,[Q1],[Q2],[Q3],[Q4]
FROM
(
SELECT 
	ProductName,Quarter,Amount
FROM Sales
) AS ST
PIVOT
(
	SUM(Amount)
	FOR Quarter IN ([Q1],[Q2],[Q3],[Q4])
) AS PT
ORDER BY ProductName