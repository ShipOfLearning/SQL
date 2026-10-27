--============================================================
-- CHANNEL  : SHIP OF LEARNING - Microsoft 
-- TOPIC    : Calculate Current vs Previous Salary Difference
--============================================================
SET NOCOUNT ON;
GO

/* 1. DROP TABLE ONLY IF IT EXISTS */

IF OBJECT_ID(N'dbo.EmployeeSalaryHistory', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.EmployeeSalaryHistory;
END;
GO

/* 2. CREATE MASTER TABLE */

CREATE TABLE dbo.EmployeeSalaryHistory
(
    SalaryRecordID INT IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_EmployeeSalaryHistory PRIMARY KEY,

    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    SalaryDate DATE NOT NULL,
    Salary DECIMAL(12,2) NOT NULL,

    CONSTRAINT CK_EmployeeSalaryHistory_Salary
        CHECK (Salary >= 0)
);
GO

/* 3. INSERT SAMPLE DATA */

INSERT INTO dbo.EmployeeSalaryHistory
    (EmployeeID, EmployeeName, SalaryDate, Salary)
VALUES
    (101, 'Rahul', '2025-01-01', 50000),
    (101, 'Rahul', '2025-04-01', 60000),
    (101, 'Rahul', '2025-07-01', 55000),

    (102, 'Priya', '2025-01-01', 70000),
    (102, 'Priya', '2025-06-01', 80000),
    (102, 'Priya', '2025-09-01', 95000),

    (103, 'Amit',  '2025-03-01', 40000),

    (104, 'Neha',  '2025-01-01', 90000),
    (104, 'Neha',  '2025-05-01', 90000),
    (104, 'Neha',  '2025-08-01', 85000);
GO

/* 4. VIEW MASTER DATA */

SELECT
    SalaryRecordID,
    EmployeeID,
    EmployeeName,
    SalaryDate,
    Salary
FROM dbo.EmployeeSalaryHistory
ORDER BY
    EmployeeID,
    SalaryDate,
    SalaryRecordID;
GO