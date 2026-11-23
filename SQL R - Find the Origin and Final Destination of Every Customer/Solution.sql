--============================================================
-- CHANNEL : SHIP OF LEARNING
-- TOPIC   : FIND ORIGIN AND FINAL DESTINATION OF EVERY CUSTOMER
-- DATABASE: MICROSOFT SQL SERVER
--============================================================
SELECT * FROM Flights

;WITH CTE_ORIGN AS
(
	SELECT
		F1.cust_id,F1.origin
	FROM Flights F1
	WHERE NOT EXISTS
	(
		SELECT
		1
		FROM Flights F2
		WHERE 
		F2.cust_id = F1.cust_id AND
		F2.destination = F1.origin
	)
),
CTE_DESTINATION AS 
(
	SELECT
		F1.cust_id,F1.destination
	FROM Flights F1
	WHERE NOT EXISTS
	(
		SELECT
		1
		FROM Flights F2
		WHERE 
		F2.cust_id = F1.cust_id AND
		F2.destination = F1.origin
	)
)
SELECT
	*
FROM CTE_ORIGN O
JOIN CTE_DESTINATION D
ON O.cust_id = D.cust_id