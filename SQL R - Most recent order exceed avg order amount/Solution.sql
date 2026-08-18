-- @ShipOfLearning
-- Find Customer Whose Most Recent Order Amount 
--		Exceeds Their Average Order Amount

SELECT * FROM Orders

;WITH CTE AS(
SELECT 
	OrderID,CustomerID,OrderDate,OrderAmount,
	AVG(OrderAmount) OVER
	(
		PARTITION BY CustomerID
	) AS AVGAMT,
	ROW_NUMBER() OVER
	(
		PARTITION BY CustomerID ORDER BY
		OrderDate DESC,OrderID DESC
	) AS RN
FROM Orders)
SELECT * FROM CTE
WHERE RN = 1 AND OrderAmount > AVGAMT