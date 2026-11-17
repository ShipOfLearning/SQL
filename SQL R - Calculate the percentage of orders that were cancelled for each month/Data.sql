/*============================================================
CHANNEL      : SHIP OF LEARNING
TOPIC        : MONTHLY ORDER CANCELLATION PERCENTAGE
============================================================
SECTION 1: DROP TABLE IF IT ALREADY EXISTS
============================================================*/

IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Orders;
END;
GO

/*============================================================
SECTION 2: CREATE ORDERS TABLE
============================================================*/

CREATE TABLE dbo.Orders
(
    OrderID       INT           NOT NULL PRIMARY KEY,
    OrderDate     DATE          NOT NULL,
    CustomerName  VARCHAR(100)  NOT NULL,
    OrderAmount   DECIMAL(12,2) NOT NULL,
    Status        VARCHAR(20)   NOT NULL,

    CONSTRAINT CK_Orders_Status
    CHECK (Status IN
    ('Pending', 'Delivered', 'Cancelled'))
);
GO

/*============================================================
SECTION 3: INSERT MASTER DATA
============================================================*/

INSERT INTO dbo.Orders
(
    OrderID,
    OrderDate,
    CustomerName,
    OrderAmount,
    Status
)
VALUES

-- JANUARY 2025
(101, '20250105', 'Rahul',  2500.00, 'Delivered'),
(102, '20250108', 'Amit',   1800.00, 'Cancelled'),
(103, '20250115', 'Priya',  3200.00, 'Pending'),
(104, '20250125', 'Neha',   1500.00, 'Cancelled'),

-- FEBRUARY 2025
(105, '20250202', 'Karan',  4500.00, 'Delivered'),
(106, '20250207', 'Riya',   2200.00, 'Delivered'),
(107, '20250212', 'Arjun',  3100.00, 'Cancelled'),
(108, '20250219', 'Meera',  2800.00, 'Pending'),
(109, '20250225', 'Vikas',  1900.00, 'Delivered'),

-- MARCH 2025
(110, '20250303', 'Anjali', 5200.00, 'Cancelled'),
(111, '20250309', 'Rohit',  2600.00, 'Delivered'),
(112, '20250317', 'Sneha',  3400.00, 'Cancelled'),
(113, '20250328', 'Manish', 2100.00, 'Pending');
GO

/*============================================================
SECTION 4: VERIFY MASTER DATA
============================================================*/

SELECT *
FROM dbo.Orders
ORDER BY OrderDate, OrderID;
GO
