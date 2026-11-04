/*===========================================================
  CHANNEL : SHIP OF LEARNING
  TOPIC   : CALCULATE LATE INVOICE PAYMENT PERCENTAGE
===========================================================*/
SELECT * FROM Invoices

;WITH CTE AS(
SELECT
	COUNT(PaymentDate) TIP,
	SUM(CASE WHEN PaymentDate > DueDate THEN 
		1
	ELSE	
		0
	END) LPID
FROM Invoices)
SELECT
	TIP,LPID,
	CAST(LPID * 100.0 / NULLIF(TIP,0) AS decimal(6,2)) PER
FROM CTE