--=============================================================
--CHANNEL : SHIP OF LEARNING - AMAZON 
--TOPIC   : AVERAGE SHIPPING TIME BY SHIPPING METHOD
--=============================================================

-- STEP 1: DROP EXISTING TABLE IF IT EXISTS

IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Orders;
END;
GO

-- STEP 2: CREATE ORDERS TABLE

CREATE TABLE dbo.Orders
(
    OrderID INT NOT NULL PRIMARY KEY,

    OrderDate DATETIME2(0) NOT NULL,

    ShipDate DATETIME2(0) NULL,

    ShippingMethod VARCHAR(30) NOT NULL
);
GO

-- STEP 3: INSERT MASTER DATA

INSERT INTO dbo.Orders
(
    OrderID,
    OrderDate,
    ShipDate,
    ShippingMethod
)
VALUES

-- STANDARD SHIPPING
(101, '2026-10-01 09:00:00',
      '2026-10-01 10:00:00', 'Standard'),

(102, '2026-10-01 10:00:00',
      '2026-10-01 13:00:00', 'Standard'),

(103, '2026-10-02 08:00:00',
      '2026-10-02 10:00:00', 'Standard'),

-- EXPRESS SHIPPING
(104, '2026-10-01 09:00:00',
      '2026-10-01 09:30:00', 'Express'),

(105, '2026-10-01 11:00:00',
      '2026-10-01 12:30:00', 'Express'),

(106, '2026-10-02 10:00:00',
      '2026-10-02 11:00:00', 'Express'),

-- SAME DAY SHIPPING
(107, '2026-10-01 14:00:00',
      '2026-10-01 14:20:00', 'Same Day'),

(108, '2026-10-02 15:00:00',
      '2026-10-02 15:40:00', 'Same Day'),

-- UNSHIPPED ORDER: MUST BE EXCLUDED
(109, '2026-10-03 09:00:00',
      NULL, 'Standard'),

-- ANOTHER UNSHIPPED ORDER
(110, '2026-10-03 10:00:00',
      NULL, 'Express'),

-- INVALID RECORD: SHIPMENT BEFORE ORDER
(111, '2026-10-04 12:00:00',
      '2026-10-04 11:00:00', 'Standard'),

-- ZERO-DURATION ORDER: VALID
(112, '2026-10-04 12:00:00',
      '2026-10-04 12:00:00', 'Express');

GO

-- STEP 4: VERIFY MASTER DATA

SELECT
    OrderID,
    OrderDate,
    ShipDate,
    ShippingMethod
FROM dbo.Orders
ORDER BY OrderID;
GO
