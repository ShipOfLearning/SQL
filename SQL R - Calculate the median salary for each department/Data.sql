/*============================================================
Ship of Learning
Topic   : Calculate Median Salary Per Department
Platform: Microsoft SQL Server 2022
============================================================

Interview Objective:
Calculate the median salary for every department.

Tables:
1. Departments
2. Employees

============================================================
SECTION 1: CLEANUP EXISTING TABLES
============================================================*/

IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
    DROP TABLE dbo.Employees;

IF OBJECT_ID('dbo.Departments', 'U') IS NOT NULL
    DROP TABLE dbo.Departments;


/*============================================================
SECTION 2: CREATE DEPARTMENTS TABLE
============================================================*/

CREATE TABLE dbo.Departments
(
    DepartmentID   INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);


/*============================================================
SECTION 3: CREATE EMPLOYEES TABLE
============================================================*/

CREATE TABLE dbo.Employees
(
    EmployeeID   INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    Salary       DECIMAL(10,2) NULL,

    CONSTRAINT FK_Employees_Departments
        FOREIGN KEY (DepartmentID)
        REFERENCES dbo.Departments(DepartmentID)
);


/*============================================================
SECTION 4: INSERT DEPARTMENT MASTER DATA
============================================================*/

INSERT INTO dbo.Departments
(
    DepartmentID,
    DepartmentName
)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales');


/*============================================================
SECTION 5: INSERT EMPLOYEE MASTER DATA
============================================================*/

INSERT INTO dbo.Employees
(
    EmployeeID,
    EmployeeName,
    DepartmentID,
    Salary
)
VALUES
-- IT: 5 non-NULL salaries (Odd)
(101, 'Amit',       1, 10000),
(102, 'Neha',       1, 20000),
(103, 'Rahul',      1, 30000),
(104, 'Priya',      1, 40000),
(105, 'Vikas',      1, 100000),

-- HR: 4 non-NULL salaries (Even)
(106, 'Kiran',      2, 15000),
(107, 'Meera',      2, 25000),
(108, 'Arjun',      2, 35000),
(109, 'Sneha',      2, 45000),

-- Finance: 6 non-NULL salaries (Even)
(110, 'Rohit',     3, 12000),
(111, 'Anjali',     3, 22000),
(112, 'Manish',     3, 32000),
(113, 'Pooja',      3, 42000),
(114, 'Deepak',     3, 52000),
(115, 'Nisha',      3, 62000),

-- Sales: 3 non-NULL salaries (Odd)
(116, 'Sanjay',     4, 18000),
(117, 'Ritu',       4, 28000),
(118, 'Ajay',       4, 38000),

-- NULL Salary: intentionally excluded from median calculations
(119, 'TestUser',   1, NULL);


/*============================================================
SECTION 6: VALIDATE MASTER DATA
============================================================*/

SELECT
    D.DepartmentName,
    E.EmployeeID,
    E.EmployeeName,
    E.Salary
FROM dbo.Departments AS D
INNER JOIN dbo.Employees AS E
    ON D.DepartmentID = E.DepartmentID
ORDER BY
    D.DepartmentName,
    E.Salary;