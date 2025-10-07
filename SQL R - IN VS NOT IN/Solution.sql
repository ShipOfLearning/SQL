SELECT * FROM Employees
SELECT * FROM Departments

SELECT Name,Department
FROM Employees
WHERE Department IN
(SELECT DeptName FROM Departments)

SELECT Name,Department
FROM Employees
WHERE Department NOT IN
(SELECT DeptName FROM Departments
WHERE DeptName IS NOT NULL)