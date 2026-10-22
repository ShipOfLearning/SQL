--====================================================================
--  CHANNEL      : SHIP OF LEARNING (1164)
--  TOPIC        : Product Price at a Given Date
--  TARGET DATE  : 2019-08-16
--  DEFAULT PRICE: 10
--====================================================================

-- ================================================================
-- SECTION 01: DROP TABLE IF IT EXISTS
-- ================================================================

IF OBJECT_ID(N'dbo.Products', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Products;
END;
GO

-- ================================================================
-- SECTION 02: CREATE TABLE
-- ================================================================

CREATE TABLE dbo.Products
(
    product_id  INT NOT NULL,
    new_price   INT NOT NULL,
    change_date DATE NOT NULL,

    CONSTRAINT PK_Products
        PRIMARY KEY (product_id, change_date)
);
GO

-- ================================================================
-- SECTION 03: INSERT ORIGINAL SAMPLE DATA
-- ================================================================

INSERT INTO dbo.Products
    (product_id, new_price, change_date)
VALUES
    (1, 20, '2019-08-14'),
    (2, 50, '2019-08-14'),
    (1, 30, '2019-08-15'),
    (1, 35, '2019-08-16'),
    (2, 65, '2019-08-17'),
    (3, 20, '2019-08-18');
GO

-- ================================================================
-- SECTION 04: VERIFY INPUT DATA
-- ================================================================

SELECT
    product_id,
    new_price,
    change_date
FROM dbo.Products
ORDER BY product_id, change_date;
