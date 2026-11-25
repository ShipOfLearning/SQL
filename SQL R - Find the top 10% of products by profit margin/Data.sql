/*===============================================================================
CHANNEL       : SHIP OF LEARNING
TOPIC         : FIND TOP 10% OF PRODUCTS BY PROFIT MARGIN
DATABASE      : MICROSOFT SQL SERVER 2022
CATEGORY      : SQL INTERVIEW QUESTION
LEVEL         : BEGINNER TO EXPERT

BUSINESS SCENARIO:
An e-commerce company wants to identify the top 10% of products
generating the highest profit margin.

TABLES USED:
1. Products
===============================================================================
SECTION 1: TABLE CLEANUP
===============================================================================*/

-- Drop the existing table only if it already exists.

IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Products;
END;
GO

/*===============================================================================
SECTION 2: CREATE MASTER TABLE
===============================================================================*/

CREATE TABLE dbo.Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    UnitCost DECIMAL(12,2) NOT NULL,
    SellingPrice DECIMAL(12,2) NOT NULL,

    CONSTRAINT CK_Products_UnitCost
        CHECK (UnitCost >= 0),

    CONSTRAINT CK_Products_SellingPrice
        CHECK (SellingPrice >= 0)
);
GO

/*===============================================================================
SECTION 3: INSERT SAMPLE MASTER DATA
===============================================================================
20 PRODUCTS:
- Product 1 has a 60% profit margin.
- Products 2 and 3 have identical 55% profit margins.
- Remaining products have progressively lower margins.

This deliberately creates a tie at the top 10% cutoff.

===============================================================================*/

INSERT INTO dbo.Products
(
    ProductID,
    ProductName,
    Category,
    UnitCost,
    SellingPrice
)
VALUES
(1,  'Laptop',             'Electronics', 40, 100),
(2,  'Smartphone',         'Electronics', 45, 100),
(3,  'Tablet',             'Electronics', 45, 100),
(4,  'Monitor',            'Electronics', 50, 100),
(5,  'Keyboard',           'Accessories', 55, 100),
(6,  'Gaming Mouse',       'Accessories', 60, 100),
(7,  'Headphones',         'Accessories', 65, 100),
(8,  'Webcam',             'Accessories', 70, 100),
(9,  'Speaker',            'Electronics', 72, 100),
(10, 'Microphone',         'Accessories', 75, 100),
(11, 'Printer',            'Electronics', 80, 100),
(12, 'Router',             'Networking', 82, 100),
(13, 'External SSD',       'Storage', 85, 100),
(14, 'USB Hub',            'Accessories', 88, 100),
(15, 'Power Bank',         'Accessories', 90, 100),
(16, 'Graphics Card',      'Electronics', 92, 100),
(17, 'Motherboard',        'Electronics', 94, 100),
(18, 'RAM',                'Electronics', 95, 100),
(19, 'Cooling Fan',        'Accessories', 97, 100),
(20, 'HDMI Cable',         'Accessories', 99, 100);
GO

/*===============================================================================
SECTION 4: VERIFY MASTER DATA
===============================================================================*/

SELECT
    ProductID,
    ProductName,
    Category,
    UnitCost,
    SellingPrice
FROM dbo.Products
ORDER BY ProductID;
GO

/*===============================================================================
SECTION 5: UNDERSTAND THE PROFIT CALCULATION
===============================================================================

PROFIT = SELLING PRICE - UNIT COST

PROFIT MARGIN % =
(PROFIT / SELLING PRICE) * 100

NULLIF prevents division by zero.

===============================================================================*/

SELECT
    ProductID,
    ProductName,
    UnitCost,
    SellingPrice,

    SellingPrice - UnitCost AS Profit,

    CAST
    (
        (
            (SellingPrice - UnitCost)
            / NULLIF(SellingPrice, 0)
        ) * 100
        AS DECIMAL(10,2)
    ) AS ProfitMarginPercentage

FROM dbo.Products
WHERE SellingPrice > 0
ORDER BY ProfitMarginPercentage DESC;
GO
