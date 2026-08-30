IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;
GO
-- ================================
-- TABLE CREATION
-- ================================
CREATE TABLE Orders (
    OrderID     INT PRIMARY KEY,
    Country     VARCHAR(50),
    OrderStatus VARCHAR(20),
    OrderDate   DATE
);

-- ================================
-- SAMPLE DATA INSERTION
-- ================================
INSERT INTO Orders (OrderID, Country, OrderStatus, OrderDate) VALUES
(1,  'India',       'Shipped',   '2024-01-05'),
(2,  'India',       'Delivered', '2024-01-06'),
(3,  'India',       'Delivered', '2024-01-08'),
(4,  'India',       'Shipped',   '2024-01-10'),
(5,  'USA',         'Delivered', '2024-01-04'),
(6,  'USA',         'Shipped',   '2024-01-07'),
(7,  'USA',         'Shipped',   '2024-01-09'),
(8,  'UK',          'Delivered', '2024-01-03'),
(9,  'UK',          'Delivered', '2024-01-11'),
(10, 'UK',          'Shipped',   '2024-01-12'),
(11, 'Australia',   'Shipped',   '2024-01-02'),
(12, 'Australia',   'Delivered', '2024-01-13');