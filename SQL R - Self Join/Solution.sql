SELECT * FROM Employees

SELECT E.EmployeeName,M.EmployeeName
FROM Employees AS E
LEFT JOIN Employees AS M
ON E.ManagerID = M.EmployeeID