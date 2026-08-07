CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

CREATE TABLE Sales
(
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Products
VALUES
(101,'Laptop','Electronics'),
(102,'Mouse','Electronics'),
(103,'Keyboard','Electronics'),
(104,'Monitor','Electronics'),
(105,'Printer','Office');

INSERT INTO Sales
VALUES
(1,101,5,'2026-07-01'),
(2,102,12,'2026-07-01'),
(3,103,8,'2026-07-02'),
(4,102,10,'2026-07-03'),
(5,101,7,'2026-07-03'),
(6,104,15,'2026-07-04'),
(7,105,3,'2026-07-04'),
(8,104,8,'2026-07-05'),
(9,103,10,'2026-07-05'),
(10,101,6,'2026-07-06'),
(11,105,9,'2026-07-06'),
(12,102,4,'2026-07-06');