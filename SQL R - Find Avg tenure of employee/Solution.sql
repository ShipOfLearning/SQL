-- @ShipOfLearning
-- Find Average Employee Tenure by Department

SELECT * FROM Employees
SELECT * FROM DEPARTMENTS

SELECT
	D.DepartmentName,
	ROUND(AVG(
	DATEDIFF(DAY,HireDate,ISNULL(TerminationDate,GETDATE())) / 365.0
	),2) AS AVG_T
FROM Employees E
INNER JOIN Departments D
ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentID,D.DepartmentName


--PRINT(2/3.0)