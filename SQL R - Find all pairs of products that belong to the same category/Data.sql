/*==============================================================================
    SHIP OF LEARNING : Amazon 
    TOPIC: Find All Pairs of Products That Belong to the Same Category
==============================================================================*/

/*==============================================================================
    STEP 1: DROP TABLE IF IT ALREADY EXISTS
==============================================================================*/

IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Products;
END;
GO


/*==============================================================================
    STEP 2: CREATE PRODUCTS TABLE
==============================================================================*/

CREATE TABLE dbo.Products
(
    ProductID      INT           NOT NULL,
    ProductName    VARCHAR(100)  NOT NULL,
    Category       VARCHAR(100)  NOT NULL,

    CONSTRAINT PK_Products
        PRIMARY KEY (ProductID)
);
GO


/*==============================================================================
    STEP 3: INSERT SAMPLE MASTER DATA
==============================================================================*/

INSERT INTO dbo.Products
(
    ProductID,
    ProductName,
    Category
)
VALUES
    (1, 'Laptop',     'Electronics'),
    (2, 'Mouse',      'Electronics'),
    (3, 'Keyboard',   'Electronics'),
    (4, 'Monitor',    'Electronics'),

    (5, 'Chair',      'Furniture'),
    (6, 'Desk',       'Furniture'),
    (7, 'Bookshelf',  'Furniture'),

    (8, 'T-Shirt',    'Clothing'),
    (9, 'Jeans',      'Clothing'),

    (10, 'Coffee',    'Grocery');
GO


/*==============================================================================
    STEP 4: VERIFY MASTER DATA
==============================================================================*/

SELECT
    ProductID,
    ProductName,
    Category
FROM dbo.Products
ORDER BY
    Category,
    ProductID;
GO
