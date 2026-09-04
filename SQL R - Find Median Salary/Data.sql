-- ================================================================
-- Ship of Learning | Median Salary in SQL Server (T-SQL)
-- Covers: PERCENTILE_CONT (modern) + ROW_NUMBER (manual/interview)
-- ================================================================

-- ---------- SAFE RE-RUN SETUP ----------
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
    DROP TABLE dbo.Employees;
GO

CREATE TABLE dbo.Employees
(
    EmployeeID   INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department   VARCHAR(50),
    Salary       DECIMAL(10,2)
);
GO

-- ---------- MASTER DATA (deliberate odd/even counts per dept) ----------
INSERT INTO dbo.Employees (EmployeeID, EmployeeName, Department, Salary) VALUES
(1,  'Aman',   'IT',    45000),
(2,  'Riya',   'IT',    52000),
(3,  'Karan',  'IT',    38000),
(4,  'Neha',   'IT',    61000),
(5,  'Suresh', 'IT',    47000),   -- IT count = 5 (ODD)
(6,  'Priya',  'HR',    30000),
(7,  'Vikram', 'HR',    35000),
(8,  'Anjali', 'HR',    32000),
(9,  'Rohit',  'HR',    40000),   -- HR count = 4 (EVEN)
(10, 'Simran', 'Sales', 55000);   -- Sales count = 1 (SINGLE ROW edge case)
GO
