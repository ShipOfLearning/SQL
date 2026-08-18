-- @ShipOfLearning
-- Difference Between Employee Salary and 
--	Highest Salary in Their Department

SELECT * FROM Employees

SELECT
	EmpName,Department,Salary,
	MAX(Salary) OVER (PARTITION BY DEPARTMENT) AS MAXSALARY,
	MAX(Salary) OVER (PARTITION BY DEPARTMENT) - Salary DIFF
FROM Employees