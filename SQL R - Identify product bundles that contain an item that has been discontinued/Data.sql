
/*============================================================
CHANNEL       : SHIP OF LEARNING
TOPIC         : IDENTIFY PRODUCT BUNDLES THAT CONTAIN
                AN ITEM THAT HAS BEEN DISCONTINUED
============================================================
SECTION 1: DROP EXISTING TABLES
Drop child table first because of foreign key dependency.
Check existence before dropping.
============================================================*/

IF OBJECT_ID('dbo.BundleItems', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.BundleItems;
END;
GO

IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Products;
END;
GO

/*============================================================
SECTION 2: CREATE PRODUCTS TABLE
Stores both individual products and product bundles.
============================================================*/

CREATE TABLE dbo.Products
(
    ProductID INT NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    ProductType VARCHAR(10) NOT NULL,
    IsDiscontinued BIT NOT NULL
        CONSTRAINT DF_Products_IsDiscontinued DEFAULT (0),

    CONSTRAINT PK_Products
        PRIMARY KEY (ProductID),

    CONSTRAINT CK_Products_ProductType
        CHECK (ProductType IN ('ITEM', 'BUNDLE'))
);
GO

/*============================================================
SECTION 3: CREATE BUNDLEITEMS TABLE
Maps individual products to their parent bundles.
============================================================*/

CREATE TABLE dbo.BundleItems
(
    BundleID INT NOT NULL,
    ProductID INT NOT NULL,

    CONSTRAINT PK_BundleItems
        PRIMARY KEY (BundleID, ProductID),

    CONSTRAINT FK_BundleItems_Bundle
        FOREIGN KEY (BundleID)
        REFERENCES dbo.Products(ProductID),

    CONSTRAINT FK_BundleItems_Product
        FOREIGN KEY (ProductID)
        REFERENCES dbo.Products(ProductID),

    CONSTRAINT CK_BundleItems_NoSelfReference
        CHECK (BundleID <> ProductID)
);
GO

/*============================================================
SECTION 4: INSERT MASTER PRODUCT DATA
============================================================*/

INSERT INTO dbo.Products
(
    ProductID,
    ProductName,
    ProductType,
    IsDiscontinued
)
VALUES
-- Individual products
(1, 'Laptop', 'ITEM', 0),
(2, 'Wireless Mouse', 'ITEM', 1),
(3, 'Mechanical Keyboard', 'ITEM', 0),
(4, 'Monitor', 'ITEM', 0),
(5, 'Webcam', 'ITEM', 1),
(6, 'USB Hub', 'ITEM', 0),
(7, 'Headphones', 'ITEM', 0),
(8, 'Old Printer', 'ITEM', 1),

-- Product bundles
(101, 'Laptop Starter Bundle', 'BUNDLE', 0),
(102, 'Gaming Bundle', 'BUNDLE', 0),
(103, 'Office Bundle', 'BUNDLE', 0),
(104, 'Empty Bundle', 'BUNDLE', 0),
(105, 'Premium Bundle', 'BUNDLE', 1),
(106, 'Travel Bundle', 'BUNDLE', 0);
GO

/*============================================================
SECTION 5: INSERT BUNDLE COMPONENT DATA
============================================================*/

INSERT INTO dbo.BundleItems
(
    BundleID,
    ProductID
)
VALUES
-- Laptop Starter Bundle
(101, 1),
(101, 2),

-- Gaming Bundle
(102, 1),
(102, 3),
(102, 4),

-- Office Bundle
(103, 2),
(103, 5),
(103, 6),

-- Premium Bundle
(105, 1),
(105, 3),

-- Travel Bundle
(106, 6),
(106, 7);
GO

/*============================================================
SECTION 6: CREATE SUPPORTING INDEX
Helps the lookup of bundle components and products.
============================================================*/

CREATE INDEX IX_Products_ProductType_IsDiscontinued
ON dbo.Products
(
    ProductType,
    IsDiscontinued,
    ProductID
)
INCLUDE (ProductName);
GO

CREATE INDEX IX_BundleItems_ProductID
ON dbo.BundleItems(ProductID)
INCLUDE (BundleID);
GO

/*============================================================
SECTION 7: VERIFY MASTER DATA
============================================================*/

SELECT *
FROM dbo.Products
ORDER BY ProductID;

SELECT *
FROM dbo.BundleItems
ORDER BY BundleID, ProductID;
GO
