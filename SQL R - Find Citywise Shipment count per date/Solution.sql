-- @ShipOfLearning (AMAZON Interview Question)
-- Citywise Shipment Count Per Date
-- Show	Cities as Columns

SELECT * FROM Shipments

SELECT ShipmentDate,Ahmedabad,Delhi,Mumbai,Pune,Surat
FROM
(
	SELECT
		ShipmentDate,City
	FROM Shipments
) AS SHIP
PIVOT
(
	COUNT(CITY)
	FOR CITY IN (Ahmedabad,Delhi,Mumbai,Pune,Surat)
) AS PT