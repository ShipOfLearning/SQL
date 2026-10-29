--===============================================================
--CHANNEL : SHIP OF LEARNING
--TOPIC   : Find Customers Who Made Purchases on Three
--          Consecutive Calendar Days 
--===============================================================
--SELECT * FROM PurchaseTransactions

;WITH CTE AS(
SELECT
	DISTINCT
	CustomerID,CustomerName,
	CAST(PurchaseDate AS DATE) PurchaseDate
FROM PurchaseTransactions),
PS AS
(
	SELECT
		CustomerID,CustomerName,PurchaseDate,
		LEAD(PurchaseDate,2) OVER
		(
			PARTITION BY CustomerID
			ORDER BY PurchaseDate
		) TSD
	FROM CTE
)
SELECT * FROM PS
WHERE DATEADD(DAY,2,PurchaseDate) = TSD



