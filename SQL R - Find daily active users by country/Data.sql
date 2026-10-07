/*=====================================================================
  SHIP OF LEARNING : GOOGLE
  Topic: Find Daily Active Users (DAU) by Country 
=====================================================================*/

/*=====================================================================
STEP 1: DROP TABLE IF IT ALREADY EXISTS
=====================================================================*/

IF OBJECT_ID('dbo.UserActivity', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.UserActivity;
END;
GO


/*
=====================================================================
STEP 2: CREATE MASTER TABLE
=====================================================================
*/

CREATE TABLE dbo.UserActivity
(
    ActivityID   INT IDENTITY(1,1) PRIMARY KEY,
    UserID       INT           NOT NULL,
    Country      VARCHAR(50)   NOT NULL,
    ActivityTime DATETIME2(0)  NOT NULL,
    ActivityType VARCHAR(50)   NOT NULL
);
GO


/*
=====================================================================
STEP 3: INSERT SAMPLE DATA
===================================================================*/

INSERT INTO dbo.UserActivity
(
    UserID,
    Country,
    ActivityTime,
    ActivityType
)
VALUES

-- 1 October 2026 - India
(101, 'India', '2026-10-01 08:15:00', 'Login'),
(101, 'India', '2026-10-01 09:10:00', 'Search'),
(101, 'India', '2026-10-01 10:30:00', 'Purchase'),
(102, 'India', '2026-10-01 11:00:00', 'Login'),
(103, 'India', '2026-10-01 14:20:00', 'Search'),

-- 1 October 2026 - USA
(201, 'USA',   '2026-10-01 07:30:00', 'Login'),
(201, 'USA',   '2026-10-01 08:45:00', 'Search'),
(202, 'USA',   '2026-10-01 12:10:00', 'Purchase'),

-- 1 October 2026 - UK
(301, 'UK',    '2026-10-01 09:00:00', 'Login'),

-- 2 October 2026 - India
(101, 'India', '2026-10-02 08:00:00', 'Login'),
(102, 'India', '2026-10-02 09:30:00', 'Login'),
(102, 'India', '2026-10-02 10:15:00', 'Search'),
(104, 'India', '2026-10-02 11:45:00', 'Purchase'),

-- 2 October 2026 - USA
(201, 'USA',   '2026-10-02 07:00:00', 'Login'),
(203, 'USA',   '2026-10-02 08:20:00', 'Search'),
(204, 'USA',   '2026-10-02 13:30:00', 'Purchase'),
(204, 'USA',   '2026-10-02 15:00:00', 'Search'),

-- 2 October 2026 - UK
(301, 'UK',    '2026-10-02 10:10:00', 'Login'),
(302, 'UK',    '2026-10-02 11:20:00', 'Search'),

-- 3 October 2026 - India
(101, 'India', '2026-10-03 08:30:00', 'Login'),
(105, 'India', '2026-10-03 09:45:00', 'Search'),

-- 3 October 2026 - USA
(201, 'USA',   '2026-10-03 07:15:00', 'Login'),
(202, 'USA',   '2026-10-03 08:40:00', 'Login'),
(202, 'USA',   '2026-10-03 09:00:00', 'Search'),

-- 3 October 2026 - UK
(301, 'UK',    '2026-10-03 10:00:00', 'Purchase'),
(303, 'UK',    '2026-10-03 12:00:00', 'Login');

GO


/*
=====================================================================
STEP 4: VIEW MASTER DATA
=====================================================================
*/

SELECT *
FROM dbo.UserActivity
ORDER BY ActivityTime, Country, UserID;

