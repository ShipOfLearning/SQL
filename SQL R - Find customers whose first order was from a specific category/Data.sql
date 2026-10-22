--============================================================
--CHANNEL : Ship of Learning
--TOPIC   : Find Customers Whose First Order Was From a
--          Specific Category in Microsoft SQL Server
--CATEGORY: Electronics
--============================================================
------------------------------------------------------------
-- 1. DROP EXISTING TABLES, CHILD TABLES FIRST
------------------------------------------------------------

IF OBJECT_ID(N'dbo.OrderItems', N'U') IS NOT NULL
    DROP TABLE dbo.OrderItems;

IF OBJECT_ID(N'dbo.Orders', N'U') IS NOT NULL
    DROP TABLE dbo.Orders;

IF OBJECT_ID(N'dbo.Products', N'U') IS NOT NULL
    DROP TABLE dbo.Products;

IF OBJECT_ID(N'dbo.Customers', N'U') IS NOT NULL
    DROP TABLE dbo.Customers;

------------------------------------------------------------
-- 2. CREATE TABLES
------------------------------------------------------------

CREATE TABLE dbo.Customers
(
    CustomerID   INT           NOT NULL PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL
);

CREATE TABLE dbo.Products
(
    ProductID   INT           NOT NULL PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Category    NVARCHAR(50)  NOT NULL
);

CREATE TABLE dbo.Orders
(
    OrderID    INT          NOT NULL PRIMARY KEY,
    CustomerID INT          NOT NULL,
    OrderDate  DATETIME2(0) NOT NULL,

    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customers(CustomerID)
);

CREATE TABLE dbo.OrderItems
(
    OrderItemID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    OrderID     INT               NOT NULL,
    ProductID   INT               NOT NULL,
    Quantity    INT               NOT NULL,

    CONSTRAINT FK_OrderItems_Orders
        FOREIGN KEY (OrderID)
        REFERENCES dbo.Orders(OrderID),

    CONSTRAINT FK_OrderItems_Products
        FOREIGN KEY (ProductID)
        REFERENCES dbo.Products(ProductID),

    CONSTRAINT CK_OrderItems_Quantity
        CHECK (Quantity > 0)
);

------------------------------------------------------------
-- 3. INSERT MASTER DATA: CUSTOMERS
------------------------------------------------------------

INSERT INTO dbo.Customers (CustomerID, CustomerName)
VALUES
    (1, N'Rahul'),
    (2, N'Priya'),
    (3, N'Amit'),
    (4, N'Neha'),
    (5, N'Karan'),
    (6, N'Sneha'),
    (7, N'Vikram'),
    (8, N'Isha');

------------------------------------------------------------
-- 4. INSERT MASTER DATA: PRODUCTS
------------------------------------------------------------

INSERT INTO dbo.Products (ProductID, ProductName, Category)
VALUES
    (101, N'Laptop',       N'Electronics'),
    (102, N'Smartphone',   N'Electronics'),
    (103, N'Headphones',   N'Electronics'),
    (201, N'Running Shoes',N'Fashion'),
    (202, N'Jacket',       N'Fashion'),
    (301, N'Office Chair', N'Furniture'),
    (302, N'Study Desk',   N'Furniture'),
    (401, N'Coffee Maker', N'Home Appliances');

------------------------------------------------------------
-- 5. INSERT MASTER DATA: ORDERS
------------------------------------------------------------

INSERT INTO dbo.Orders (OrderID, CustomerID, OrderDate)
VALUES
    -- Rahul: First order Fashion; later Electronics
    (1001, 1, '2026-01-05T10:00:00'),
    (1002, 1, '2026-01-12T11:00:00'),

    -- Priya: First order Electronics
    (1003, 2, '2026-01-06T09:00:00'),
    (1004, 2, '2026-01-15T14:00:00'),

    -- Amit: First order Furniture
    (1005, 3, '2026-01-07T12:00:00'),

    -- Neha: First order contains two categories
    (1006, 4, '2026-01-08T10:30:00'),
    (1007, 4, '2026-01-20T13:00:00'),

    -- Karan: First order Electronics
    (1008, 5, '2026-01-09T08:00:00'),

    -- Sneha: First order Fashion; later Electronics
    (1009, 6, '2026-01-10T10:00:00'),
    (1010, 6, '2026-01-18T16:00:00'),

    -- Vikram: First order Electronics
    (1011, 7, '2026-01-11T11:00:00'),

    -- Isha: Has no orders; must not qualify
    -- No row inserted for CustomerID 8

    -- Two different orders for Rahul at the same timestamp.
    -- This dataset does not include this case because OrderID
    -- is being used as the defined deterministic tie-breaker.
    -- Test timestamp ties separately if your business permits them.
    (1012, 2, '2026-01-06T09:00:00');

------------------------------------------------------------
-- 6. INSERT MASTER DATA: ORDER ITEMS
------------------------------------------------------------

INSERT INTO dbo.OrderItems (OrderID, ProductID, Quantity)
VALUES
    -- Rahul's first order: Fashion
    (1001, 201, 1),

    -- Rahul's second order: Electronics
    (1002, 101, 1),

    -- Priya's first order: Electronics
    (1003, 102, 1),

    -- Priya's second order: Fashion
    (1004, 202, 1),

    -- Amit's first order: Furniture
    (1005, 301, 1),

    -- Neha's first order: Electronics + Fashion
    (1006, 103, 1),
    (1006, 201, 1),

    -- Neha's second order: Furniture
    (1007, 302, 1),

    -- Karan's first order: Electronics
    (1008, 101, 1),

    -- Sneha's first order: Fashion
    (1009, 202, 1),

    -- Sneha's second order: Electronics
    (1010, 102, 1),

    -- Vikram's first order: Electronics
    (1011, 103, 2),

    -- Priya's same-timestamp order: Furniture.
    -- OrderID 1003 wins because it is lower.
    (1012, 301, 1);
