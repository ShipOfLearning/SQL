-- @ShipOfLearning
-- Employee Earning More Than Their Manager

SELECT * FROM Employees


SELECT
	E.EmpName,E.Salary,
	M.EmpName AS MANGER, M.Salary MANAGERSALARY
FROM Employees E
JOIN Employees M
ON E.ManagerID = M.EmpID
WHERE E.Salary > M.Salary