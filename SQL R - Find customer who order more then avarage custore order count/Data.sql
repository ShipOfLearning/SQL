/*================================================================
  SHIP OF LEARNING
  Topic   : Find Customers Who Order More Than the Average 
            CustomerOrder Count (Asked in Google SQL Interview)
================================================================ */

-- =========================================================================
-- STEP 0: SAFE RE-RUN GUARDS
-- =========================================================================
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
GO

-- =========================================================================
-- STEP 1: TABLE CREATION WITH DELIBERATE EDGE-CASE DATA
-- =========================================================================
CREATE TABLE dbo.Customers
(
    CustomerID   INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);
GO

CREATE TABLE dbo.Orders
(
    OrderID     INT PRIMARY KEY,
    CustomerID  INT NULL,         -- Nullable on purpose: guest checkout edge case
    OrderDate   DATE NOT NULL,
    Amount      DECIMAL(10,2) NOT NULL
);
GO

INSERT INTO dbo.Customers (CustomerID, CustomerName) VALUES
(1, 'Rahul Sharma'),
(2, 'Priya Verma'),
(3, 'Amit Singh'),
(4, 'Sneha Iyer'),
(5, 'Vikram Nair'),
(6, 'Neha Gupta');    -- Edge case: customer with ZERO orders
GO

INSERT INTO dbo.Orders (OrderID, CustomerID, OrderDate, Amount) VALUES
-- Rahul Sharma: 5 orders (highest, above average)
(101, 1, '2025-01-05', 1200.00),
(102, 1, '2025-01-06', 800.00),
(103, 1, '2025-02-10', 500.00),
(104, 1, '2025-02-10', 500.00),   -- Edge case: same-day duplicate order
(105, 1, '2025-03-01', 950.00),
-- Priya Verma: 3 orders
(106, 2, '2025-01-15', 400.00),
(107, 2, '2025-02-20', 600.00),
(108, 2, '2025-03-05', 700.00),
-- Amit Singh: 3 orders
(109, 3, '2025-01-18', 300.00),
(110, 3, '2025-02-22', 250.00),
(111, 3, '2025-03-11', 900.00),
-- Sneha Iyer: 1 order (single-order edge case)
(112, 4, '2025-02-01', 1500.00),
-- Vikram Nair: 2 orders
(113, 5, '2025-01-25', 350.00),
(114, 5, '2025-03-15', 450.00),
-- Guest checkout: NULL CustomerID edge case (must be excluded from analysis)
(115, NULL, '2025-03-20', 200.00);
GO
