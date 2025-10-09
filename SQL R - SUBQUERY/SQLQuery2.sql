--SELECT * FROM Employees 
SELECT 
NAME,Salary,Department,
(SALARY - (SELECT AVG(Salary) FROM Employees))
AS DIFF
FROM Employees
