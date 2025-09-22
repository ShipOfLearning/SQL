-- Employees Table
CREATE TABLE Employees (
    EmpID INT,
    EmpName VARCHAR(50),
    DeptID INT
);

INSERT INTO Employees VALUES
(1, 'Amit', 101),
(2, 'Rohit', 102),
(3, 'Sneha', 103),
(4, 'Priya', NULL);

-- Departments Table
CREATE TABLE Departments (
    DeptID INT,
    DeptName VARCHAR(50)
);

INSERT INTO Departments VALUES
(101, 'HR'),
(102, 'IT'),
(104, 'Finance');