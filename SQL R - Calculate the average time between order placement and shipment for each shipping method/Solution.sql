--=============================================================
--CHANNEL : SHIP OF LEARNING - AMAZON 
--TOPIC   : AVERAGE SHIPPING TIME BY SHIPPING METHOD
--=============================================================
SELECT * FROM Orders

SELECT
	ShippingMethod,
	AVG(
	DATEDIFF_BIG(MILLISECOND,OrderDate,ShipDate) / 60000.0)
	AS AST
FROM Orders
WHERE 
	ShipDate IS NOT NULL AND
	ShipDate > OrderDate
GROUP BY
	ShippingMethod