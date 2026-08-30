-- @ShipOfLearning
-- Find 3-Month Probation End Date from Hire Date

SELECT * FROM Employees

SELECT
	EmployeeID,EmployeeName,HireDate,
	DATEADD(MONTH,3,HireDate) AS PED
FROM Employees