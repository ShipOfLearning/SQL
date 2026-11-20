--=============================================================
--CHANNEL : SHIP OF LEARNING
--TOPIC   : CALCULATE OUTSTANDING BALANCE FOR EVERY CUSTOMER
--BUSINESS RULE:
--     Outstanding Balance = Total Invoices - Total Payments
--=============================================================
SELECT * FROM Customers
SELECT * FROM CustomerTransactions

SELECT
	C.CustomerID,C.CustomerName,
	SUM(
		CASE WHEN CT.TransactionType = 'Invoice' THEN
			CT.Amount
		ELSE	
			0
		END
	) IA,
	SUM(
		CASE WHEN CT.TransactionType = 'Payment' THEN
			CT.Amount
		ELSE	
			0
		END
	) PA,
	SUM(
		CASE WHEN CT.TransactionType = 'Payment' THEN
			-CT.Amount
		ELSE	
			CT.Amount
		END
	) DIFF
FROM Customers C
LEFT JOIN CustomerTransactions CT
ON C.CustomerID = CT.CustomerID
GROUP BY
	C.CustomerID,C.CustomerName
