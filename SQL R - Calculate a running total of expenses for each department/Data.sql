--=============================================================
--CHANNEL : SHIP OF LEARNING - META
--TOPIC   : RUNNING TOTAL OF EXPENSES BY DEPARTMENT
--=============================================================
/*=============================================================
STEP 1: CREATE MASTER TABLE
=============================================================*/

-- Drop the existing table only if it exists.

IF OBJECT_ID('dbo.Expenses', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Expenses;
END;
GO

-- Create the Expenses table.

CREATE TABLE dbo.Expenses
(
    ExpenseID INT IDENTITY(1,1) PRIMARY KEY,

    Department VARCHAR(50) NOT NULL,

    ExpenseDate DATE NOT NULL,

    ExpenseDescription VARCHAR(100) NOT NULL,

    ExpenseAmount DECIMAL(12,2) NOT NULL
        CHECK (ExpenseAmount >= 0)
);
GO

/*
=============================================================
STEP 2: INSERT MASTER DATA
=============================================================
*/

INSERT INTO dbo.Expenses
(
    Department,
    ExpenseDate,
    ExpenseDescription,
    ExpenseAmount
)
VALUES

-- IT Department
('IT', '2026-01-01', 'Laptop Purchase', 1000.00),
('IT', '2026-01-02', 'Software License', 2000.00),
('IT', '2026-01-03', 'Server Maintenance', 500.00),
('IT', '2026-01-03', 'Network Equipment', 750.00),
('IT', '2026-01-05', 'Cloud Services', 1250.00),

-- HR Department
('HR', '2026-01-01', 'Recruitment', 800.00),
('HR', '2026-01-02', 'Employee Training', 1200.00),
('HR', '2026-01-04', 'Employee Engagement', 600.00),

-- Finance Department
('Finance', '2026-01-01', 'Audit Expenses', 1500.00),
('Finance', '2026-01-02', 'Tax Consulting', 1000.00),
('Finance', '2026-01-04', 'Financial Software', 750.00),

-- Sales Department
('Sales', '2026-01-01', 'Marketing Campaign', 2000.00),
('Sales', '2026-01-03', 'Client Meeting', 500.00),
('Sales', '2026-01-05', 'Travel Expenses', 1500.00);
GO

/*
=============================================================
STEP 3: VERIFY MASTER DATA
=============================================================
*/

SELECT
    ExpenseID,
    Department,
    ExpenseDate,
    ExpenseDescription,
    ExpenseAmount
FROM dbo.Expenses
ORDER BY
    Department,
    ExpenseDate,
    ExpenseID;
GO
