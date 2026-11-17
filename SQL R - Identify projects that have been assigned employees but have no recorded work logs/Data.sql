/*===============================================================
  CHANNEL       : SHIP OF LEARNING
  TOPIC         : FIND ASSIGNED PROJECTS WITHOUT WORK LOGS
  
  BUSINESS REQUIREMENT:
  Identify projects having at least one assigned employee
  but absolutely no recorded work logs.

  TABLES:
  1. Projects
  2. ProjectActivity

===============================================================*/


/*===============================================================
  STEP 1: DROP EXISTING TABLES
===============================================================*/

IF OBJECT_ID('dbo.ProjectActivity', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.ProjectActivity;
END;

IF OBJECT_ID('dbo.Projects', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Projects;
END;


/*===============================================================
  STEP 2: CREATE PROJECTS TABLE
===============================================================*/

CREATE TABLE dbo.Projects
(
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL
);


/*===============================================================
  STEP 3: CREATE PROJECT ACTIVITY TABLE
===============================================================*/

CREATE TABLE dbo.ProjectActivity
(
    ActivityID INT PRIMARY KEY,

    ProjectID INT NOT NULL,

    EmployeeID INT NOT NULL,

    ActivityType VARCHAR(20) NOT NULL,

    ActivityDate DATE NOT NULL,

    WorkHours DECIMAL(5,2) NULL,

    CONSTRAINT FK_ProjectActivity_Projects
        FOREIGN KEY (ProjectID)
        REFERENCES dbo.Projects(ProjectID),

    CONSTRAINT CK_ProjectActivity_Type
        CHECK
        (
            ActivityType IN ('ASSIGNMENT', 'WORK_LOG')
        ),

    CONSTRAINT CK_ProjectActivity_WorkHours
        CHECK
        (
            (
                ActivityType = 'ASSIGNMENT'
                AND WorkHours IS NULL
            )
            OR
            (
                ActivityType = 'WORK_LOG'
                AND WorkHours > 0
            )
        )
);


/*===============================================================
  STEP 4: INSERT PROJECT MASTER DATA
===============================================================*/

INSERT INTO dbo.Projects
(
    ProjectID,
    ProjectName,
    StartDate
)
VALUES
(101, 'E-Commerce Platform', '2026-01-01'),
(102, 'Banking Application', '2026-01-05'),
(103, 'CRM Development', '2026-01-10'),
(104, 'Mobile Application', '2026-01-15'),
(105, 'HR Management System', '2026-01-20'),
(106, 'Inventory Management', '2026-01-25'),
(107, 'Payment Gateway', '2026-02-01'),
(108, 'Reporting Dashboard', '2026-02-05');


/*===============================================================
  STEP 5: INSERT EMPLOYEE ASSIGNMENTS AND WORK LOGS
===============================================================*/

INSERT INTO dbo.ProjectActivity
(
    ActivityID,
    ProjectID,
    EmployeeID,
    ActivityType,
    ActivityDate,
    WorkHours
)
VALUES

-- PROJECT 101
-- Multiple employees assigned and work logs exist.

(1, 101, 501, 'ASSIGNMENT', '2026-01-01', NULL),
(2, 101, 502, 'ASSIGNMENT', '2026-01-01', NULL),
(3, 101, 501, 'WORK_LOG',   '2026-01-02', 5.00),
(4, 101, 502, 'WORK_LOG',   '2026-01-02', 3.00),

-- PROJECT 102
-- Employees assigned, but ZERO work logs.

(5, 102, 503, 'ASSIGNMENT', '2026-01-05', NULL),
(6, 102, 504, 'ASSIGNMENT', '2026-01-05', NULL),

-- PROJECT 103
-- Employee assigned and work log exists.

(7, 103, 505, 'ASSIGNMENT', '2026-01-10', NULL),
(8, 103, 505, 'WORK_LOG',   '2026-01-11', 6.00),

-- PROJECT 104
-- Employee assigned, but ZERO work logs.

(9, 104, 506, 'ASSIGNMENT', '2026-01-15', NULL),

-- PROJECT 105
-- Employee assigned and work logs exist.

(10, 105, 507, 'ASSIGNMENT', '2026-01-20', NULL),
(11, 105, 507, 'WORK_LOG',   '2026-01-21', 4.00),
(12, 105, 507, 'WORK_LOG',   '2026-01-22', 3.00),

-- PROJECT 106
-- Multiple employees assigned, but ZERO work logs.

(13, 106, 508, 'ASSIGNMENT', '2026-01-25', NULL),
(14, 106, 509, 'ASSIGNMENT', '2026-01-25', NULL),

-- PROJECT 107
-- Employee assigned and work log exists.

(15, 107, 510, 'ASSIGNMENT', '2026-02-01', NULL),
(16, 107, 510, 'WORK_LOG',   '2026-02-02', 8.00)

-- PROJECT 108
-- NO EMPLOYEES ASSIGNED AND NO WORK LOGS.
-- This project must NOT appear in our result.


/*===============================================================
  STEP 6: VERIFY MASTER DATA
===============================================================*/

SELECT *
FROM dbo.Projects
ORDER BY ProjectID;


SELECT *
FROM dbo.ProjectActivity
ORDER BY ProjectID, ActivityID;


/*===============================================================
  EXPECTED ANSWER:

  ProjectID     ProjectName
  -----------------------------------
  102           Banking Application
  104           Mobile Application
  106           Inventory Management

  PROJECT 108 MUST NOT APPEAR BECAUSE
  IT HAS NO EMPLOYEE ASSIGNMENTS.
===============================================================*/