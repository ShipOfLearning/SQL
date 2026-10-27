--============================================================
-- CHANNEL  : SHIP OF LEARNING - Microsoft 
-- TOPIC    : Calculate Current vs Previous Salary Difference
--============================================================
SELECT * FROM EmployeeSalaryHistory

;WITH CTE AS (
SELECT
	EmployeeID,EmployeeName,Salary AS CS,
	LAG(Salary) OVER
	(
		PARTITION BY EmployeeID
		ORDER BY SALARYDATE
	) PS
FROM EmployeeSalaryHistory)
SELECT
	*,
	(CS - PS) AS DIFF
FROM CTE