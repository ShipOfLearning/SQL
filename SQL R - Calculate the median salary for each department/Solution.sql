/*============================================================
Ship of Learning
Topic   : Calculate Median Salary Per Department
Platform: Microsoft SQL Server 2022
============================================================*/
SELECT * FROM Departments
SELECT * FROM Employees

SELECT DISTINCT 
	--E.EmployeeID,EmployeeName,E.Salary,
	D.DepartmentID,D.DepartmentName,
	PERCENTILE_CONT(0.5)
		WITHIN GROUP (ORDER BY E.Salary)
		OVER (PARTITION BY D.DepartmentID) AS MS
FROM Employees E
JOIN Departments D
ON E.DepartmentID = D.DepartmentID