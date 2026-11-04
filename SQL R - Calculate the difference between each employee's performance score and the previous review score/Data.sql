--============================================================
--CHANNEL       : SHIP OF LEARNING - Google 
--TOPIC         : Calculate Difference Between Current and
--                Previous Employee Performance Scores
--============================================================

/*============================================================
SECTION 1: DROP EXISTING TABLE IF IT EXISTS
============================================================*/

IF OBJECT_ID('dbo.EmployeeReviews', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.EmployeeReviews;
END;
GO

/*
============================================================
SECTION 2: CREATE MASTER TABLE
============================================================
*/

CREATE TABLE dbo.EmployeeReviews
(
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    ReviewDate DATE NOT NULL,
    PerformanceScore INT NOT NULL,

    CONSTRAINT CK_EmployeeReviews_PerformanceScore
    CHECK (PerformanceScore BETWEEN 0 AND 100)
);
GO

/*
============================================================
SECTION 3: INSERT MASTER DATA
============================================================
*/

INSERT INTO dbo.EmployeeReviews
(
    EmployeeID,
    EmployeeName,
    ReviewDate,
    PerformanceScore
)
VALUES

-- Alice: Improvement followed by decline
(101, 'Alice', '2026-01-15', 75),
(101, 'Alice', '2026-04-15', 90),
(101, 'Alice', '2026-07-15', 85),

-- Bob: Continuous improvement
(102, 'Bob', '2026-01-20', 60),
(102, 'Bob', '2026-04-20', 70),
(102, 'Bob', '2026-07-20', 80),

-- Charlie: No improvement or decline
(103, 'Charlie', '2026-02-10', 80),
(103, 'Charlie', '2026-05-10', 80),
(103, 'Charlie', '2026-08-10', 80),

-- David: Continuous decline
(104, 'David', '2026-01-05', 95),
(104, 'David', '2026-04-05', 85),
(104, 'David', '2026-07-05', 70),

-- Emma: Only one review
(105, 'Emma', '2026-03-10', 88),

-- Frank: Same review date (tie-breaker scenario)
(106, 'Frank', '2026-01-10', 70),
(106, 'Frank', '2026-01-10', 80),
(106, 'Frank', '2026-04-10', 90);
GO

/*
============================================================
SECTION 4: VIEW MASTER DATA
============================================================
*/

SELECT
    ReviewID,
    EmployeeID,
    EmployeeName,
    ReviewDate,
    PerformanceScore
FROM dbo.EmployeeReviews
ORDER BY
    EmployeeID,
    ReviewDate,
    ReviewID;
GO

/*
============================================================
END OF MASTER DATA SETUP
============================================================
*/