--================================================================
-- CHANNEL : Ship of Learning - AMAZON
-- TOPIC   : Find First and Last Transaction for Every Customer
--================================================================
SELECT * FROM Transactions
;WITH CTE AS (
SELECT
	*,
	ROW_NUMBER() OVER
	(
		PARTITION BY CUSTOMERID
		ORDER BY TRANSACTIONDATE
	) AS FT,
	ROW_NUMBER() OVER
	(
		PARTITION BY CUSTOMERID
		ORDER BY TRANSACTIONDATE DESC
	) AS LT
FROM Transactions)

SELECT
	*
FROM CTE
WHERE FT = 1 OR LT = 1