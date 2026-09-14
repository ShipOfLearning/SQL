-- =========================================================
-- SHIP OF LEARNING | TCS SQL Interview Question
-- Topic: Find MIN and MAX Order Value with Full Order Details
-- Environment: MS SQL Server (T-SQL)
-- =========================================================

-- STEP 1: Clean setup (production-safe, re-runnable)
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;
GO

CREATE TABLE dbo.Orders
(
    OrderID       INT PRIMARY KEY,
    CustomerID    INT NOT NULL,
    CustomerName  VARCHAR(50) NOT NULL,
    OrderDate     DATE NOT NULL,
    OrderValue    DECIMAL(10,2) NULL   -- Nullable on purpose (edge case)
);
GO

-- STEP 2: Insert data with DELIBERATE edge cases
-- -> Tied MAX values (9800.00 appears twice)
-- -> Tied MIN values (450.00 appears twice)
-- -> One NULL OrderValue (to test aggregate NULL-handling)
INSERT INTO dbo.Orders (OrderID, CustomerID, CustomerName, OrderDate, OrderValue) VALUES
(1,  101, 'Rahul',   '2024-01-05', 2500.00),
(2,  102, 'Priya',   '2024-01-06', 1200.00),
(3,  103, 'Amit',    '2024-01-07', 9800.00),  -- MAX (tied)
(4,  104, 'Sneha',   '2024-01-08', 9800.00),  -- MAX (tied)
(5,  105, 'Vikram',  '2024-01-09', 450.00),   -- MIN (tied)
(6,  106, 'Neha',    '2024-01-10', 450.00),   -- MIN (tied)
(7,  107, 'Karan',   '2024-01-11', 3200.00),
(8,  108, 'Pooja',   '2024-01-12', 5600.00),
(9,  109, 'Arjun',   '2024-01-13', NULL),     -- Edge case: NULL value
(10, 110, 'Divya',   '2024-01-14', 7800.00),
(11, 111, 'Rohan',   '2024-01-15', 6200.00),
(12, 112, 'Simran',  '2024-01-16', 8100.00);
GO

SELECT * FROM dbo.Orders;