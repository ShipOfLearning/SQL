/*============================================================
CHANNEL      : SHIP OF LEARNING
TOPIC        : COMPARE TWO TABLES AND FIND ALL DIFFERENCES
PLATFORM     : MICROSOFT SQL SERVER 2022
LEVEL        : BEGINNER TO EXPERT
INTERVIEW    : SQL DEVELOPER / DATA ENGINEER

OBJECTIVE:
Compare two employee tables and identify:
1. Changed business column values.
2. NULL vs NON-NULL differences.
3. Records missing from either table.

TABLES:
1. Employees_A
2. Employees_B
============================================================
-- STEP 1: DROP EXISTING TABLES IF THEY EXIST
============================================================*/
IF OBJECT_ID('dbo.Employees_B', 'U') IS NOT NULL
    DROP TABLE dbo.Employees_B;

IF OBJECT_ID('dbo.Employees_A', 'U') IS NOT NULL
    DROP TABLE dbo.Employees_A;
GO

/*============================================================
-- STEP 2: CREATE SOURCE TABLE
============================================================*/
CREATE TABLE dbo.Employees_A
(
    EmployeeID   INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department   VARCHAR(50),
    Salary       DECIMAL(12,2),
    Email        VARCHAR(150)
);

GO

/*============================================================
-- STEP 3: CREATE TARGET TABLE
============================================================*/
CREATE TABLE dbo.Employees_B
(
    EmployeeID   INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department   VARCHAR(50),
    Salary       DECIMAL(12,2),
    Email        VARCHAR(150)
);

GO

/*============================================================
-- STEP 4: INSERT SOURCE DATA
============================================================*/
INSERT INTO dbo.Employees_A
(
    EmployeeID,
    EmployeeName,
    Department,
    Salary,
    Email
)
VALUES
(101, 'Rahul', 'IT',      50000, 'rahul@company.com'),
(102, 'Amit',  'HR',      NULL,  'amit@company.com'),
(103, 'Neha',  'Finance', 70000, 'neha@company.com'),
(104, 'Priya', 'IT',      60000, 'priya@company.com'),
(105, 'Karan', 'Sales',   45000, 'karan@company.com'),
(107, 'Riya',  'HR',      55000, NULL),
(108, 'Arjun', 'IT',      NULL,  NULL);

GO

/*============================================================
-- STEP 5: INSERT TARGET DATA
============================================================*/
INSERT INTO dbo.Employees_B
(
    EmployeeID,
    EmployeeName,
    Department,
    Salary,
    Email
)
VALUES
(101, 'Rahul', 'IT',      50000, 'rahul@company.com'),
(102, 'Amit',  'HR',      60000, 'amit@company.com'),
(103, 'Neha',  'Finance', 70000, 'neha@company.com'),
(104, 'Priya', 'IT',      65000, 'priya@company.com'),
(106, 'Vikas', 'Sales',   48000, 'vikas@company.com'),
(107, 'Riya',  'HR',      55000, 'riya@company.com'),
(108, 'Arjun', 'IT',      NULL,  NULL);

GO

/*============================================================
-- STEP 6: VERIFY SOURCE DATA
============================================================*/
SELECT *
FROM dbo.Employees_A
ORDER BY EmployeeID;

/*============================================================
-- STEP 7: VERIFY TARGET DATA
============================================================*/
SELECT *
FROM dbo.Employees_B
ORDER BY EmployeeID;

GO

/*
EXPECTED TEST SCENARIOS:

101 = Identical records.
102 = NULL salary vs 60000.
103 = Identical records.
104 = Salary changed from 60000 to 65000.
105 = Exists only in Employees_A.
106 = Exists only in Employees_B.
107 = NULL email vs non-NULL email.
108 = Both salaries NULL and both emails NULL.

Expected differing or missing EmployeeIDs:
102, 104, 105, 106, 107
*/
