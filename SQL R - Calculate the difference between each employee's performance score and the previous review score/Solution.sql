--============================================================
--CHANNEL       : SHIP OF LEARNING - Google 
--TOPIC         : Calculate Difference Between Current and
--                Previous Employee Performance Scores
--============================================================
SELECT * FROM EmployeeReviews

;WITH CTE AS(
SELECT
	ReviewID,EmployeeID,EmployeeName,
	ReviewDate,PerformanceScore CS,
	LAG(PerformanceScore) OVER
	(
		PARTITION BY EmployeeID
		ORDER BY ReviewDate, ReviewID
	) PS
FROM EmployeeReviews)
SELECT
	*, (CS-PS) DIFF
FROM CTE