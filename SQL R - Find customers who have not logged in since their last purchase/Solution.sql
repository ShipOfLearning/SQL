--============================================================
--CHANNEL : SHIP OF LEARNING - AMAZON
--TOPIC   : FIND CUSTOMERS WHO HAVE NOT LOGGED IN
--          SINCE THEIR LAST PURCHASE
--============================================================
SELECT * FROM LoginActivity
SELECT * FROM Purchases

;WITH CTE AS(
SELECT
	CustomerID,
	MAX(PurchaseDate) PD
FROM Purchases
GROUP BY 
	CustomerID)

SELECT
	*
FROM CTE C
WHERE NOT EXISTS
(
	SELECT 
		1
	FROM LoginActivity L
	WHERE 
		L.CustomerID = C.CustomerID AND
		LoginDate > PD
)