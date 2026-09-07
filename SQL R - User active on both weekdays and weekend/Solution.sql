-- @ShipOfLearning
-- User active on both weekdays and weekend
-- FORMULA : DATEDIFF(DAY,0,ActivityDate) % 7 

SELECT * FROM UserActivity

SELECT
	UserID,MAX(UserName) AS USERNAME
FROM UserActivity
GROUP BY USERID
HAVING
	SUM(CASE WHEN DATEDIFF(DAY,0,ActivityDate) % 7 IN (5,6) THEN 1
	ELSE 0 END) > 0 AND
	SUM(CASE WHEN DATEDIFF(DAY,0,ActivityDate) % 7 NOT IN (5,6) THEN 1
	ELSE 0 END) > 0