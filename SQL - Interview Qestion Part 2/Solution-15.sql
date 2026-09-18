/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	15. You need to generate a series of consecutive dates between two given dates 
		without using a calendar table. Which SQL feature would you use? */

; WITH RCTE AS
(
	SELECT CAST('2026/01/01' AS date) AS DV
	UNION ALL
	SELECT 
		DATEADD(DAY,1,DV)
	FROM RCTE
	WHERE DV < '2026/01/20'
)

SELECT DV FROM RCTE
