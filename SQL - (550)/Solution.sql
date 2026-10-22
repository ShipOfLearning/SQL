--=============================================================
-- SHIP OF LEARNING
-- TOPIC : Game Play Analysis
--          Find the fraction of players who return to a gaming 
--          platform exactly one day after their first login.
--=============================================================
SELECT * FROM Activity

;WITH CTE AS
(
	SELECT
		player_id,MIN(event_date) AS FL
	FROM Activity
	GROUP BY 
		player_id
)
SELECT
	AVG(CASE WHEN A.player_id IS NULL THEN 0.0 ELSE 1.0 END) FRACTION
	--CAST(COUNT(*) AS decimal(10,2))/CAST((SELECT COUNT(*) FROM CTE) AS decimal(10,2))
	--C.*,A.*
FROM CTE C
LEFT JOIN Activity A
ON C.player_id = A.player_id AND 
	A.event_date = DATEADD(DAY,1,C.FL)