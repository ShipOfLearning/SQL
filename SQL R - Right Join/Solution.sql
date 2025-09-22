SELECT 
    Employees.EmpName, 
    Departments.DeptName
FROM Employees
RIGHT JOIN Departments
ON Employees.DeptID = Departments.DeptID;