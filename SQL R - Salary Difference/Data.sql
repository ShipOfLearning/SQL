-- ============================================================
-- SHIP OF LEARNING | SQL Interview Series
-- Topic: Difference Between Employee Salary and Department's Highest Salary
-- Platform: MS SQL Server (T-SQL)
-- ============================================================

-- ------------------------------------------------------------
-- STEP 1: TABLE CREATION
-- ------------------------------------------------------------
CREATE TABLE Employees (
    EmpID       INT PRIMARY KEY,
    EmpName     VARCHAR(50),
    Department  VARCHAR(50),
    Salary      DECIMAL(10,2)
);

-- ------------------------------------------------------------
-- STEP 2: DATA INSERTION (with deliberate edge cases)
-- Edge cases included:
--   1. Tie for highest salary in a department (Sales - Raj & Meena both 60000)
--   2. NULL salary (Priya - tests NULL handling)
--   3. Duplicate employee name across departments (Amit)
--   4. Single-employee department (Finance - only Karan, diff = 0)
-- ------------------------------------------------------------
INSERT INTO Employees (EmpID, EmpName, Department, Salary) VALUES
(1, 'Raj',    'Sales',      60000),
(2, 'Meena',  'Sales',      60000),   -- Tie for highest in Sales
(3, 'Suresh', 'Sales',      45000),
(4, 'Amit',   'Sales',      50000),   -- Duplicate name across departments
(5, 'Amit',   'IT',         75000),   -- Same name, different department
(6, 'Neha',   'IT',         90000),
(7, 'Priya',  'IT',         NULL),    -- NULL salary edge case
(8, 'Karan',  'Finance',    55000);   -- Single employee department
