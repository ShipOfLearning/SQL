--============================================================
--CHANNEL : Ship of Learning - Amazon
--TOPIC   : First & Last Day Promotion Sales Percentage
--============================================================
--SELECT * FROM Promotions
--SELECT * FROM Sales
;WITH CTE AS (
SELECT
	P.PromotionID,P.PromotionName,P.StartDate,P.EndDate,
	SUM(S.SalesAmount) TO_S,
	SUM(
		CASE WHEN S.SaleDate = P.StartDate OR
			S.SaleDate = P.EndDate THEN
			S.SalesAmount
		ELSE
			0
		END
	) FLDS
FROM Promotions P
LEFT JOIN Sales S
ON P.PromotionID = S.PromotionID
 AND S.SaleDate >= P.StartDate AND
	S.SaleDate <= P.EndDate
GROUP BY
	P.PromotionID,P.PromotionName,P.StartDate,P.EndDate)
SELECT
	*,
	100 * FLDS / NULLIF(TO_S,0) PERCE
FROM CTE
