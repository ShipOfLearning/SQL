--=============================================================
--CHANNEL : SHIP OF LEARNING AMAZON
--TOPIC   : FIND PRODUCTS NEVER INCLUDED IN A COMPLETED ORDER
--=============================================================
-- =========================================================
-- STEP 1: CLEANUP EXISTING TABLES
-- Drop child table before parent table.
-- =========================================================

IF OBJECT_ID('dbo.OrderItems', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.OrderItems;
END;

IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Products;
END;


-- =========================================================
-- STEP 2: CREATE PRODUCTS TABLE
-- =========================================================

CREATE TABLE dbo.Products
(
    ProductID INT NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,

    CONSTRAINT PK_Products
        PRIMARY KEY (ProductID),

    CONSTRAINT CK_Products_Price
        CHECK (Price >= 0)
);


-- =========================================================
-- STEP 3: CREATE ORDERITEMS TABLE
-- =========================================================

CREATE TABLE dbo.OrderItems
(
    OrderItemID INT NOT NULL,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    OrderDate DATE NOT NULL,

    CONSTRAINT PK_OrderItems
        PRIMARY KEY (OrderItemID),

    CONSTRAINT FK_OrderItems_Products
        FOREIGN KEY (ProductID)
        REFERENCES dbo.Products(ProductID),

    CONSTRAINT CK_OrderItems_Status
        CHECK
        (
            OrderStatus IN
            (
                'Completed',
                'Cancelled',
                'Pending'
            )
        )
);


-- =========================================================
-- STEP 4: INSERT PRODUCTS
-- =========================================================

INSERT INTO dbo.Products
(
    ProductID,
    ProductName,
    Category,
    Price
)
VALUES
(101, 'Laptop',        'Electronics', 75000.00),
(102, 'Mouse',         'Accessories',  1200.00),
(103, 'Keyboard',      'Accessories',  2500.00),
(104, 'Monitor',       'Electronics', 18000.00),
(105, 'Headphones',    'Electronics',  4500.00),
(106, 'Webcam',        'Electronics',  3200.00),
(107, 'USB Hub',       'Accessories',  1500.00),
(108, 'Mechanical Pad','Accessories',   900.00);


-- =========================================================
-- STEP 5: INSERT ORDER ITEMS
-- =========================================================

INSERT INTO dbo.OrderItems
(
    OrderItemID,
    OrderID,
    ProductID,
    OrderStatus,
    OrderDate
)
VALUES

-- Laptop: Completed orders
(1, 1001, 101, 'Completed', '2026-01-01'),
(2, 1002, 101, 'Completed', '2026-01-05'),

-- Mouse: Cancelled and Completed
(3, 1003, 102, 'Cancelled', '2026-01-06'),
(4, 1004, 102, 'Completed', '2026-01-08'),

-- Keyboard: Only Pending
(5, 1005, 103, 'Pending', '2026-01-09'),

-- Monitor: Only Cancelled
(6, 1006, 104, 'Cancelled', '2026-01-10'),

-- Headphones: Completed
(7, 1007, 105, 'Completed', '2026-01-11'),

-- Webcam: Cancelled and Pending
(8, 1008, 106, 'Cancelled', '2026-01-12'),
(9, 1009, 106, 'Pending', '2026-01-13'),

-- USB Hub: Completed and Cancelled
(10, 1010, 107, 'Completed', '2026-01-14'),
(11, 1011, 107, 'Cancelled', '2026-01-15');


-- =========================================================
-- STEP 6: VERIFY MASTER DATA
-- =========================================================

SELECT *
FROM dbo.Products
ORDER BY ProductID;

SELECT *
FROM dbo.OrderItems
ORDER BY OrderItemID;


-- =========================================================
-- END OF MASTER DATA SCRIPT
-- SHIP OF LEARNING
-- =========================================================