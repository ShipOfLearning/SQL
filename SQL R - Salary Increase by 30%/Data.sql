-- =========================================================
-- STEP 1: DROP TABLE IF EXISTS, THEN CREATE
-- =========================================================
IF OBJECT_ID('dbo.EmpSalaryHistory', 'U') IS NOT NULL
    DROP TABLE dbo.EmpSalaryHistory;
GO

CREATE TABLE dbo.EmpSalaryHistory
(
    SalaryID   INT IDENTITY(1,1) PRIMARY KEY,
    EmpID      INT NOT NULL,
    EmpName    VARCHAR(50) NOT NULL,
    SalaryDate DATE NOT NULL,
    Salary     DECIMAL(10,2) NOT NULL
);
GO

-- =========================================================
-- STEP 2: INSERT SAMPLE DATA
-- =========================================================
INSERT INTO dbo.EmpSalaryHistory (EmpID, EmpName, SalaryDate, Salary) VALUES
(101, 'Rahul Sharma', '2023-01-01', 40000),
(101, 'Rahul Sharma', '2023-07-01', 45000),
(101, 'Rahul Sharma', '2024-01-01', 60000),   -- 33.3% increase -> QUALIFIES
(102, 'Priya Verma',  '2023-01-01', 50000),
(102, 'Priya Verma',  '2023-07-01', 52000),
(102, 'Priya Verma',  '2024-01-01', 55000),   -- 5.8% increase -> does NOT qualify
(103, 'Amit Singh',   '2023-01-01', 30000),
(103, 'Amit Singh',   '2024-01-01', 42000),   -- 40% increase -> QUALIFIES
(104, 'Sneha Patel',  '2023-01-01', 35000),
(104, 'Sneha Patel',  '2023-06-01', 36000),
(104, 'Sneha Patel',  '2024-01-01', 37000),   -- 2.8% increase -> does NOT qualify
(105, 'Vikram Rao',   '2023-01-01', 25000);   -- only 1 record -> excluded (no previous salary)
GO