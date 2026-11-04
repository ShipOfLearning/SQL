--============================================================
--  SHIP OF LEARNING
--  TOPIC: Find Products Whose Product Codes Contain 
--            Characters Only Numeric
--============================================================
--SELECT * FROM dbo.Products

SELECT
	*
FROM Products
WHERE
	DATALENGTH(ProductCode) > 0 AND
	ProductCode COLLATE Latin1_General_100_BIN2 NOT LIKE '%[^0-9]%'