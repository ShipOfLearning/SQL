/* ============================================================
   TOPIC: Repeat Each TempID N Times Based on Its Own Value
   Pattern: 1 -> 1 | 2 -> 2,2 | 3 -> 3,3,3 | 4 -> 4,4,4,4
   Channel: Ship of Learning
   ============================================================ */

-- STEP 1: Clean setup with guard
IF OBJECT_ID('dbo.TempID_Table', 'U') IS NOT NULL
    DROP TABLE dbo.TempID_Table;

CREATE TABLE dbo.TempID_Table
(
    TempID INT
);

-- STEP 2: Insert data with deliberate edge cases for teaching
INSERT INTO dbo.TempID_Table (TempID)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5);


