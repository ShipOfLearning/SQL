--============================================================
--  SHIP OF LEARNING
--  TOPIC: Find the Percentage of Orders With a Valid Promotion
--  Valid Promotion Percentage =
--      (Valid Promotion Orders / Total Orders) * 100
--============================================================
SELECT * FROM dbo.Orders
SELECT * FROM dbo.Promotions

SELECT
	COUNT(P.PromoCode) VPO,
	COUNT(*)  TOC,
	(CAST(COUNT(P.PromoCode) AS FLOAT) /
	CAST(COUNT(*)			AS FLOAT)) * 100 AS VPP

FROM Orders O
LEFT JOIN Promotions P
ON O.PromoCode = P.PromoCode
	AND P.IsActive = 1
	AND O.OrderDate BETWEEN P.StartDate AND P.EndDate

