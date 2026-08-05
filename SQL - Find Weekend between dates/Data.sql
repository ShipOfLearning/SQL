SET DATEFIRST 7;  -- 1 = Sunday, 7 = Saturday

-- ============================================================
-- STEP 1: TEACHING DATA - Table Creation
-- ============================================================
CREATE TABLE ProjectSchedule (
    ProjectID     INT PRIMARY KEY,
    ProjectName   VARCHAR(100),
    StartDate     DATE,
    EndDate       DATE
);

-- ============================================================
-- STEP 2: TEACHING DATA - Data Insertion
-- Deliberately includes edge cases:
--   P1: Range starts on Monday, ends on Friday (partial week)
--   P2: Range exactly spans one full week
--   P3: StartDate = EndDate (single day, a Saturday)
--   P4: Range starts on Saturday (edge boundary test)
--   P5: Long multi-week range
-- ============================================================
INSERT INTO ProjectSchedule (ProjectID, ProjectName, StartDate, EndDate)
VALUES
    (1, 'Website Revamp',        '2026-08-03', '2026-08-07'), -- Mon-Fri
    (2, 'Mobile App Release',    '2026-08-01', '2026-08-07'), -- Full week
    (3, 'Single Day Hotfix',     '2026-08-08', '2026-08-08'), -- Saturday only
    (4, 'API Migration',         '2026-08-08', '2026-08-14'), -- Starts Saturday
    (5, 'Data Warehouse Build',  '2026-08-01', '2026-08-31'); -- Full month