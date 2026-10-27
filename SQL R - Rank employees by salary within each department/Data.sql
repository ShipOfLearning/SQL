--============================================================
-- CHANNEL       : Ship of Learning - Amazon
-- TOPIC          : Rank Employees by Salary Within Each Department
--============================================================

-- STEP 1: Drop the table only if it already exists.
IF OBJECT_ID(N'dbo.Employees', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Employees;
END;
GO

-- STEP 2: Create the Employees table.
CREATE TABLE dbo.Employees
(
    EmployeeID   INT           NOT NULL PRIMARY KEY,
    EmployeeName VARCHAR(100)  NOT NULL,
    DepartmentID VARCHAR(20)   NOT NULL,
    Salary       DECIMAL(12,2) NOT NULL
        CHECK (Salary >= 0)
);
GO

-- STEP 3: Insert master data.
INSERT INTO dbo.Employees
    (EmployeeID, EmployeeName, DepartmentID, Salary)
VALUES
    (1, 'Asha',   'IT',       100000.00),
    (2, 'Rahul',  'IT',        90000.00),
    (3, 'Priya',  'IT',        90000.00),
    (4, 'Neha',   'IT',        80000.00),
    (5, 'Karan',  'IT',        70000.00),
    (6, 'Amit',   'HR',        70000.00),
    (7, 'Meera',  'HR',        65000.00),
    (8, 'Vikas',  'HR',        65000.00),
    (9, 'Sneha',  'HR',        60000.00),
    (10, 'Arjun', 'Finance',  120000.00),
    (11, 'Isha',  'Finance',  110000.00),
    (12, 'Dev',   'Finance',  100000.00);
GO

-- STEP 4: Verify the master data.
SELECT
    EmployeeID,
    EmployeeName,
    DepartmentID,
    Salary
FROM dbo.Employees
ORDER BY
    DepartmentID,
    Salary DESC,
    EmployeeID;
GO