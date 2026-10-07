/*=========================================================
  SHIP OF LEARNING : GOOGLE
  Topic: Find Daily Active Users (DAU) by Country 
=========================================================*/
SELECT * FROM UserActivity

SELECT
	Country,
		CAST(ActivityTime AS DATE),
		COUNT(DISTINCT UserID) AS DAU
FROM UserActivity
GROUP BY Country,
		CAST(ActivityTime AS DATE)
ORDER BY Country
