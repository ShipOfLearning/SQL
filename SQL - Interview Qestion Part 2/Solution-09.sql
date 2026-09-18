/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	9. You need to list all departments that do not have any employees. 
		Which SQL query would you use? */
SELECT * FROM employees
SELECT * FROM departments

SELECT
	D.DeptID,DeptName,E.EmpID
FROM Departments D
LEFT JOIN Employees E
ON D.DeptID = E.DeptID
WHERE
E.EmpID IS NULL