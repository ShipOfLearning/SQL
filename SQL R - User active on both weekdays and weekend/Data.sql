-- ============================================================
-- SHIP OF LEARNING | SQL Server Tutorial
-- Topic: Find users active on BOTH Weekdays AND Weekends
-- ============================================================

-- STEP 1: Safe re-run guard
IF OBJECT_ID('dbo.UserActivity', 'U') IS NOT NULL
    DROP TABLE dbo.UserActivity;
GO

-- STEP 2: Table creation
CREATE TABLE dbo.UserActivity
(
    ActivityID   INT IDENTITY(1,1) PRIMARY KEY,
    UserID       INT           NOT NULL,
    UserName     VARCHAR(50)   NOT NULL,
    ActivityDate DATE          NULL   -- NULL allowed intentionally (edge case)
);
GO

-- STEP 3: Insert sample data WITH deliberate edge cases
-- Assume the following week for reference:
-- Mon 2026-08-17, Tue 2026-08-18, Wed 2026-08-19, Thu 2026-08-20,
-- Fri 2026-08-21, Sat 2026-08-22, Sun 2026-08-23

INSERT INTO dbo.UserActivity (UserID, UserName, ActivityDate)
VALUES
    -- User 1: Active ONLY on weekdays -> should NOT appear in result
    (1, 'Amit',    '2026-08-17'),
    (1, 'Amit',    '2026-08-19'),
    (1, 'Amit',    '2026-08-21'),

    -- User 2: Active ONLY on weekends -> should NOT appear in result
    (2, 'Priya',   '2026-08-22'),
    (2, 'Priya',   '2026-08-23'),

    -- User 3: Active on BOTH weekday and weekend -> SHOULD appear
    (3, 'Rahul',   '2026-08-18'),
    (3, 'Rahul',   '2026-08-22'),

    -- User 4: Active on BOTH, WITH duplicate same-day entries (edge case)
    (4, 'Sneha',   '2026-08-20'),
    (4, 'Sneha',   '2026-08-20'),   -- duplicate entry same day
    (4, 'Sneha',   '2026-08-23'),

    -- User 5: Has a NULL ActivityDate mixed with valid dates (edge case)
    (5, 'Vikram',  '2026-08-17'),
    (5, 'Vikram',  NULL),
    (5, 'Vikram',  '2026-08-22'),

    -- User 6: Only ONE record, only weekday -> should NOT appear
    (6, 'Neha',    '2026-08-20'),

    -- User 7: Only NULL dates -> should NOT appear (no valid activity at all)
    (7, 'Karan',   NULL);
GO
