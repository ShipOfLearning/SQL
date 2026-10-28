--===============================================================
-- CHANNEL : SHIP OF LEARNING - Amazon
-- TOPIC   : Find Products Purchased by At Least 5 Unique Customers
--===============================================================

SET NOCOUNT ON;
GO

/*
===============================================================
STEP 1: DROP TABLE IF IT EXISTS
===============================================================
*/

IF OBJECT_ID(N'dbo.Purchases', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Purchases;
END;
GO

/*
===============================================================
STEP 2: CREATE MASTER TABLE
===============================================================
*/

CREATE TABLE dbo.Purchases
(
    PurchaseID INT NOT NULL PRIMARY KEY,
    ProductID INT NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    CustomerID INT NOT NULL
);
GO

/*
===============================================================
STEP 3: INSERT SAMPLE DATA

Laptop:
- Customer 101 buys it twice.
- Customers 102, 103, 104 and 105 also buy it.
- Total purchase records = 6.
- Unique customers = 5.
- Laptop QUALIFIES.

Mouse:
- Five purchase records, but Customer 201 buys it twice.
- Unique customers = 4.
- Mouse DOES NOT QUALIFY.

Keyboard:
- Five different customers buy it.
- Unique customers = 5.
- Keyboard QUALIFIES.

Monitor:
- Only four unique customers.
- Monitor DOES NOT QUALIFY.

Headphones:
- Six different customers.
- Headphones QUALIFY.
===============================================================
*/

INSERT INTO dbo.Purchases
    (PurchaseID, ProductID, ProductName, CustomerID)
VALUES
    (1,  101, 'Laptop',     101),
    (2,  101, 'Laptop',     101),
    (3,  101, 'Laptop',     102),
    (4,  101, 'Laptop',     103),
    (5,  101, 'Laptop',     104),
    (6,  101, 'Laptop',     105),

    (7,  102, 'Mouse',      201),
    (8,  102, 'Mouse',      201),
    (9,  102, 'Mouse',      202),
    (10, 102, 'Mouse',      203),
    (11, 102, 'Mouse',      204),

    (12, 103, 'Keyboard',   301),
    (13, 103, 'Keyboard',   302),
    (14, 103, 'Keyboard',   303),
    (15, 103, 'Keyboard',   304),
    (16, 103, 'Keyboard',   305),

    (17, 104, 'Monitor',    401),
    (18, 104, 'Monitor',    402),
    (19, 104, 'Monitor',    403),
    (20, 104, 'Monitor',    404),

    (21, 105, 'Headphones', 501),
    (22, 105, 'Headphones', 502),
    (23, 105, 'Headphones', 503),
    (24, 105, 'Headphones', 504),
    (25, 105, 'Headphones', 505),
    (26, 105, 'Headphones', 506);
GO

/*
===============================================================
STEP 4: INSPECT THE MASTER DATA
===============================================================
*/

SELECT
    PurchaseID,
    ProductID,
    ProductName,
    CustomerID
FROM dbo.Purchases
ORDER BY ProductID, CustomerID, PurchaseID;
GO
