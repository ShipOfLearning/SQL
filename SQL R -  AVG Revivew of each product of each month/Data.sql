/* =====================================================================
   SHIP OF LEARNING — Amazon SQL Interview Question
   Topic  : Average Product Review Rating, Per Product, Per Month
   Engine : Microsoft SQL Server (T-SQL)
   Author : Ship of Learning
   ===================================================================== */

-- ---------------------------------------------------------------------
-- STEP 1: CLEAN SETUP (safe re-run guards)
-- ---------------------------------------------------------------------
IF OBJECT_ID('dbo.ProductReviews', 'U') IS NOT NULL DROP TABLE dbo.ProductReviews;
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL DROP TABLE dbo.Products;
GO

-- ---------------------------------------------------------------------
-- STEP 2: TABLE CREATION
-- ---------------------------------------------------------------------
CREATE TABLE dbo.Products
(
    ProductID   INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL
);

CREATE TABLE dbo.ProductReviews
(
    ReviewID    INT PRIMARY KEY,
    ProductID   INT NOT NULL,
    CustomerID  INT NOT NULL,
    Rating      INT NULL,          -- edge case: NULL rating allowed (e.g. text-only review, no star given)
    ReviewDate  DATE NOT NULL,
    CONSTRAINT FK_ProductReviews_Products FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID)
);
GO

-- ---------------------------------------------------------------------
-- STEP 3: MASTER DATA (with deliberate edge cases)
-- ---------------------------------------------------------------------
INSERT INTO dbo.Products (ProductID, ProductName) VALUES
(1, 'Wireless Mouse'),
(2, 'Bluetooth Headphones'),
(3, 'Mechanical Keyboard'),
(4, 'USB-C Hub');           -- edge case: this product will have ZERO reviews entirely

INSERT INTO dbo.ProductReviews (ReviewID, ProductID, CustomerID, Rating, ReviewDate) VALUES
-- Wireless Mouse: multiple reviews across two different Decembers (year-boundary trap)
(1, 1, 101, 5, '2024-12-05'),
(2, 1, 102, 4, '2024-12-18'),
(3, 1, 103, 3, '2025-12-02'),   -- SAME calendar month (December), DIFFERENT year
(4, 1, 104, 5, '2025-12-20'),

-- Wireless Mouse: January reviews (regular month, two ratings)
(5, 1, 105, 4, '2025-01-10'),
(6, 1, 106, NULL, '2025-01-15'),  -- edge case: NULL rating (text-only review, no stars)

-- Bluetooth Headphones: single month, mix of high/low ratings
(7, 2, 107, 2, '2025-02-01'),
(8, 2, 108, 5, '2025-02-14'),
(9, 2, 109, 4, '2025-02-27'),

-- Bluetooth Headphones: a month with only ONE review (edge case: single-row AVG)
(10, 2, 110, 3, '2025-03-05'),

-- Mechanical Keyboard: a month where ALL ratings are NULL (edge case: AVG over all-NULL group)
(11, 3, 111, NULL, '2025-04-02'),
(12, 3, 112, NULL, '2025-04-19'),

-- Mechanical Keyboard: normal month
(13, 3, 113, 5, '2025-05-01'),
(14, 3, 114, 5, '2025-05-11'),
(15, 3, 115, 1, '2025-05-25');   -- boundary edge case: lowest possible rating
GO