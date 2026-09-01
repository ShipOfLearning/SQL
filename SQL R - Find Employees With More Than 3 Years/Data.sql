/* ============================================================
   TOPIC   : Find Employees Who Worked More Than 3 Years
             (Leap-Year Safe Version)
   PLATFORM: MS SQL Server (T-SQL)
   CHANNEL : Ship of Learning
   ============================================================ */

-- ============================================================
-- STEP 1: CLEAN SETUP
-- ============================================================
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
    DROP TABLE dbo.Employees;
GO

CREATE TABLE dbo.Employees
(
    EmployeeID   INT           PRIMARY KEY,
    EmployeeName VARCHAR(100)  NOT NULL,
    Department   VARCHAR(50)   NULL,
    HireDate     DATE          NULL,   -- NULL simulates bad/missing data
    ResignDate   DATE          NULL    -- NULL = employee still active
);
GO

-- ============================================================
-- STEP 2: INSERT DATA (WITH DELIBERATE EDGE CASES)
-- ============================================================
INSERT INTO dbo.Employees (EmployeeID, EmployeeName, Department, HireDate, ResignDate)
VALUES
    -- 1. Long-tenured, still active -> clearly qualifies (6+ years)
    (101, 'Amit Sharma',    'IT',      '2020-08-15', NULL),

    -- 2. BOUNDARY CASE: hired exactly 3 years ago today -> should NOT qualify (not MORE than 3)
    (102, 'Priya Verma',    'Finance', '2023-09-01', NULL),

    -- 3. BOUNDARY CASE: hired 3 years + 1 day ago -> SHOULD qualify
    (103, 'Rohan Mehta',    'IT',      '2023-08-31', NULL),

    -- 4. Resigned BEFORE completing 3 years -> should NOT qualify, even though HireDate is old
    (104, 'Sneha Iyer',     'HR',      '2021-01-10', '2023-06-15'),

    -- 5. Resigned AFTER completing 3+ years -> SHOULD qualify (tenure measured up to resign date)
    (105, 'Karan Malhotra', 'Sales',   '2019-05-01', '2023-05-15'),

    -- 6. NULL HireDate -> bad data, must be excluded safely
    (106, 'Neha Kapoor',    'IT',      NULL,         NULL),

    -- 7. Less than 3 years, still active -> should NOT qualify
    (107, 'Aditya Rao',     'Finance', '2025-01-01', NULL),

    -- 8. FUTURE HireDate -> data-entry error, must be excluded
    (108, 'Vikram Singh',   'IT',      '2030-01-01', NULL),

    -- 9. LEAP YEAR CASE: hired on Feb 29, 2020 (leap day), still active
    -- SQL Server resolves DATEADD(YEAR, 3, '2020-02-29') = '2023-02-28'
    -- (2023 is not a leap year, so Feb 29 automatically rounds down to Feb 28)
    (109, 'Meera Joshi',    'IT',      '2020-02-29', NULL),

    -- 10. LEAP YEAR CASE: hired just before a leap day, resigned just after
    -- Tests that day-based rounding doesn't accidentally over/under-count
    (110, 'Farhan Ali',     'Sales',   '2019-03-01', '2022-02-28');
GO