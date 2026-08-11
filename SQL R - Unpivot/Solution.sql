--@ShipOfLearning
-- Unpivot data

SELECT * FROM SalesData

SELECT
	ProductName,SALES,QUATER
FROM SalesData
UNPIVOT
(
	SALES FOR QUATER IN (Q1,Q2,Q3,Q4)
) AS UP
ORDER BY ProductName

SELECT
    ProductName,QUATER,SALES
FROM SalesData
CROSS APPLY
(
	VALUES
	('Q1', Q1),
    ('Q2', Q2),
    ('Q3', Q3),   
    ('Q4', Q4)
) AS UP (QUATER,SALES)
ORDER BY ProductName,QUATER