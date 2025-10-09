SELECT * FROM EMPLOYEES

SELECT Department,AVG(SALARY) FROM Employees
GROUP BY Department

SELECT Name,Salary,Department
FROM Employees E
WHERE Salary > 
(SELECT AVG(SALARY) FROM Employees
WHERE Department = E.Department)