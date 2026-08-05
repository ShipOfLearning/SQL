-- @ShipOfLearning
-- Get top 3 Salary of Employee

SELECT * FROM Employees

;WITH EMP_SALARY  AS (
SELECT 
	EmpName,Department,Salary,
	DENSE_RANK() OVER (ORDER BY SALARY DESC) AS SALARY_RANK
FROM Employees)
SELECT
	*
FROM EMP_SALARY
WHERE SALARY_RANK < 4