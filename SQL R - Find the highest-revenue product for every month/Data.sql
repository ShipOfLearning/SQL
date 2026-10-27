--=============================================================
-- Channel : Ship of Learning - Amazon
-- Topic   : Find the Highest-Revenue Product for Every Month
--=============================================================

SET NOCOUNT ON;

-------------------------------------------------------------
-- STEP 1: Drop existing tables, if they exist
-- Drop child table before parent table because of the FK.
-------------------------------------------------------------

IF OBJECT_ID(N'dbo.OrderItems', N'U') IS NOT NULL
    DROP TABLE dbo.OrderItems;

IF OBJECT_ID(N'dbo.Orders', N'U') IS NOT NULL
    DROP TABLE dbo.Orders;

-------------------------------------------------------------
-- STEP 2: Create Orders table
-------------------------------------------------------------

CREATE TABLE dbo.Orders
(
    OrderID   INT          NOT NULL PRIMARY KEY,
    OrderDate DATE         NOT NULL
);

-------------------------------------------------------------
-- STEP 3: Create OrderItems table
-------------------------------------------------------------

CREATE TABLE dbo.OrderItems
(
    OrderItemID INT            NOT NULL PRIMARY KEY,
    OrderID     INT            NOT NULL,
    ProductID   INT            NOT NULL,
    ProductName VARCHAR(100)   NOT NULL,
    Quantity    INT            NOT NULL,
    UnitPrice   DECIMAL(12, 2) NOT NULL,

    CONSTRAINT FK_OrderItems_Orders
        FOREIGN KEY (OrderID)
        REFERENCES dbo.Orders(OrderID),

    CONSTRAINT CK_OrderItems_Quantity
        CHECK (Quantity > 0),

    CONSTRAINT CK_OrderItems_UnitPrice
        CHECK (UnitPrice >= 0)
);

-------------------------------------------------------------
-- STEP 4: Insert orders across three months
-------------------------------------------------------------

INSERT INTO dbo.Orders (OrderID, OrderDate)
VALUES
    (1,  '2026-01-05'),
    (2,  '2026-01-12'),
    (3,  '2026-01-20'),
    (4,  '2026-02-03'),
    (5,  '2026-02-14'),
    (6,  '2026-02-22'),
    (7,  '2026-03-02'),
    (8,  '2026-03-10'),
    (9,  '2026-03-18'),
    (10, '2026-03-25');

-------------------------------------------------------------
-- STEP 5: Insert order items
-- Product revenue = Quantity * UnitPrice
-------------------------------------------------------------

INSERT INTO dbo.OrderItems
(
    OrderItemID,
    OrderID,
    ProductID,
    ProductName,
    Quantity,
    UnitPrice
)
VALUES
    -- JANUARY
    (1,  1, 101, 'Laptop',     2, 50000.00),
    (2,  1, 102, 'Phone',      3, 20000.00),
    (3,  2, 101, 'Laptop',     1, 50000.00),
    (4,  2, 102, 'Phone',      5, 20000.00),
    (5,  3, 103, 'Headphones', 10, 2000.00),

    -- FEBRUARY
    (6,  4, 101, 'Laptop',     2, 50000.00),
    (7,  4, 102, 'Phone',      2, 20000.00),
    (8,  5, 101, 'Laptop',     1, 50000.00),
    (9,  5, 102, 'Phone',      2, 20000.00),
    (10, 6, 103, 'Headphones', 5, 2000.00),
    (11, 6, 104, 'Monitor',    3, 15000.00),

    -- MARCH
    (12, 7, 102, 'Phone',      3, 20000.00),
    (13, 7, 104, 'Monitor',    4, 15000.00),
    (14, 8, 102, 'Phone',      3, 20000.00),
    (15, 8, 104, 'Monitor',    4, 15000.00),
    (16, 9, 101, 'Laptop',     1, 50000.00),
    (17, 9, 103, 'Headphones', 10, 2000.00),
    (18, 10, 101, 'Laptop',   1, 50000.00);

-------------------------------------------------------------
-- STEP 6: Verify the inserted master data
-------------------------------------------------------------

SELECT *
FROM dbo.Orders
ORDER BY OrderDate, OrderID;

SELECT *
FROM dbo.OrderItems
ORDER BY OrderID, OrderItemID;

