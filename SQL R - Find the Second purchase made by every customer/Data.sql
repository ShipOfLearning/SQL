--=============================================================
-- Channel : Ship of Learning - Amazon 
-- Topic   : Find the Second Purchase Made by Every Customer
--=============================================================

-- STEP 1: DROP THE TABLE ONLY IF IT ALREADY EXISTS

IF OBJECT_ID(N'dbo.Purchases', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Purchases;
END;
GO

-- STEP 2: CREATE THE MASTER TABLE

CREATE TABLE dbo.Purchases
(
    PurchaseID   INT           NOT NULL PRIMARY KEY,
    CustomerID   INT           NOT NULL,
    PurchaseDate DATETIME2(0)  NOT NULL,
    Amount       DECIMAL(10,2) NOT NULL
);
GO

-- STEP 3: INSERT MASTER DATA

INSERT INTO dbo.Purchases
    (PurchaseID, CustomerID, PurchaseDate, Amount)
VALUES
    (1001, 101, '2026-01-02T09:00:00',  500.00),
    (1002, 101, '2026-01-10T11:00:00', 1200.00),
    (1003, 101, '2026-01-20T14:00:00',  750.00),

    (1004, 102, '2026-01-05T10:00:00',  300.00),
    (1005, 102, '2026-01-15T16:00:00',  900.00),

    (1006, 103, '2026-01-07T12:00:00',  450.00),

    -- Same purchase date: PurchaseID resolves the tie
    (1007, 104, '2026-01-08T10:00:00',  200.00),
    (1008, 104, '2026-01-08T10:00:00',  650.00),
    (1009, 104, '2026-01-12T10:00:00',  800.00);
GO

-- STEP 4: VIEW ALL MASTER DATA

SELECT
    PurchaseID,
    CustomerID,
    PurchaseDate,
    Amount
FROM dbo.Purchases
ORDER BY
    CustomerID,
    PurchaseDate,
    PurchaseID;
GO
