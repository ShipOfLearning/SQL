--===============================================================
--CHANNEL : SHIP OF LEARNING
--TOPIC   : Find Customers Who Made Purchases on Three
--          Consecutive Calendar Days 
--===============================================================
/*
===============================================================
SECTION 1: DROP EXISTING TABLE IF IT EXISTS
===============================================================
*/

IF OBJECT_ID(N'dbo.PurchaseTransactions', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.PurchaseTransactions;
END;
GO

/*
===============================================================
SECTION 2: CREATE MASTER TABLE
===============================================================
*/

CREATE TABLE dbo.PurchaseTransactions
(
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID    INT           NOT NULL,
    CustomerName  VARCHAR(50)   NOT NULL,
    PurchaseDate  DATETIME2(0)  NOT NULL,
    Amount        DECIMAL(10,2) NOT NULL
);
GO

/*
===============================================================
SECTION 3: INSERT SAMPLE MASTER DATA
===============================================================
*/

INSERT INTO dbo.PurchaseTransactions
    (CustomerID, CustomerName, PurchaseDate, Amount)
VALUES
-- Customer 101: Rahul; consecutive days
(101, 'Rahul',  '2026-10-10 09:15:00', 500.00),
(101, 'Rahul',  '2026-10-11 12:30:00', 700.00),
(101, 'Rahul',  '2026-10-12 16:00:00', 250.00),

-- Customer 102: Priya; duplicate orders on one day
(102, 'Priya',  '2026-10-10 08:00:00', 100.00),
(102, 'Priya',  '2026-10-10 18:00:00', 150.00),
(102, 'Priya',  '2026-10-12 10:00:00', 200.00),

-- Customer 103: Aman; a missing calendar day
(103, 'Aman',   '2026-10-10 10:00:00', 350.00),
(103, 'Aman',   '2026-10-11 11:00:00', 450.00),
(103, 'Aman',   '2026-10-13 14:00:00', 550.00),

-- Customer 104: Sara; four consecutive days
(104, 'Sara',   '2026-10-10 09:00:00', 200.00),
(104, 'Sara',   '2026-10-11 09:30:00', 300.00),
(104, 'Sara',   '2026-10-12 10:00:00', 400.00),
(104, 'Sara',   '2026-10-13 10:30:00', 500.00),

-- Customer 105: Vikram; only two distinct dates
(105, 'Vikram', '2026-10-10 12:00:00', 600.00),
(105, 'Vikram', '2026-10-11 13:00:00', 700.00),

-- Customer 106: Neha; duplicate transaction on third day
(106, 'Neha',   '2026-10-10 08:30:00', 120.00),
(106, 'Neha',   '2026-10-11 09:30:00', 220.00),
(106, 'Neha',   '2026-10-12 10:30:00', 320.00),
(106, 'Neha',   '2026-10-12 17:30:00', 180.00);
GO

/*
===============================================================
SECTION 4: VIEW THE MASTER DATA
===============================================================
*/

SELECT
    TransactionID,
    CustomerID,
    CustomerName,
    PurchaseDate,
    Amount
FROM dbo.PurchaseTransactions
ORDER BY CustomerID, PurchaseDate, TransactionID;
GO
