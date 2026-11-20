/*
============================================================
CHANNEL      : SHIP OF LEARNING
TOPIC        : FIND SUPPLIERS WITH MORE THAN 20% LATE DELIVERIES
BUSINESS RULE:
1. ActualDeliveryDate > ExpectedDeliveryDate = LATE
2. ActualDeliveryDate <= ExpectedDeliveryDate = ON TIME
3. ActualDeliveryDate IS NULL = PENDING
4. Pending deliveries are excluded from the percentage.
5. Return suppliers whose late delivery percentage > 20%.

TABLES:
1. Suppliers
2. SupplierOrders
============================================================
*/

-- STEP 1: DROP EXISTING TABLES IF THEY EXIST

IF OBJECT_ID('dbo.SupplierOrders', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.SupplierOrders;
END;

IF OBJECT_ID('dbo.Suppliers', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Suppliers;
END;
GO

-- STEP 2: CREATE SUPPLIERS TABLE

CREATE TABLE dbo.Suppliers
(
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL
);
GO

-- STEP 3: CREATE SUPPLIER ORDERS TABLE

CREATE TABLE dbo.SupplierOrders
(
    OrderID INT PRIMARY KEY,
    SupplierID INT NOT NULL,
    OrderDate DATE NOT NULL,
    ExpectedDeliveryDate DATE NOT NULL,
    ActualDeliveryDate DATE NULL,

    CONSTRAINT FK_SupplierOrders_Suppliers
        FOREIGN KEY (SupplierID)
        REFERENCES dbo.Suppliers(SupplierID),

    CONSTRAINT CK_ExpectedDeliveryDate
        CHECK (ExpectedDeliveryDate >= OrderDate),

    CONSTRAINT CK_ActualDeliveryDate
        CHECK
        (
            ActualDeliveryDate IS NULL
            OR ActualDeliveryDate >= OrderDate
        )
);
GO

-- STEP 4: INSERT SUPPLIERS

INSERT INTO dbo.Suppliers
(
    SupplierID,
    SupplierName
)
VALUES
(101, 'Alpha Supplies'),
(102, 'Beta Traders'),
(103, 'Gamma Distributors'),
(104, 'Delta Enterprises'),
(105, 'Epsilon Components'),
(106, 'Zeta Industries');
GO

-- STEP 5: INSERT SUPPLIER ORDERS

INSERT INTO dbo.SupplierOrders
(
    OrderID,
    SupplierID,
    OrderDate,
    ExpectedDeliveryDate,
    ActualDeliveryDate
)
VALUES

-- SUPPLIER 101
-- 5 COMPLETED ORDERS, 2 LATE = 40%

(1, 101, '20260101', '20260110', '20260112'),
(2, 101, '20260105', '20260115', '20260115'),
(3, 101, '20260110', '20260120', '20260122'),
(4, 101, '20260115', '20260125', '20260125'),
(5, 101, '20260120', '20260130', '20260130'),

-- SUPPLIER 102
-- 5 COMPLETED ORDERS, 1 LATE = 20%

(6, 102, '20260201', '20260210', '20260210'),
(7, 102, '20260205', '20260215', '20260217'),
(8, 102, '20260210', '20260220', '20260220'),
(9, 102, '20260215', '20260225', '20260225'),
(10, 102, '20260218', '20260228', '20260228'),

-- SUPPLIER 103
-- 4 COMPLETED ORDERS, 2 LATE = 50%

(11, 103, '20260301', '20260310', '20260312'),
(12, 103, '20260305', '20260315', '20260318'),
(13, 103, '20260310', '20260320', '20260320'),
(14, 103, '20260315', '20260325', '20260325'),

-- SUPPLIER 104
-- 5 COMPLETED ORDERS, 0 LATE = 0%

(15, 104, '20260401', '20260410', '20260410'),
(16, 104, '20260405', '20260415', '20260414'),
(17, 104, '20260410', '20260420', '20260420'),
(18, 104, '20260415', '20260425', '20260423'),
(19, 104, '20260420', '20260430', '20260430'),

-- SUPPLIER 105
-- 2 COMPLETED ORDERS, 1 LATE = 50%
-- 2 PENDING ORDERS EXCLUDED FROM DENOMINATOR

(20, 105, '20260501', '20260510', '20260512'),
(21, 105, '20260505', '20260515', '20260515'),
(22, 105, '20260510', '20260520', NULL),
(23, 105, '20260515', '20260525', NULL);
GO

-- SUPPLIER 106 HAS NO ORDERS.
-- THIS IS INTENTIONAL TO TEST EDGE CASES.

-- STEP 6: VERIFY MASTER DATA

SELECT *
FROM dbo.Suppliers
ORDER BY SupplierID;

SELECT *
FROM dbo.SupplierOrders
ORDER BY SupplierID, OrderID;
GO