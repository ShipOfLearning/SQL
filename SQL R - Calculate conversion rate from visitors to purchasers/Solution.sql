--============================================================
--  CHANNEL  : Ship of Learning
--  TOPIC    : Calculate Conversion Rate 
--  Conversion Rate (%) =
--  Unique Converted Visitors / Total Unique Visitors * 100
--============================================================
SELECT * FROM Visitors
SELECT * FROM Purchases

; WITH VISITOR AS
(
SELECT
	DISTINCT VisitorID
FROM Visitors),
PUR AS
(
SELECT
	DISTINCT VisitorID
FROM Purchases
WHERE 
Status = 'Completed')

SELECT
	COUNT(P.VisitorID) UCV,
	COUNT(V.VisitorID) TUV,
	COUNT(P.VisitorID) * 100 /
		CAST(COUNT(V.VisitorID) AS decimal(5,2)) AS CR
FROM VISITOR V
LEFT JOIN PUR P
ON V.VisitorID = P.VisitorID