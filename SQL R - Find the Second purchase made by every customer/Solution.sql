--=============================================================
-- Channel : Ship of Learning - Amazon 
-- Topic   : Find the Second Purchase Made by Every Customer
--=============================================================
SELECT * FROM Purchases

;WITH CTE AS (
SELECT
	PurchaseID,CustomerID,PurchaseDate,Amount,
	ROW_NUMBER() OVER 
	(
		PARTITION BY CustomerID
		ORDER BY PurchaseDate, PurchaseID
	) AS RN
FROM Purchases)
SELECT * FROM CTE WHERE RN  = 2
