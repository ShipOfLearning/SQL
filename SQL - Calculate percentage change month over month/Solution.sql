-- ShipOfLearning
-- Calculate Percentage Change in Sales Month-over-Month
-- Formula MoM sale = ((CMS - PMS) / PMS)) * 100

SELECT *  FROM MonthlySales

;WITH CTE AS 
(
	SELECT
		SalesID,SalesMonth,TotalSales,
		LAG(TotalSales) OVER
		(
			ORDER BY SalesMonth
		) AS PRE_SALE
	FROM MonthlySales
)
SELECT
	SalesID,SalesMonth,TotalSales,PRE_SALE,
	((TotalSales - PRE_SALE)/NULLIF(PRE_SALE,0)) * 100
FROM CTE