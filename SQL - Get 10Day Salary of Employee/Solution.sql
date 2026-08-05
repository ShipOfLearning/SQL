-- @ShipOfLearning
-- Get 10 Days Salary of Employee

SELECT * FROM Employees

SELECT 
	EmployeeName,Department,MonthlySalary,
	ROUND((MonthlySalary / 30) * 10,2) AS PER_DAY_SALARY
FROM Employees
