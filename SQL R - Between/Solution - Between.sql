--SELECT * FROM Employees
SELECT Name, Salary, JoinDate
FROM Employees
WHERE Salary BETWEEN 20000 AND 40000
 

 SELECT Name, Salary, JoinDate
FROM Employees
WHERE JoinDate BETWEEN '2024-02-10' AND 
'2024-04-19'
ORDER BY JoinDate