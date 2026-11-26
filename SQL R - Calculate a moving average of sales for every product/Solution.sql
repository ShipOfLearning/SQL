/*=============================================================
--SHIP OF LEARNING
--TOPIC: CALCULATE A MOVING AVERAGE OF SALES FOR EVERY PRODUCT
=============================================================*/
SELECT * FROM Sales

SELECT 
	SaleID,ProductID,SaleDate,SalesAmount,
	AVG(SalesAmount) OVER
	(
		PARTITION BY ProductID
		ORDER BY SaleDate,SaleID
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
	) MA
FROM Sales
ORDER BY ProductID