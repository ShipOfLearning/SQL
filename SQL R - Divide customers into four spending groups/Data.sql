--===============================================================================
-- Channel : Ship of Learning - Meta 
-- Topic   : Divide Customers Into Four Spending Groups
--===============================================================================
SET NOCOUNT ON;
GO

/*
STEP 1: DROP EXISTING TABLES IF THEY EXIST
Drop Orders first because it references Customers.
*/

IF OBJECT_ID(N'dbo.Orders', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Orders;
END;
GO

IF OBJECT_ID(N'dbo.Customers', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Customers;
END;
GO

/*
STEP 2: CREATE CUSTOMERS TABLE
*/

CREATE TABLE dbo.Customers
(
    CustomerID   INT           NOT NULL PRIMARY KEY,
    CustomerName VARCHAR(100)  NOT NULL
);
GO

/*
STEP 3: CREATE ORDERS TABLE
*/

CREATE TABLE dbo.Orders
(
    OrderID     INT            NOT NULL PRIMARY KEY,
    CustomerID  INT            NOT NULL,
    OrderAmount DECIMAL(12, 2) NOT NULL,
    OrderStatus VARCHAR(20)    NOT NULL,

    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customers(CustomerID),

    CONSTRAINT CK_Orders_OrderAmount
        CHECK (OrderAmount >= 0)
);
GO

/*
STEP 4: INSERT CUSTOMERS

Customer 8 has no orders.
Customer 7 has only a cancelled order.
Both should have zero qualifying spending.
*/

INSERT INTO dbo.Customers (CustomerID, CustomerName)
VALUES
    (1, 'Aarav'),
    (2, 'Diya'),
    (3, 'Kabir'),
    (4, 'Meera'),
    (5, 'Rohan'),
    (6, 'Anaya'),
    (7, 'Vivaan'),
    (8, 'Isha');
GO

/*
STEP 5: INSERT ORDERS

Customer 1: 10000 + 0? No; total is 10000.
Customer 2:  9000
Customer 3:  8000
Customer 4:  7000
Customer 5:  6000
Customer 6:  5000
Customer 7:  Cancelled order only
Customer 8:  No orders

Cancelled orders must not contribute to total spending.
*/

INSERT INTO dbo.Orders
    (OrderID, CustomerID, OrderAmount, OrderStatus)
VALUES
    (101, 1, 6000.00, 'Completed'),
    (102, 1, 4000.00, 'Completed'),

    (103, 2, 9000.00, 'Completed'),

    (104, 3, 5000.00, 'Completed'),
    (105, 3, 3000.00, 'Completed'),

    (106, 4, 7000.00, 'Completed'),

    (107, 5, 6000.00, 'Completed'),

    (108, 6, 5000.00, 'Completed'),

    (109, 7, 12000.00, 'Cancelled');
GO

/*
STEP 6: VERIFY MASTER DATA
*/

SELECT *
FROM dbo.Customers
ORDER BY CustomerID;

SELECT *
FROM dbo.Orders
ORDER BY OrderID;
GO
