--================================================================
-- CHANNEL : Ship of Learning - AMAZON
-- TOPIC   : Find First and Last Transaction for Every Customer
--================================================================
SET NOCOUNT ON;

------------------------------------------------------------
-- STEP 1: DROP TABLE ONLY IF IT ALREADY EXISTS
------------------------------------------------------------

IF OBJECT_ID(N'dbo.Transactions', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Transactions;
END;
GO

------------------------------------------------------------
-- STEP 2: CREATE THE MASTER TABLE
------------------------------------------------------------

CREATE TABLE dbo.Transactions
(
    TransactionID   INT           NOT NULL PRIMARY KEY,
    CustomerID      INT           NOT NULL,
    TransactionDate DATETIME2(0)  NOT NULL,
    Amount          DECIMAL(10,2) NOT NULL
);
GO

------------------------------------------------------------
-- STEP 3: INSERT SAMPLE DATA
------------------------------------------------------------

INSERT INTO dbo.Transactions
    (TransactionID, CustomerID, TransactionDate, Amount)
VALUES
    (1005, 101, '2026-01-05 10:00:00', 250.00),
    (1002, 101, '2026-01-12 14:00:00', 400.00),
    (1009, 101, '2026-01-20 09:00:00', 150.00),

    (2003, 102, '2026-02-01 11:00:00', 800.00),
    (2001, 102, '2026-02-01 11:00:00', 500.00),
    (2008, 102, '2026-02-15 16:00:00', 300.00),

    (3007, 103, '2026-03-10 12:00:00', 125.00),

    (4004, 104, '2026-04-01 08:00:00', 100.00),
    (4002, 104, '2026-04-03 08:00:00', 200.00),
    (4008, 104, '2026-04-07 08:00:00', 350.00);
GO

------------------------------------------------------------
-- STEP 4: VIEW THE MASTER DATA
------------------------------------------------------------

SELECT
    TransactionID,
    CustomerID,
    TransactionDate,
    Amount
FROM dbo.Transactions
ORDER BY CustomerID, TransactionDate, TransactionID;
GO