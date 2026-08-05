-- @ShipOfLearning
-- Self Join
-- Manager and Number of Direct Reporting
SELECT * FROM Employees


SELECT
	M.EmployeeName,
	COUNT(E.EMPLOYEEID) AS DIRECT_REPORTING_COUNT
FROM Employees AS M
JOIN Employees AS E
ON M.EmployeeID = E.ManagerID
GROUP BY M.EmployeeName