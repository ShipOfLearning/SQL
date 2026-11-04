--============================================================
--CHANNEL : SHIP OF LEARNING - META
--TOPIC   : FIND THE BUSIEST HOUR OF THE DAY
--============================================================
SELECT * FROM Transactions

SELECT
	TOP 1 WITH TIES 
	DATEPART(HOUR,TransactionDate) BH,
	COUNT(*) TC
FROM Transactions
GROUP BY
	DATEPART(HOUR,TransactionDate)
ORDER BY 
	TC DESC