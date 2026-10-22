--============================================================
--  SHIP OF LEARNING : Amazon
--  TOPIC: Find Departments Having More Than 3 Employees
--============================================================

------------------------------------------------------------
-- SECTION 01: DROP EXISTING TABLES IF THEY EXIST
------------------------------------------------------------
IF OBJECT_ID(N'dbo.Employees', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Employees;
END;

IF OBJECT_ID(N'dbo.Departments', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Departments;
END;

------------------------------------------------------------
-- SECTION 02: CREATE MASTER TABLES
------------------------------------------------------------

CREATE TABLE dbo.Departments
(
    DepartmentID   INT           NOT NULL,
    DepartmentName VARCHAR(100)  NOT NULL,

    CONSTRAINT PK_Departments
        PRIMARY KEY (DepartmentID)
);

CREATE TABLE dbo.Employees
(
    EmployeeID     INT           NOT NULL,
    EmployeeName   VARCHAR(100)  NOT NULL,
    DepartmentID   INT           NULL,
    Salary         DECIMAL(12,2) NOT NULL,
    JoiningDate    DATE          NOT NULL,

    CONSTRAINT PK_Employees
        PRIMARY KEY (EmployeeID),

    CONSTRAINT FK_Employees_Departments
        FOREIGN KEY (DepartmentID)
        REFERENCES dbo.Departments(DepartmentID)
);

------------------------------------------------------------
-- SECTION 03: INSERT DEPARTMENT MASTER DATA
------------------------------------------------------------

INSERT INTO dbo.Departments
(
    DepartmentID,
    DepartmentName
)
VALUES
    (10, 'IT'),
    (20, 'HR'),
    (30, 'Sales'),
    (40, 'Finance'),
    (50, 'Marketing'),
    (60, 'Legal');

------------------------------------------------------------
-- SECTION 04: INSERT EMPLOYEE MASTER DATA
------------------------------------------------------------

INSERT INTO dbo.Employees
(
    EmployeeID,
    EmployeeName,
    DepartmentID,
    Salary,
    JoiningDate
)
VALUES
    -- IT: 5 employees
    (101, 'Rahul',  10, 75000, '2024-01-10'),
    (102, 'Priya',  10, 85000, '2024-02-15'),
    (103, 'Amit',   10, 65000, '2024-03-20'),
    (104, 'Sneha',  10, 95000, '2024-04-12'),
    (105, 'Karan',  10, 72000, '2024-05-08'),

    -- HR: 3 employees
    (106, 'Neha',   20, 55000, '2024-01-25'),
    (107, 'Rohit',  20, 60000, '2024-03-10'),
    (108, 'Pooja',  20, 58000, '2024-06-15'),

    -- Sales: 4 employees
    (109, 'Vikas',  30, 68000, '2024-02-01'),
    (110, 'Anjali', 30, 71000, '2024-03-05'),
    (111, 'Deepak', 30, 64000, '2024-04-18'),
    (112, 'Meera',  30, 78000, '2024-07-10'),

    -- Finance: 4 employees
    (113, 'Arjun',  40, 88000, '2024-01-12'),
    (114, 'Divya',  40, 92000, '2024-02-22'),
    (115, 'Nikhil', 40, 81000, '2024-05-16'),
    (116, 'Riya',   40, 86000, '2024-08-01'),

    -- Marketing: 2 employees
    (117, 'Simran', 50, 62000, '2024-03-14'),
    (118, 'Yash',   50, 59000, '2024-06-09'),

    -- No department assigned: 1 employee
    (119, 'Kabir', NULL, 70000, '2024-09-01');

-- Legal has zero employees.

------------------------------------------------------------
-- SECTION 05: VERIFY INPUT DATA
------------------------------------------------------------

SELECT *
FROM dbo.Departments
ORDER BY DepartmentID;

SELECT *
FROM dbo.Employees
ORDER BY EmployeeID;

