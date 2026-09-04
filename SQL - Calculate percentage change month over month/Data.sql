/* ============================================================
   SHIP OF LEARNING — MoM Sales % Change (SQL Server / T-SQL)
   Topic: Calculate Month-over-Month Percentage Change in Sales
   ============================================================ */

-- ============================
-- STEP 1: MASTER DATA SETUP
-- ============================

CREATE TABLE MonthlySales (
    SalesID     INT IDENTITY(1,1) PRIMARY KEY,
    SalesMonth  DATE NOT NULL,        -- First day of each month
    TotalSales  DECIMAL(12,2) NOT NULL
);

INSERT INTO MonthlySales (SalesMonth, TotalSales) VALUES
('2025-01-01', 100000.00),
('2025-02-01', 120000.00),
('2025-03-01', 90000.00),
('2025-04-01', 0.00),        -- edge case: zero sales month
('2025-05-01', 150000.00),
('2025-06-01', 150000.00),   -- edge case: no change (0%)
('2025-07-01', 175500.00),
('2025-08-01', 160000.00),
('2025-09-01', 200000.00);

SELECT * FROM MonthlySales ORDER BY SalesMonth;

