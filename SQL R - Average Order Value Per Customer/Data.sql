/* ============================================================
   TOPIC: Average Order Value Per Customer (Customers with > 7 Orders)
   ASKED IN: Flipkart SQL Interview
   PLATFORM: MS SQL Server (T-SQL)
   ============================================================ */

-- ============================================================
-- STEP 1: TABLE CREATION
-- ============================================================
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;

CREATE TABLE dbo.Orders (
    OrderID       INT PRIMARY KEY,
    CustomerID    INT NOT NULL,
    CustomerName  VARCHAR(50) NOT NULL,
    OrderDate     DATE NOT NULL,
    OrderAmount   DECIMAL(10,2) NULL   -- NULL allowed deliberately (edge case)
);
GO

-- ============================================================
-- STEP 2: DATA INSERTION (WITH DELIBERATE EDGE CASES)
-- CustomerID 1 (Rahul)  -> 8 orders  -> QUALIFIES (> 7)
-- CustomerID 2 (Priya)  -> 7 orders  -> BOUNDARY, EXCLUDED (not > 7)
-- CustomerID 3 (Amit)   -> 9 orders  -> QUALIFIES, includes 1 NULL amount
-- CustomerID 4 (Sneha)  -> 3 orders  -> EXCLUDED (too few orders)
-- CustomerID 5 (Rahul)  -> 8 orders  -> QUALIFIES, duplicate CustomerName as ID 1
-- CustomerID 6 (Neha)   -> 6 orders  -> EXCLUDED (close to boundary)
-- ============================================================

INSERT INTO dbo.Orders (OrderID, CustomerID, CustomerName, OrderDate, OrderAmount) VALUES
-- Rahul (CustomerID 1) - 8 orders
(1,  1, 'Rahul',  '2025-01-02', 1200.00),
(2,  1, 'Rahul',  '2025-01-10', 1500.50),
(3,  1, 'Rahul',  '2025-01-15',  980.00),
(4,  1, 'Rahul',  '2025-02-01', 2100.00),
(5,  1, 'Rahul',  '2025-02-10', 1750.25),
(6,  1, 'Rahul',  '2025-02-20', 1300.00),
(7,  1, 'Rahul',  '2025-03-01', 1600.00),
(8,  1, 'Rahul',  '2025-03-15', 1450.00),

-- Priya (CustomerID 2) - exactly 7 orders (BOUNDARY CASE)
(9,  2, 'Priya',  '2025-01-05',  800.00),
(10, 2, 'Priya',  '2025-01-12',  950.00),
(11, 2, 'Priya',  '2025-01-25', 1100.00),
(12, 2, 'Priya',  '2025-02-05', 1250.00),
(13, 2, 'Priya',  '2025-02-18',  900.00),
(14, 2, 'Priya',  '2025-03-01', 1050.00),
(15, 2, 'Priya',  '2025-03-10',  875.00),

-- Amit (CustomerID 3) - 9 orders, includes one NULL amount (EDGE CASE)
(16, 3, 'Amit',   '2025-01-03', 2200.00),
(17, 3, 'Amit',   '2025-01-14', 1980.00),
(18, 3, 'Amit',   '2025-01-22',  NULL),      -- order placed, amount not recorded
(19, 3, 'Amit',   '2025-02-02', 2450.00),
(20, 3, 'Amit',   '2025-02-14', 2100.00),
(21, 3, 'Amit',   '2025-02-25', 1875.00),
(22, 3, 'Amit',   '2025-03-05', 2300.00),
(23, 3, 'Amit',   '2025-03-16', 1990.00),
(24, 3, 'Amit',   '2025-03-28', 2050.00),

-- Sneha (CustomerID 4) - 3 orders (too few, EXCLUDED)
(25, 4, 'Sneha',  '2025-01-08',  650.00),
(26, 4, 'Sneha',  '2025-02-11',  720.00),
(27, 4, 'Sneha',  '2025-03-20',  680.00),

-- Rahul (CustomerID 5) - different Rahul, 8 orders (DUPLICATE NAME EDGE CASE)
(28, 5, 'Rahul',  '2025-01-04', 3200.00),
(29, 5, 'Rahul',  '2025-01-16', 2950.00),
(30, 5, 'Rahul',  '2025-01-27', 3100.00),
(31, 5, 'Rahul',  '2025-02-07', 2800.00),
(32, 5, 'Rahul',  '2025-02-19', 3050.00),
(33, 5, 'Rahul',  '2025-03-02', 2900.00),
(34, 5, 'Rahul',  '2025-03-14', 3150.00),
(35, 5, 'Rahul',  '2025-03-26', 3000.00),

-- Neha (CustomerID 6) - 6 orders (close to boundary, EXCLUDED)
(36, 6, 'Neha',   '2025-01-09', 1100.00),
(37, 6, 'Neha',   '2025-01-20', 1250.00),
(38, 6, 'Neha',   '2025-02-03',  990.00),
(39, 6, 'Neha',   '2025-02-16', 1180.00),
(40, 6, 'Neha',   '2025-03-01', 1020.00),
(41, 6, 'Neha',   '2025-03-19', 1150.00);
GO