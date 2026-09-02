/* ============================================================
   SHIP OF LEARNING — SQL SERVER TUTORIAL
   TOPIC: Find Customers with 5 or More Consecutive Login Days
   PATTERN: Gaps and Islands (Classic Interview Problem)
   ============================================================ */

-- ============================================================
-- STEP 1: TABLE SETUP (with guard to allow safe re-run)
-- ============================================================
IF OBJECT_ID('dbo.CustomerLogins', 'U') IS NOT NULL
    DROP TABLE dbo.CustomerLogins;
GO

CREATE TABLE dbo.CustomerLogins (
    LoginID      INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID   INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    LoginDate    DATE NULL       -- NULL allowed to test edge case handling
);
GO

-- ============================================================
-- STEP 2: DATA INSERTION (deliberate edge cases included)
-- ============================================================
INSERT INTO dbo.CustomerLogins (CustomerID, CustomerName, LoginDate) VALUES
-- Customer 101: exactly 5 consecutive days -> SHOULD QUALIFY (boundary case)
(101,'Rahul Sharma','2024-01-01'),
(101,'Rahul Sharma','2024-01-02'),
(101,'Rahul Sharma','2024-01-03'),
(101,'Rahul Sharma','2024-01-04'),
(101,'Rahul Sharma','2024-01-05'),

-- Customer 102: 7 consecutive days -> SHOULD QUALIFY (longer than minimum)
(102,'Priya Verma','2024-01-10'),
(102,'Priya Verma','2024-01-11'),
(102,'Priya Verma','2024-01-12'),
(102,'Priya Verma','2024-01-13'),
(102,'Priya Verma','2024-01-14'),
(102,'Priya Verma','2024-01-15'),
(102,'Priya Verma','2024-01-16'),

-- Customer 103: 4 days + gap + 3 days -> SHOULD NOT QUALIFY (common trap!)
(103,'Amit Singh','2024-01-01'),
(103,'Amit Singh','2024-01-02'),
(103,'Amit Singh','2024-01-03'),
(103,'Amit Singh','2024-01-04'),
(103,'Amit Singh','2024-01-07'),
(103,'Amit Singh','2024-01-08'),
(103,'Amit Singh','2024-01-09'),

-- Customer 104: duplicate same-day logins -> SHOULD QUALIFY after DISTINCT
(104,'Sneha Patel','2024-02-01'),
(104,'Sneha Patel','2024-02-01'),  -- duplicate session same day
(104,'Sneha Patel','2024-02-02'),
(104,'Sneha Patel','2024-02-03'),
(104,'Sneha Patel','2024-02-03'),  -- duplicate session same day
(104,'Sneha Patel','2024-02-04'),
(104,'Sneha Patel','2024-02-05'),

-- Customer 105: only 3 consecutive days -> SHOULD NOT QUALIFY
(105,'Karan Mehta','2024-01-01'),
(105,'Karan Mehta','2024-01-02'),
(105,'Karan Mehta','2024-01-03'),

-- Customer 106: NULL LoginDate row present -> SHOULD QUALIFY, NULL ignored
(106,'Neha Joshi', NULL),
(106,'Neha Joshi','2024-03-01'),
(106,'Neha Joshi','2024-03-02'),
(106,'Neha Joshi','2024-03-03'),
(106,'Neha Joshi','2024-03-04'),
(106,'Neha Joshi','2024-03-05'),

-- Customer 107: streak spans month boundary -> SHOULD QUALIFY (date math trap)
(107,'Vikram Rao','2024-01-30'),
(107,'Vikram Rao','2024-01-31'),
(107,'Vikram Rao','2024-02-01'),
(107,'Vikram Rao','2024-02-02'),
(107,'Vikram Rao','2024-02-03');
GO