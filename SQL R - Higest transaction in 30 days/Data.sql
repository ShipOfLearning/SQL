-- ============================================================
-- Ship of Learning | SQL Interview Series
-- Topic   : Highest Transaction Amount Per Customer (Last 30 Days)
-- Asked In: Amazon SQL Interview Round
-- Engine  : Microsoft SQL Server (T-SQL)
-- ============================================================

-- ------------------------------------------------------------
-- STEP 1: Create Table
-- ------------------------------------------------------------
CREATE TABLE Transactions (
    TransactionID       INT             PRIMARY KEY,
    CustomerID           INT             NOT NULL,
    TransactionAmount    DECIMAL(10,2)   NOT NULL,
    TransactionDate       DATE            NOT NULL
);
GO

-- ------------------------------------------------------------
-- STEP 2: Insert Sample Data (Deliberate Edge Cases)
-- Reference "Today" for this demo = 2026-08-10
--
--   Customer 101 -> Normal case: multiple txns inside window
--   Customer 102 -> TRAP: highest amount (9800) is OUTSIDE the
--                    30-day window; correct answer must exclude it
--   Customer 103 -> TIE: two transactions share the same highest
--                    amount inside the window
--   Customer 104 -> Only one transaction, inside window
--   Customer 105 -> Only transaction is OUTSIDE the window ->
--                    should NOT appear in the final result at all
-- ------------------------------------------------------------
INSERT INTO Transactions (TransactionID, CustomerID, TransactionAmount, TransactionDate) VALUES
(1,  101, 2500.00, '2026-08-05'),
(2,  101, 4200.00, '2026-07-15'),
(3,  101, 3100.00, '2026-06-25'),

(4,  102, 9800.00, '2026-08-01'),   -- highest overall, but OUTSIDE 30-day window
(5,  102, 1500.00, '2026-08-10'),
(6,  102, 2200.00, '2026-07-20'),   -- correct highest for customer 102

(7,  103, 5000.00, '2026-08-08'),   -- TIE
(8,  103, 5000.00, '2026-08-18'),   -- TIE
(9,  103, 3000.00, '2026-08-28'),

(10, 104, 7000.00, '2026-07-12'),

(11, 105, 8800.00, '2026-07-10');   -- only txn, outside window -> excluded entirely
GO