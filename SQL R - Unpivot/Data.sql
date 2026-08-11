-- ============================================================
-- STEP 1: Create the wide-format table (source data)
-- ============================================================
-- This is a common real-world structure: quarterly sales per product,
-- stored as separate columns instead of rows.

CREATE TABLE SalesData (
    ProductName VARCHAR(50),
    Q1 INT,
    Q2 INT,
    Q3 INT,
    Q4 INT
);

-- ============================================================
-- STEP 2: Insert sample data (with an intentional NULL edge case)
-- ============================================================
-- Notice: 'Tablet' has a NULL in Q3 on purpose. This is a classic
-- edge case interviewers use to test if you know UNPIVOT's default
-- NULL-exclusion behavior.

INSERT INTO SalesData (ProductName, Q1, Q2, Q3, Q4) VALUES
('Laptop',   250, 300, 275, 320),
('Mobile',   400, 420, 410, 450),
('Tablet',   150, 160, NULL, 180),   -- NULL in Q3 intentionally
('Headphone',90,  95,  100, 110);