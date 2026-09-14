-- =========================================================
-- MASTER DATA SETUP: Customers & Orders
-- =========================================================
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
    DROP TABLE dbo.Customers;
GO
CREATE TABLE Customers (
    CustomerID  INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;
GO
CREATE TABLE Orders (
    OrderID      INT PRIMARY KEY,
    CustomerID   INT NULL,          -- Nullable on purpose to demonstrate the NULL trap
    OrderAmount  DECIMAL(10,2)
);

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Aarav Sharma'),
(2, 'Priya Verma'),
(3, 'Rohan Mehta'),
(4, 'Sneha Kapoor'),
(5, 'Vikram Singh');

INSERT INTO Orders (OrderID, CustomerID, OrderAmount) VALUES
(101, 1, 2500.00),
(102, 1, 1200.00),
(103, 2, 4300.00),
(104, 3, 999.00),
(105, NULL, 750.00);   -- Orphan/unlinked order row -- this NULL is the trap
