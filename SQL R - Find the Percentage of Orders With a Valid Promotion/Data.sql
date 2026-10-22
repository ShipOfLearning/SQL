--============================================================
--  SHIP OF LEARNING
--  TOPIC: Find the Percentage of Orders With a Valid Promotion
--============================================================

------------------------------------------------------------
-- SECTION 01: DROP EXISTING TABLES
------------------------------------------------------------

DROP TABLE IF EXISTS dbo.Orders;
DROP TABLE IF EXISTS dbo.Promotions;

------------------------------------------------------------
-- SECTION 02: CREATE MASTER TABLES
------------------------------------------------------------

CREATE TABLE dbo.Promotions
(
    PromoCode   VARCHAR(30) NOT NULL,
    PromoName   VARCHAR(100) NOT NULL,
    StartDate   DATE NOT NULL,
    EndDate     DATE NOT NULL,
    IsActive    BIT NOT NULL,

    CONSTRAINT PK_Promotions
        PRIMARY KEY (PromoCode),

    CONSTRAINT CK_Promotions_DateRange
        CHECK (EndDate >= StartDate)
);

CREATE TABLE dbo.Orders
(
    OrderID     INT NOT NULL,
    CustomerID  INT NOT NULL,
    OrderDate   DATE NOT NULL,
    OrderAmount DECIMAL(12, 2) NOT NULL,
    PromoCode   VARCHAR(30) NULL,

    CONSTRAINT PK_Orders
        PRIMARY KEY (OrderID),

    CONSTRAINT CK_Orders_Amount
        CHECK (OrderAmount >= 0)
);

-- IMPORTANT:
-- PromoCode is intentionally not a foreign key.
-- This allows us to demonstrate unknown/invalid
-- codes such as FAKE99 in incoming order data.

------------------------------------------------------------
-- SECTION 03: INSERT PROMOTION MASTER DATA
------------------------------------------------------------

INSERT INTO dbo.Promotions
(
    PromoCode,
    PromoName,
    StartDate,
    EndDate,
    IsActive
)
VALUES
('SAVE20',    'October Savings',
 '2026-10-01', '2026-10-31', 1),

('FESTIVE10', 'Festive Discount',
 '2026-10-01', '2026-10-20', 1),

('OLD50',     'Expired Offer',
 '2026-09-01', '2026-09-30', 1),

('FLASH30',   'Disabled Flash Sale',
 '2026-10-01', '2026-10-31', 0);

------------------------------------------------------------
-- SECTION 04: INSERT ORDER MASTER DATA
------------------------------------------------------------

INSERT INTO dbo.Orders
(
    OrderID,
    CustomerID,
    OrderDate,
    OrderAmount,
    PromoCode
)
VALUES
(101, 1, '2026-10-05', 1200.00, 'SAVE20'),
(102, 2, '2026-10-06',  800.00, 'FESTIVE10'),
(103, 3, '2026-10-07', 1500.00, NULL),
(104, 4, '2026-10-08', 2000.00, 'OLD50'),
(105, 5, '2026-10-09',  950.00, 'SAVE20'),
(106, 6, '2026-10-10', 1750.00, 'FLASH30'),
(107, 7, '2026-10-11', 1100.00, 'FESTIVE10'),
(108, 8, '2026-10-12',  650.00, 'FAKE99'),
(109, 9, '2026-10-13', 2200.00, 'SAVE20'),
(110,10, '2026-10-14', 1300.00, NULL);

------------------------------------------------------------
-- SECTION 05: VERIFY MASTER DATA
------------------------------------------------------------

SELECT *
FROM dbo.Promotions
ORDER BY PromoCode;

SELECT *
FROM dbo.Orders
ORDER BY OrderID;
