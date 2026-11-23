--============================================================
-- CHANNEL : SHIP OF LEARNING
-- TOPIC   : FIND SUPPLIERS WITH MORE THAN 20% LATE DELIVERIES
--============================================================
--SELECT * FROM Suppliers
--SELECT * FROM SupplierOrders
;WITH CTE AS(
SELECT
	S.SupplierID, S.SupplierName,
	COUNT(*) AS TOC,
	SUM(CASE WHEN ActualDeliveryDate > ExpectedDeliveryDate THEN
		1
	ELSE
		0
	END) LOC
FROM Suppliers S
LEFT JOIN SupplierOrders SO
ON S.SupplierID = SO.SupplierID
GROUP BY
	S.SupplierID, S.SupplierName)
SELECT
	SupplierID,SupplierName,LOC,TOC,
	LOC * 100 / NULLIF(TOC,0) PEC

FROM CTE
WHERE LOC * 100 / NULLIF(TOC,0) > 20
