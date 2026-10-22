--============================================================
--  SHIP OF LEARNING : Amazon
--  TOPIC: Find Departments Having More Than 3 Employees
--============================================================
SELECT * FROM dbo.Employees;
SELECT * FROM dbo.Departments;

SELECT
	D.DepartmentID,D.DepartmentName,
	COUNT(*) AS EMP_CNT
FROM Employees E
JOIN Departments D
ON E.DepartmentID = D.DepartmentID
GROUP BY 
	D.DepartmentID,D.DepartmentName
HAVING 
	COUNT(*) > 3