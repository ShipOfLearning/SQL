-- =========================================================
-- SHIP OF LEARNING | SQL Aggregate Functions on Completed Orders
-- Topic: COUNT, MIN, MAX, SUM, AVG for Completed Orders
-- =========================================================

-- STEP 1: Clean setup (safe to re-run anytime)
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;
GO

CREATE TABLE dbo.Orders
(
    OrderID       INT PRIMARY KEY,
    CustomerID    INT           NOT NULL,
    CustomerName  VARCHAR(50)   NOT NULL,
    OrderDate     DATE          NOT NULL,
    OrderAmount   DECIMAL(10,2) NULL,      -- Intentionally nullable to expose NULL trap
    OrderStatus   VARCHAR(20)   NOT NULL   -- Completed / Pending / Cancelled
);
GO

-- STEP 2: Insert sample data with deliberate edge cases
-- Edge cases included:
--   1) NULL OrderAmount on a "Completed" order (row 5)  -> tests COUNT(*) vs COUNT(column)
--   2) Duplicate CustomerName with different CustomerID (Rahul Sharma) -> tests grouping traps
--   3) Boundary values: smallest (1.00) and largest (99999.99) order amount
--   4) Zero amount order (refund/free order edge case)
--   5) Mixed statuses (Completed, Pending, Cancelled) to test WHERE filtering

INSERT INTO dbo.Orders (OrderID, CustomerID, CustomerName, OrderDate, OrderAmount, OrderStatus) VALUES
(1,  101, 'Rahul Sharma',   '2024-01-05',    1499.00, 'Completed'),
(2,  102, 'Priya Verma',    '2024-01-06',    2999.50, 'Completed'),
(3,  103, 'Amit Singh',     '2024-01-07',      99999.99, 'Completed'),  -- max boundary
(4,  104, 'Neha Gupta',     '2024-01-08',       1.00, 'Completed'),     -- min boundary
(5,  105, 'Karan Mehta',    '2024-01-09',       NULL, 'Completed'),     -- NULL amount, still completed
(6,  106, 'Sneha Iyer',     '2024-01-10',       0.00, 'Completed'),     -- zero value order (refund case)
(7,  107, 'Rahul Sharma',   '2024-01-11',    3499.00, 'Completed'),     -- duplicate name, diff CustomerID
(8,  108, 'Vikas Rao',      '2024-01-12',    5200.00, 'Pending'),       -- should be excluded
(9,  109, 'Anjali Nair',    '2024-01-13',    1800.00, 'Cancelled'),     -- should be excluded
(10, 110, 'Rohan Das',      '2024-01-14',    2750.00, 'Completed'),
(11, 111, 'Divya Kapoor',   '2024-01-15',    4100.00, 'Pending'),       -- should be excluded
(12, 112, 'Manish Joshi',   '2024-01-16',    6650.00, 'Completed'),
(13, 113, 'Pooja Desai',    '2024-01-17',       NULL, 'Pending'),       -- NULL + not completed
(14, 114, 'Arjun Malhotra', '2024-01-18',    8200.00, 'Cancelled'),
(15, 115, 'Kavita Reddy',   '2024-01-19',    3999.00, 'Completed');
GO
