/*============================================================
CHANNEL : SHIP OF LEARNING
TOPIC   : MONTHLY ORDER CANCELLATION PERCENTAGE
============================================================*/
SELECT * FROM Orders

;WITH CTE AS (
SELECT
	DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) OM,
	SUM(CASE WHEN Status = 'Cancelled' THEN
		1
	ELSE	
		0
	END) COC, COUNT(*) TOC
FROM Orders
GROUP BY
	DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1))
SELECT
	*, 
	100 * COC / NULLIF(TOC,0) PER
FROM CTE