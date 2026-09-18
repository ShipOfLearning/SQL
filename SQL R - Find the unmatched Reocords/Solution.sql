--========================================================
--Ship of Learning |
--Topic: Find Unmatched Rows Between Employee & Department 
--========================================================
SELECT * FROM Employee
SELECT * FROM Department

SELECT
	E.EmployeeName,D.DepartmentName
FROM Employee E
FULL OUTER JOIN Department D
ON E.DepartmentID = D.DepartmentID
WHERE
	E.EmployeeID IS NULL
	OR
	D.DepartmentID IS NULL