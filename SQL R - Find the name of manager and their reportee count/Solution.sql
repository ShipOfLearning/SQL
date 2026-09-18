-- ================================
-- Ship of Learning
-- Topic: Manager & Reportee Count
-- Asked in: Google SQL Interview
-- ================================
SELECT * FROM Employees

SELECT
	M.EmployeeID,M.EmployeeName,
	COUNT(E.EmployeeID) AS EC
FROM Employees M
LEFT JOIN Employees E
ON E.ManagerID = M.EmployeeID
GROUP BY 
	M.EmployeeID,M.EmployeeName
HAVING
	COUNT(E.EmployeeID) >0