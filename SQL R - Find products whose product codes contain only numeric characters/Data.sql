--# ============================================================
--# SHIP OF LEARNING
--# TOPIC: Find Products Whose Product Codes Contain 
--#           Characters Only Numeric
--# ============================================================

-- ============================================================
-- STEP 1: DROP EXISTING TABLE IF IT EXISTS
-- ============================================================

IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Products;
END;
GO


-- ============================================================
-- STEP 2: CREATE PRODUCTS TABLE
-- ============================================================

CREATE TABLE dbo.Products
(
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    ProductCode NVARCHAR(30) NULL
);
GO


-- ============================================================
-- STEP 3: INSERT MASTER DATA
-- ============================================================

INSERT INTO dbo.Products
(
    ProductName,
    ProductCode
)
VALUES
('Laptop',       N'12345'),
('Mouse',        N'12A45'),
('Keyboard',     N'98765'),
('Monitor',      N'123-45'),
('USB Cable',    N'00123'),
('Headphones',   N'12 345'),
('Webcam',       N'+123'),
('Speaker',      N'12.50'),
('Printer',      NULL),
('Scanner',      N''),
('Tablet',       N'12345A'),
('Smart Watch',  N'00000'),
('Router',       N'12345 '),
('Gaming Mouse', N'１２３４５');
GO


-- ============================================================
-- STEP 4: VIEW ALL MASTER DATA
-- ============================================================

SELECT
    ProductID,
    ProductName,
    ProductCode
FROM dbo.Products
ORDER BY ProductID;
GO

