
/*===============================================================
SHIP OF LEARNING
SQL INTERVIEW QUESTION
===============================================================

TOPIC:
Find the First Date on Which Each Product Reaches
or Exceeds Its Cumulative Sales Target

DATABASE:
Microsoft SQL Server 2022

BUSINESS REQUIREMENT:
For each product, find the earliest date on which
its cumulative daily sales reach or exceed the target.

TABLES:
1. Products
2. Sales

===============================================================*/


/*===============================================================
STEP 1: DROP EXISTING TABLES IF THEY EXIST
===============================================================*/
IF OBJECT_ID('dbo.Sales', 'U') IS NOT NULL
    DROP TABLE dbo.Sales;

IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
    DROP TABLE dbo.Products;


/*===============================================================
STEP 2: CREATE PRODUCTS TABLE
===============================================================*/
CREATE TABLE dbo.Products
(
    ProductID       INT           NOT NULL PRIMARY KEY,
    ProductName     VARCHAR(100)  NOT NULL,
    SalesTarget     INT           NOT NULL
);


/*===============================================================
STEP 3: CREATE SALES TABLE
===============================================================*/
CREATE TABLE dbo.Sales
(
    SaleID          INT           NOT NULL PRIMARY KEY,
    ProductID       INT           NOT NULL,
    SaleDate        DATE          NOT NULL,
    SalesQty        INT           NOT NULL,

    CONSTRAINT FK_Sales_Products
        FOREIGN KEY (ProductID)
        REFERENCES dbo.Products(ProductID)
);


/*===============================================================
STEP 4: INSERT PRODUCTS
===============================================================*/
INSERT INTO dbo.Products
(
    ProductID,
    ProductName,
    SalesTarget
)
VALUES
(101, 'Laptop',       100),
(102, 'Smartphone',   150),
(103, 'Headphones',    80),
(104, 'Keyboard',     200),
(105, 'Monitor',      120);


/*===============================================================
STEP 5: INSERT SALES DATA
===============================================================*/
INSERT INTO dbo.Sales
(
    SaleID,
    ProductID,
    SaleDate,
    SalesQty
)
VALUES

-- Product 101: Laptop | Target = 100
(1, 101, '2026-11-01', 30),
(2, 101, '2026-11-02', 25),
(3, 101, '2026-11-03', 20),
(4, 101, '2026-11-04', 20),
(5, 101, '2026-11-04', 15),
(6, 101, '2026-11-05', 15),

-- Product 102: Smartphone | Target = 150
(7, 102, '2026-11-01', 50),
(8, 102, '2026-11-02', 40),
(9, 102, '2026-11-03', 30),
(10, 102, '2026-11-04', 35),
(11, 102, '2026-11-05', 20),

-- Product 103: Headphones | Target = 80
(12, 103, '2026-11-01', 20),
(13, 103, '2026-11-02', 25),
(14, 103, '2026-11-03', 15),
(15, 103, '2026-11-04', 25),
(16, 103, '2026-11-05', 10),

-- Product 104: Keyboard | Target = 200
-- This product will never reach its target
(17, 104, '2026-11-01', 30),
(18, 104, '2026-11-02', 40),
(19, 104, '2026-11-03', 35),
(20, 104, '2026-11-04', 25),

-- Product 105: Monitor | Target = 120
-- Target reached on the first date
(21, 105, '2026-11-01', 60),
(22, 105, '2026-11-01', 70),
(23, 105, '2026-11-02', 30);


/*===============================================================
STEP 6: VIEW MASTER DATA
===============================================================*/
SELECT *
FROM dbo.Products
ORDER BY ProductID;

SELECT *
FROM dbo.Sales
ORDER BY ProductID, SaleDate, SaleID;


/*===============================================================
STEP 7: BUSINESS REQUIREMENT
===============================================================

Find the first date for each product on which cumulative
daily sales reach or exceed its target.

IMPORTANT:
There can be multiple transactions on the same date.

Therefore, aggregate sales at the ProductID + SaleDate
level before calculating the running total.

===============================================================*/


/*
===============================================================
SOLUTION 1: RECOMMENDED
DAILY AGGREGATION + RUNNING TOTAL + ROW_NUMBER()
===============================================================

RATING: 10/10

WHY THIS IS PREFERRED:
1. Aggregates transactions into daily sales.
2. Calculates cumulative sales.
3. Filters qualifying dates.
4. Selects the first qualifying date.
5. Produces a clear and maintainable solution.

===============================================================
*/
