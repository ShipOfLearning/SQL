--========================================================
--Ship of Learning |
--Topic: Find Unmatched Rows Between Employee & Department 
--========================================================

-- Drop existing tables if present
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- Create Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT
);

-- Insert Department data (includes one department with NO employees)
INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(1, 'Engineering'),
(2, 'Data Science'),
(3, 'HR'),
(4, 'AI Research');  -- No employees assigned yet

-- Insert Employee data (includes one employee with an orphan DepartmentID)
INSERT INTO Employee (EmployeeID, EmployeeName, DepartmentID) VALUES
(101, 'Rahul Sharma', 1),
(102, 'Priya Verma', 2),
(103, 'Aman Gupta', 3),
(104, 'Sneha Iyer', 5);  -- DepartmentID 5 does not exist in Department table