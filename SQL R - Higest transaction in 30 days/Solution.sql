-- @ShipOfLearning
-- Find Highest Transaction Amount Per 
--	Customer in Last 30 Days

SELECT * FROM Transactions	

;WITH CTE AS(
SELECT 
	TransactionID,TransactionAmount,CustomerID,TransactionDate,
	ROW_NUMBER() OVER (PARTITION BY CustomerID
	ORDER BY TransactionAmount DESC,TransactionDate) AS RN
FROM Transactions
WHERE TransactionDate BETWEEN DATEADD(DAY,-30,GETDATE()) AND GETDATE()
)

SELECT * FROM CTE WHERE RN = 1