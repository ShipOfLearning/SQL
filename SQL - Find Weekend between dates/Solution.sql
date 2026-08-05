-- @ShipOfLearning
-- Find weekend from two days

SELECT * FROM ProjectSchedule

;WITH NEWSERIES  AS (
	SELECT
		ProjectName,StartDate,EndDate,
		StartDate AS CURR_DATE
	FROM ProjectSchedule
	UNION ALL
	SELECT
		ProjectName,StartDate,EndDate,
		DATEADD(DAY,1,CURR_DATE) 
	FROM NEWSERIES
	WHERE CURR_DATE < EndDate
)

SELECT 
	ProjectName,StartDate,EndDate,
	COUNT(CASE WHEN DATEPART(WEEKDAY,CURR_DATE) IN (1,7) THEN 1 END)
	AS WEEK_ENDS
FROM NEWSERIES
GROUP BY ProjectName,StartDate,EndDate
ORDER BY ProjectName