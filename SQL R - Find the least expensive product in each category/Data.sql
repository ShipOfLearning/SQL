--===========================================================
--SHIP OF LEARNING
--Topic: Find Least Expensive Product in Each Category
--===========================================================

-- ========================================================
-- SECTION 1: DROP TABLE IF IT EXISTS
-- ========================================================

IF OBJECT_ID(N'dbo.Products', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Products;
END;
GO

-- ========================================================
-- SECTION 2: CREATE TABLE
-- ========================================================

CREATE TABLE dbo.Products
(
    ProductID   INT           NOT NULL PRIMARY KEY,
    ProductName VARCHAR(100)  NOT NULL,
    Category    VARCHAR(50)   NOT NULL,
    Price       DECIMAL(10,2) NULL,

    CONSTRAINT CK_Products_Price
        CHECK (Price >= 0)
);
GO

-- ========================================================
-- SECTION 3: INSERT SAMPLE DATA
-- ========================================================

INSERT INTO dbo.Products
    (ProductID, ProductName, Category, Price)
VALUES
    (1,  'Mouse',         'Electronics',  500.00),
    (2,  'Keyboard',      'Electronics',  500.00),
    (3,  'Monitor',       'Electronics', 8000.00),
    (4,  'Laptop',        'Electronics',45000.00),
    (5,  'Pen',           'Stationery',    10.00),
    (6,  'Pencil',        'Stationery',    10.00),
    (7,  'Notebook',      'Stationery',    50.00),
    (8,  'Chair',         'Furniture',   1500.00),
    (9,  'Table',         'Furniture',   3000.00),
    (10, 'Desk',          'Furniture',   4500.00),
    (11, 'Water Bottle',  'Kitchen',      250.00),
    (12, 'Cup',           'Kitchen',      250.00),
    (13, 'Plate',         'Kitchen',      400.00),
    (14, 'Mystery Item',  'Kitchen',        NULL),
    (15, 'Gift Card',     'Gifts',          NULL);
GO

-- ========================================================
-- SECTION 4: VERIFY DATA
-- ========================================================

SELECT
    ProductID,
    ProductName,
    Category,
    Price
FROM dbo.Products
ORDER BY Category, Price, ProductID;
