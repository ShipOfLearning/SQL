-------------------------------------------------------
-- SHIP OF LEARNING | SQL Interview Series
-- Topic: Get Latest Order Placed by Each Customer
-------------------------------------------------------

-- STEP 1: Clean up existing tables (safe re-run)
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;

IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
    DROP TABLE dbo.Customers;
GO

-- STEP 2: Create Customers table
CREATE TABLE dbo.Customers
(
    CustomerID   INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);
GO

-- STEP 3: Create Orders table
CREATE TABLE dbo.Orders
(
    OrderID     INT PRIMARY KEY,
    CustomerID  INT NOT NULL,
    OrderDate   DATE NULL,          -- Edge case: allow NULL to test handling
    Amount      DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customers(CustomerID)
);
GO

-- STEP 4: Insert sample Customers (includes duplicate name edge case)
INSERT INTO dbo.Customers (CustomerID, CustomerName) VALUES
(1, 'Rahul Sharma'),
(2, 'Priya Verma'),
(3, 'Amit Patel'),
(4, 'Rahul Sharma'),   -- Edge case: duplicate customer name, different ID
(5, 'Sneha Iyer');
GO

-- STEP 5: Insert sample Orders (includes tie dates, NULL date, single-order customer)
INSERT INTO dbo.Orders (OrderID, CustomerID, OrderDate, Amount) VALUES
(101, 1, '2025-01-10', 2500.00),
(102, 1, '2025-03-15', 4200.00),
(103, 1, '2025-03-15', 1800.00),   -- Edge case: TIE with OrderID 102 on same date
(104, 2, '2025-02-20', 3000.00),
(105, 3, NULL,         1200.00),   -- Edge case: NULL OrderDate
(106, 3, '2025-04-01', 2200.00),
(107, 4, '2025-05-05', 5000.00),   -- Edge case: duplicate name customer
(108, 5, '2025-01-01', 900.00);    -- Edge case: customer with only 1 order
GO