-- ============================================
-- SHIP OF LEARNING — MASTER SCRIPT
-- Topic: Products Priced Above Category Average
-- ============================================
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
    DROP TABLE dbo.Products;

CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID  INT,
    Price       DECIMAL(10,2)
);

INSERT INTO Products (ProductID, ProductName, CategoryID, Price) VALUES
(1,  'Laptop',        1, 55000),
(2,  'Mouse',         1,   500),
(3,  'Keyboard',      1,  1200),
(4,  'Monitor',       1,  8000),
(5,  'T-Shirt',       2,   600),
(6,  'Jeans',         2,  1500),
(7,  'Jacket',        2,  3000),
(8,  'Shoes',         2,  2000),
(9,  'Sofa',          3, 25000),
(10, 'Dining Table',  3, 18000),
(11, 'Chair',         3,  3000),
(12, 'Bed',           3, 30000);