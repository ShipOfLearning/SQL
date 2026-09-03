-- ===========================================
-- MASTER SCRIPT: Orders Table Setup
-- Topic: Find Customers' First Purchase in Last 6 Months
-- ===========================================

IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;
GO

CREATE TABLE dbo.Orders (
    OrderID      INT PRIMARY KEY,
    CustomerID   INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    OrderDate    DATE NOT NULL,
    Amount       DECIMAL(10,2) NOT NULL
);
GO

INSERT INTO dbo.Orders (OrderID, CustomerID, CustomerName, OrderDate, Amount) VALUES
(1,  101, 'Amit Sharma',   '2022-01-15',                                2500.00),
(2,  101, 'Amit Sharma',   '2023-06-10',                                1800.00),
(3,  102, 'Priya Verma',   DATEADD(MONTH, -4, CAST(GETDATE() AS DATE)), 3200.00),
(4,  102, 'Priya Verma',   DATEADD(MONTH, -2, CAST(GETDATE() AS DATE)), 1500.00),
(5,  103, 'Rohit Singh',   '2021-05-20',                                4000.00),
(6,  103, 'Rohit Singh',   DATEADD(MONTH, -1, CAST(GETDATE() AS DATE)), 2200.00),
(7,  104, 'Sneha Patel',   DATEADD(DAY,  -45, CAST(GETDATE() AS DATE)), 5000.00),
(8,  105, 'Karan Mehta',   '2020-11-11',                                1200.00),
(9,  105, 'Karan Mehta',   DATEADD(MONTH, -3, CAST(GETDATE() AS DATE)),  900.00),
(10, 106, 'Ananya Gupta',  DATEADD(DAY,  -10, CAST(GETDATE() AS DATE)), 3300.00);
GO

-- Quick check
SELECT * FROM dbo.Orders ORDER BY CustomerID, OrderDate;