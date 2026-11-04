--===============================================================
-- CHANNEL : SHIP OF LEARNING
-- TOPIC   : CALCULATE EACH CUSTOMER'S PERCENTAGE OF
--           TOTAL LIFETIME SPENDING
--===============================================================
---------------------------------------------------------------
-- STEP 1: DROP EXISTING TABLES
---------------------------------------------------------------

-- Drop child table first because of foreign key dependency.

IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Orders;
END;
GO

IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Customers;
END;
GO

---------------------------------------------------------------
-- STEP 2: CREATE CUSTOMERS TABLE
---------------------------------------------------------------

CREATE TABLE dbo.Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);
GO

---------------------------------------------------------------
-- STEP 3: CREATE ORDERS TABLE
---------------------------------------------------------------

CREATE TABLE dbo.Orders
(
    OrderID INT PRIMARY KEY,

    CustomerID INT NOT NULL,

    OrderDate DATE NOT NULL,

    Amount DECIMAL(12, 2) NOT NULL,

    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customers(CustomerID),

    CONSTRAINT CK_Orders_Amount
        CHECK (Amount >= 0)
);
GO

---------------------------------------------------------------
-- STEP 4: INSERT CUSTOMER MASTER DATA
---------------------------------------------------------------

INSERT INTO dbo.Customers
(
    CustomerID,
    CustomerName
)
VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie'),
    (4, 'David'),
    (5, 'Emma');
GO

---------------------------------------------------------------
-- STEP 5: INSERT ORDER TRANSACTION DATA
---------------------------------------------------------------

INSERT INTO dbo.Orders
(
    OrderID,
    CustomerID,
    OrderDate,
    Amount
)
VALUES
    (101, 1, '2025-01-10', 100.00),
    (102, 1, '2025-02-15', 150.00),
    (103, 1, '2025-03-20',  50.00),

    (104, 2, '2025-01-12', 200.00),
    (105, 2, '2025-04-18', 100.00),

    (106, 3, '2025-02-10', 250.00),
    (107, 3, '2025-05-25', 150.00),

    (108, 5, '2025-06-10', 100.00);
GO

---------------------------------------------------------------
-- STEP 6: VERIFY CUSTOMERS DATA
---------------------------------------------------------------

SELECT *
FROM dbo.Customers
ORDER BY CustomerID;
GO

---------------------------------------------------------------
-- STEP 7: VERIFY ORDERS DATA
---------------------------------------------------------------

SELECT *
FROM dbo.Orders
ORDER BY OrderID;
GO

/*
===============================================================
MASTER DATA SUMMARY
===============================================================

ALICE   = 100 + 150 + 50  = 300
BOB     = 200 + 100       = 300
CHARLIE = 250 + 150       = 400
DAVID   = No Orders       = 0
EMMA    = 100             = 100

TOTAL LIFETIME SPENDING = 1100

===============================================================
*/