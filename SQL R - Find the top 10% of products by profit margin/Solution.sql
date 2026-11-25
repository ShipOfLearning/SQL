/*============================================================
CHANNEL: SHIP OF LEARNING
TOPIC  : FIND TOP 10% OF PRODUCTS BY PROFIT MARGIN
PROFIT : SELLING PRICE - UNIT COST
PROFIT MARGIN % : (PROFIT / SELLING PRICE) * 100
============================================================*/
SELECT * FROM Products

;WITH CTE AS(
SELECT
	ProductID,ProductName,UnitCost,SellingPrice,
	(SellingPrice - UnitCost) PROFIT,
	((SellingPrice - UnitCost) / NULLIF(SellingPrice,0)) * 100
	AS PM
FROM Products)

SELECT
	 TOP 10 PERCENT WITH TIES *
FROM CTE
ORDER BY PM DESC


