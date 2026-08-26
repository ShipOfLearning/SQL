-- ============================
-- TABLE CREATION
-- ============================
CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price       DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID     INT PRIMARY KEY,
    ProductID  INT,
    SaleDate   DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- ============================
-- SAMPLE DATA
-- ============================
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Wireless Mouse',       799.00),
(2, 'Mechanical Keyboard', 2499.00),
(3, 'USB-C Hub',           1299.00),
(4, 'Laptop Stand',         999.00);

INSERT INTO Sales (SaleID, ProductID, SaleDate) VALUES
(101, 1, '2023-03-15'),
(102, 2, '2023-07-22'),
(103, 1, '2024-01-10'),
(104, 3, '2024-05-05'),
(105, 4, '2024-11-18'),
(106, 2, '2025-02-09');