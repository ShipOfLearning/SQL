/*============================================================
CHANNEL      : SHIP OF LEARNING
TOPIC        : COMPARE TWO TABLES AND FIND ALL DIFFERENCES
============================================================*/
SELECT * FROM Employees_A
SELECT * FROM Employees_B

SELECT
	*
FROM Employees_A A
FULL OUTER JOIN Employees_B B
ON A.EmployeeID = B.EmployeeID
WHERE
	A.EmployeeID IS NULL OR
	B.EmployeeID IS NULL OR 
	A.EmployeeID IS DISTINCT FROM B.EmployeeID OR
	A.EmployeeName IS DISTINCT FROM B.EmployeeName OR
	A.Department IS DISTINCT FROM B.Department OR
	A.Salary IS DISTINCT FROM B.Salary OR
	A.Email IS DISTINCT FROM B.Email 