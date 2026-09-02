-- @ShipOfLearning
-- Find Customers with 5+ Consecutive Login Days

--SELECT * FROM CustomerLogins

;WITH DISTINCTLOGINS AS
(
	SELECT 
		DISTINCT CustomerID,CustomerName,LoginDate
	FROM CustomerLogins
	WHERE LoginDate IS NOT NULL
),
RANKEDLOGIN AS
(
	SELECT
		CustomerID,CustomerName,LoginDate,
		ROW_NUMBER() OVER
		(
			PARTITION BY CUSTOMERID
			ORDER BY LOGINDATE
		) AS RN
	FROM DISTINCTLOGINS
),
DIFFLOGIN AS
(
	SELECT 
		CustomerID,CustomerName,LoginDate,
		DATEADD(DAY,-RN,LoginDate) AS DIFF
	FROM RANKEDLOGIN
)
SELECT
	CustomerID,CustomerName,
	MIN(LoginDate) AS STARTDATE,
	MAX(LoginDate) AS ENDDATE,
	COUNT(*) AS LOGINCOUNT
FROM DIFFLOGIN
GROUP BY CustomerID,CustomerName,DIFF
HAVING COUNT(*) >= 5