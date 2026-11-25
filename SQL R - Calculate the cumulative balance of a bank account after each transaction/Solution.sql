/*===============================================================
SHIP OF LEARNING
TOPIC: Cumulative Bank Account Balance After Every Transaction
===============================================================*/
SELECT * FROM Accounts
SELECT * FROM BankTransactions

SELECT
	A.AccountID,A.AccountHolder,B.TransactionID,B.TransactionDate,
	B.TransactionAmount,
	A.OpeningBalance + SUM(B.TransactionAmount ) OVER
	(
		PARTITION BY A.AccountID
		ORDER BY B.TransactionDate,B.TransactionID
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
	) CS
FROM Accounts A
JOIN BankTransactions B
ON A.AccountID = B.AccountID