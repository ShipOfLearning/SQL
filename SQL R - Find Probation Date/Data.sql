-- =============================================
-- Topic: Find Probation End Date (3 Months from Hire Date)
-- Channel: Ship of Learning
-- =============================================

-- Step 1: Clean up if table already exists
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
    DROP TABLE dbo.Employees;
GO

-- Step 2: Create Employees table
CREATE TABLE Employees
(
    EmployeeID   INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    HireDate     DATE NULL   -- Nullable to demonstrate NULL handling edge case
);
GO

-- Step 3: Insert sample data including edge cases
INSERT INTO Employees (EmployeeID, EmployeeName, HireDate) VALUES
(1, 'Rahul Sharma',   '2024-06-10'),  -- Normal case
(2, 'Priya Verma',    '2024-01-31'),  -- Month-end edge case (Jan 31 -> Apr 30)
(3, 'Amit Singh',     '2024-02-29'),  -- Leap year edge case
(4, 'Sneha Kapoor',   '2024-11-30'),  -- Month-end, 30-day month
(5, 'Vikram Rathore', NULL);          -- NULL HireDate edge case
GO
