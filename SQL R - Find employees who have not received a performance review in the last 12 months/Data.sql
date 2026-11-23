/*============================================================
CHANNEL  : SHIP OF LEARNING
TOPIC    : FIND EMPLOYEES WITHOUT A PERFORMANCE REVIEW
           IN THE LAST 12 MONTHS
PLATFORM : MICROSOFT SQL SERVER 2022
LEVEL    : BEGINNER TO EXPERT
============================================================

BUSINESS REQUIREMENT:
Find employees who have not received any performance review
within the previous 12 months.

INCLUDE:
1. Employees whose last review was more than 12 months ago.
2. Employees who have never received a review.
3. Employees whose only review is future-dated.

EXCLUDE:
Employees with at least one review in the 12-month window.

REFERENCE DATE: 22 November 2026

TABLES:
1. Employees
2. PerformanceReviews
============================================================*/


/*==========================================================
  STEP 1: DROP EXISTING TABLES
==========================================================*/

IF OBJECT_ID('dbo.PerformanceReviews', 'U') IS NOT NULL
    DROP TABLE dbo.PerformanceReviews;

IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
    DROP TABLE dbo.Employees;


/*==========================================================
  STEP 2: CREATE EMPLOYEES TABLE
==========================================================*/

CREATE TABLE dbo.Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    JoiningDate DATE NOT NULL
);


/*==========================================================
  STEP 3: CREATE PERFORMANCE REVIEWS TABLE
==========================================================*/

CREATE TABLE dbo.PerformanceReviews
(
    ReviewID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    ReviewDate DATE NOT NULL,
    PerformanceRating DECIMAL(3,1) NULL,

    CONSTRAINT FK_PerformanceReviews_Employees
        FOREIGN KEY (EmployeeID)
        REFERENCES dbo.Employees(EmployeeID)
);


/*==========================================================
  STEP 4: INSERT EMPLOYEE MASTER DATA
==========================================================*/

INSERT INTO dbo.Employees
(
    EmployeeID,
    EmployeeName,
    Department,
    JoiningDate
)
VALUES
(101, 'Rahul', 'IT', '2020-01-15'),
(102, 'Priya', 'HR', '2019-03-10'),
(103, 'Amit', 'Finance', '2021-07-20'),
(104, 'Neha', 'IT', '2018-05-12'),
(105, 'Karan', 'Sales', '2022-02-01'),
(106, 'Sneha', 'Marketing', '2020-09-18'),
(107, 'Arjun', 'IT', '2023-04-05'),
(108, 'Meera', 'Finance', '2021-11-11');


/*==========================================================
  STEP 5: INSERT PERFORMANCE REVIEW DATA
==========================================================*/

INSERT INTO dbo.PerformanceReviews
(
    ReviewID,
    EmployeeID,
    ReviewDate,
    PerformanceRating
)
VALUES
-- Rahul: Latest review is older than 12 months
(1, 101, '2024-06-15', 4.0),
(2, 101, '2025-11-15', 4.2),

-- Priya: Has a recent review
(3, 102, '2025-12-15', 3.8),
(4, 102, '2026-02-10', 4.1),

-- Amit: Never received a review

-- Neha: Review exactly on the lower boundary
(5, 104, '2025-11-22', 3.5),

-- Karan: Old review only
(6, 105, '2024-10-05', 3.9),

-- Sneha: Recent review
(7, 106, '2026-11-10', 4.5),

-- Arjun: Future-dated review only
(8, 107, '2026-12-01', 4.0),

-- Meera: One day before the boundary
(9, 108, '2025-11-21', 3.7);

