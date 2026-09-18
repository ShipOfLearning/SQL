/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	13. You want to build a PIVOT where the category names aren't known in advance and can change. 
		Which approach would you use? */
SELECT * FROM Orders 
SELECT * FROM Products 
SELECT * FROM Categories 

DECLARE @PC AS NVARCHAR(MAX),
@SQL AS NVARCHAR(MAX)

SELECT 
	@PC = STRING_AGG(QUOTENAME( CategoryName),',')
FROM Categories

--PRINT @PC

SET @SQL = N'
SELECT * FROM 
(
	SELECT
		C.CategoryName, O.Quantity * O.Price AS TS
	FROM Orders O
	JOIN Products P
	ON O.ProductID = P.ProductID
	JOIN Categories C
	ON C.CategoryID = P.CategoryID
) AS ST
PIVOT
(
	SUM(TS)
	FOR CategoryName IN (' +  @PC +')
) AS PT'

EXEC SP_EXECUTESQL @SQL

--PRINT @SQL