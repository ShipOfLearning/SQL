CREATE TABLE DailySales (
    SaleDate    DATE,
    SaleAmount  INT
);

-- STEP 2: Insert Teaching Data
-- Deliberately using varied values (including a repeated value on
-- consecutive days) to later demonstrate the ROWS vs RANGE trap.
INSERT INTO DailySales (SaleDate, SaleAmount) VALUES
('2024-01-01', 100),
('2024-01-02', 150),
('2024-01-03', 150),  -- duplicate value to expose RANGE behavior
('2024-01-04', 130),
('2024-01-05', 170),
('2024-01-06', 190),
('2024-01-07', 210);

-- STEP 3: Verify raw data
SELECT * FROM DailySales ORDER BY SaleDate;