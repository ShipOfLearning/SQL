--======================================================
-- SHIP OF LEARNING
-- Company	: Uber-Style Interview Problem
-- Topic	: Calculate Trip Demand by Hour(Per day) and City
-- =====================================================
SELECT TripID,City,RequestTime,TripStatus FROM Trips

SELECT
	City,
	DATEADD(HOUR,DATEDIFF(HOUR,0,RequestTime),0) AS HB,
	--DATEPART(HOUR,RequestTime) AS HB,
	COUNT(*) AS CNT
FROM Trips
GROUP BY 
	City,
	--DATEPART(HOUR,RequestTime)
	DATEADD(HOUR,DATEDIFF(HOUR,0,RequestTime),0)
