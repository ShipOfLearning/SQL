-- Drop tables if they already exist
--DROP TABLE IF EXISTS Sales;
--DROP TABLE IF EXISTS Products;


-- Products Master Table
CREATE TABLE Products
(
    ProductID   INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price       DECIMAL(10,2) NOT NULL
);


-- Sales Transaction Table
CREATE TABLE Sales
(
    SaleID      INT PRIMARY KEY,
    ProductID   INT NOT NULL,
    SaleDate    DATE NOT NULL,
    Quantity    INT NOT NULL,

    CONSTRAINT FK_Sales_Products
        FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);

INSERT INTO Products
(
    ProductID,
    ProductName,
    Price
)
VALUES
(101, 'Laptop',   75000.00),
(102, 'Mouse',     1200.00),
(103, 'Keyboard',  2500.00),
(104, 'Printer', 15000.00),
(105, 'Monitor',  22000.00),
(106, 'Webcam',    4500.00),
(107, 'Headset',   3500.00);


INSERT INTO Sales
(
    SaleID,
    ProductID,
    SaleDate,
    Quantity
)
VALUES
(501, 101, '2026-07-01', 2),
(502, 102, '2026-07-02', 5),
(503, 103, '2026-07-03', 3),
(504, 101, '2026-07-05', 1),
(505, 102, '2026-07-06', 2);