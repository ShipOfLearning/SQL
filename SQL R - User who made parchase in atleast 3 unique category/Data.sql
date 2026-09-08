/* =========================================================
   SHIP OF LEARNING — SQL Interview Series
   Topic: Find customers who purchased in at least 
          3 UNIQUE categories
   Server: MS SQL Server (T-SQL)
   ========================================================= */

-- STEP 1: Safe re-run guards (drop if exists)
IF OBJECT_ID('dbo.Purchases', 'U') IS NOT NULL
    DROP TABLE dbo.Purchases;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
    DROP TABLE dbo.Customers;
GO

-- STEP 2: Table creation
CREATE TABLE dbo.Customers
(
    CustomerID   INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE dbo.Purchases
(
    PurchaseID   INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID   INT NOT NULL,
    Category     VARCHAR(50) NULL,   -- NULL allowed intentionally (edge case)
    PurchaseDate DATE NOT NULL,
    Amount       DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Purchases_Customers FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customers(CustomerID)
);
GO

-- STEP 3: Insert customer master data
INSERT INTO dbo.Customers (CustomerID, CustomerName) VALUES
(1, 'Aditya Sharma'),   -- Will qualify: 3 distinct categories, one repeated
(2, 'Bhavna Iyer'),     -- Will NOT qualify: only 2 distinct categories
(3, 'Chirag Mehta'),    -- Will qualify: 4 distinct categories
(4, 'Divya Rao'),       -- Will NOT qualify: 5 purchases, all SAME category (duplicate trap)
(5, 'Esha Kapoor'),     -- Will qualify: exactly 3 distinct categories (boundary case)
(6, 'Farhan Ali');      -- Has a NULL category row mixed in (NULL handling edge case)

-- STEP 4: Insert purchase transactions (deliberate edge cases)
INSERT INTO dbo.Purchases (CustomerID, Category, PurchaseDate, Amount) VALUES
-- Customer 1: Electronics, Grocery, Fashion + a REPEAT Electronics purchase
(1, 'Electronics', '2026-01-05', 15000.00),
(1, 'Grocery',     '2026-01-10', 1200.00),
(1, 'Fashion',     '2026-02-01', 2500.00),
(1, 'Electronics', '2026-02-15', 8000.00),  -- duplicate category, should NOT double count

-- Customer 2: Only Electronics and Grocery -> should be EXCLUDED
(2, 'Electronics', '2026-01-07', 5000.00),
(2, 'Grocery',     '2026-01-20', 900.00),

-- Customer 3: 4 unique categories -> should be INCLUDED
(3, 'Electronics', '2026-01-03', 20000.00),
(3, 'Grocery',     '2026-01-08', 700.00),
(3, 'Fashion',     '2026-01-15', 3200.00),
(3, 'Books',       '2026-01-25', 450.00),

-- Customer 4: 5 purchases, ALL same category -> classic COUNT() trap, should be EXCLUDED
(4, 'Fashion', '2026-01-02', 1000.00),
(4, 'Fashion', '2026-01-05', 1500.00),
(4, 'Fashion', '2026-01-09', 2000.00),
(4, 'Fashion', '2026-01-14', 1800.00),
(4, 'Fashion', '2026-01-22', 2200.00),

-- Customer 5: Exactly 3 unique categories -> boundary case, should be INCLUDED
(5, 'Electronics', '2026-02-01', 6000.00),
(5, 'Books',       '2026-02-05', 550.00),
(5, 'Grocery',     '2026-02-10', 800.00),

-- Customer 6: 3 valid categories + 1 NULL category row -> NULL should NOT count
(6, 'Electronics', '2026-01-11', 4000.00),
(6, 'Fashion',     '2026-01-18', 1700.00),
(6, 'Books',       '2026-01-28', 300.00),
(6, NULL,          '2026-02-02', 500.00);   -- NULL category, must be excluded from DISTINCT count
GO

