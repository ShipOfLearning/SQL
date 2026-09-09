/*=========================================================
  SHIP OF LEARNING (MS SQL Server)
  Topic: Calculate Monthwise Revenue from New Customers 
  Asked at: Microsoft 
==========================================================*/

-- STEP 1: Safe re-run guard
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;
GO

-- STEP 2: Create table
CREATE TABLE dbo.Orders
(
    OrderID      INT PRIMARY KEY,
    CustomerID   INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    OrderDate    DATE NOT NULL,
    Amount       DECIMAL(10,2) NULL   -- NULL allowed to test edge case
);
GO

-- STEP 3: Insert data with deliberate edge cases
INSERT INTO dbo.Orders (OrderID, CustomerID, CustomerName, OrderDate, Amount) VALUES
-- CustomerA: first order in Jan, repeat order in Feb (existing customer in Feb)
(1, 101, 'Rohan Mehta',   '2025-01-05', 500.00),
(2, 101, 'Rohan Mehta',   '2025-02-10', 300.00),

-- CustomerB: single new order in Jan only
(3, 102, 'Priya Sharma',  '2025-01-08', 750.00),

-- CustomerC: EDGE CASE - two orders on the SAME day (their very first day)
-- This is the trap: MIN(OrderDate) filter will match BOTH rows
(4, 103, 'Amit Verma',    '2025-01-12', 400.00),
(5, 103, 'Amit Verma',    '2025-01-12', 200.00),

-- CustomerD: EDGE CASE - NULL amount on first order (tests SUM/NULL handling)
(6, 104, 'Sneha Kulkarni','2025-02-02', NULL),

-- CustomerE: new customer only in Feb
(7, 105, 'Karan Joshi',   '2025-02-15', 900.00),

-- CustomerA continues buying in March (should NOT count as new again)
(8, 101, 'Rohan Mehta',   '2025-03-01', 250.00);
GO
