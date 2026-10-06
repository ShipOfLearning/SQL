--==========================================================
-- SHIP OF LEARNING : Microsoft
-- TOPIC : Find All Employees With the Same Salary
--==========================================================
SELECT * FROM Employees

;WITH CTE AS
(
SELECT
	EmployeeID,EmployeeName,Salary,
	COUNT(*) OVER
	(
	 PARTITION BY SALARY
	) SC
FROM Employees
WHERE Salary IS NOT NULL
)
SELECT
	EmployeeID,EmployeeName,Salary
FROM CTE
WHERE SC > 1
ORDER BY Salary