--============================================================
-- CHANNEL	: Ship of Learning - Amazon
-- TOPIC	: Rank Employees by Salary Within Each Department
--============================================================
SELECT * FROM Employees

SELECT
	*,
	RANK() OVER
	(
		PARTITION BY DEPARTMENTID
		ORDER BY SALARY DESC
	) RN
FROM Employees