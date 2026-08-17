--Drop table Sales

-- =============================================
-- Ship of Learning | SQL PIVOT Explained
-- Topic: PIVOT in MS SQL Server (Interview Prep)
-- =============================================

-- STEP 1: Create Sample Table
CREATE TABLE Sales
(
    SaleID      INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(50),
    Quarter     VARCHAR(5),
    Amount      DECIMAL(10,2)
);
GO

-- STEP 2: Insert Sample Data (with intentional edge cases)
INSERT INTO Sales (ProductName, Quarter, Amount)
VALUES
    ('Laptop', 'Q1', 50000),
    ('Laptop', 'Q2', 55000),
    ('Laptop', 'Q3', 60000),
    ('Laptop', 'Q4', 65000),

    ('Mobile', 'Q1', 30000),
    ('Mobile', 'Q2', 32000),
    -- Edge Case 1: Mobile has NO Q3 record at all -> will show NULL after PIVOT
    ('Mobile', 'Q4', 35000),

    ('Tablet', 'Q1', 20000),
    -- Edge Case 2: Duplicate ProductName + Quarter combination for Tablet in Q2
    -- PIVOT will SILENTLY aggregate these two rows using SUM
    ('Tablet', 'Q2', 15000),
    ('Tablet', 'Q2', 5000),   -- Total Q2 for Tablet should become 20000 after SUM
    ('Tablet', 'Q3', 18000),
    ('Tablet', 'Q4', 22000),

    -- Edge Case 3: NULL Amount value
    ('Headphones', 'Q1', NULL),
    ('Headphones', 'Q2', 8000),
    ('Headphones', 'Q3', 9000),
    ('Headphones', 'Q4', 10000);
GO

-- STEP 3: View Raw Data (Row-level format)
SELECT * FROM Sales ORDER BY ProductName, Quarter;
GO