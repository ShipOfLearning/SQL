--============================================================
--CHANNEL      : Ship of Learning - Amazon
--TOPIC        : First & Last Day Promotion Sales Percentage
--============================================================

--============================================================
-- STEP 1: DROP TABLES IF THEY ALREADY EXIST
-- Drop the child table first because it references Promotions.
--============================================================

IF OBJECT_ID(N'dbo.Sales', N'U') IS NOT NULL
    DROP TABLE dbo.Sales;

IF OBJECT_ID(N'dbo.Promotions', N'U') IS NOT NULL
    DROP TABLE dbo.Promotions;
GO

-- STEP 2: CREATE THE PROMOTIONS TABLE

CREATE TABLE dbo.Promotions
(
    PromotionID   INT           NOT NULL PRIMARY KEY,
    PromotionName VARCHAR(100)  NOT NULL,
    StartDate     DATE          NOT NULL,
    EndDate       DATE          NOT NULL,

    CONSTRAINT CK_Promotions_DateRange
        CHECK (EndDate >= StartDate)
);
GO

-- STEP 3: CREATE THE SALES TABLE

CREATE TABLE dbo.Sales
(
    SaleID       INT            NOT NULL PRIMARY KEY,
    PromotionID  INT            NOT NULL,
    SaleDate     DATE           NOT NULL,
    SalesAmount  DECIMAL(12, 2) NOT NULL,

    CONSTRAINT FK_Sales_Promotions
        FOREIGN KEY (PromotionID)
        REFERENCES dbo.Promotions(PromotionID),

    CONSTRAINT CK_Sales_NonNegative
        CHECK (SalesAmount >= 0)
);
GO

-- STEP 4: INSERT PROMOTION MASTER DATA

INSERT INTO dbo.Promotions
    (PromotionID, PromotionName, StartDate, EndDate)
VALUES
    (1, 'Fall Sale',       '2026-10-01', '2026-10-05'),
    (2, 'Festive Sale',    '2026-10-10', '2026-10-13'),
    (3, 'Flash Sale',      '2026-10-20', '2026-10-20'),
    (4, 'Winter Sale',     '2026-11-01', '2026-11-04');

-- STEP 5: INSERT SALES TRANSACTIONS

INSERT INTO dbo.Sales
    (SaleID, PromotionID, SaleDate, SalesAmount)
VALUES
    -- Promotion 1: Total = 10,000
    (101, 1, '2026-10-01', 1000.00),
    (102, 1, '2026-10-02', 2000.00),
    (103, 1, '2026-10-03', 3000.00),
    (104, 1, '2026-10-04', 1000.00),
    (105, 1, '2026-10-05', 3000.00),

    -- Promotion 2: Total = 5,000
    (106, 2, '2026-10-10', 1000.00),
    (107, 2, '2026-10-11', 1500.00),
    (108, 2, '2026-10-12', 1000.00),
    (109, 2, '2026-10-13', 1500.00),

    -- Promotion 3: One-day promotion
    (110, 3, '2026-10-20', 2000.00),

    -- Promotion 4: No sales on the first day
    -- and no sales on the last day.
    (111, 4, '2026-11-02', 2500.00),
    (112, 4, '2026-11-03', 2500.00);
GO

-- STEP 6: VERIFY THE MASTER DATA

SELECT *
FROM dbo.Promotions
ORDER BY PromotionID;

SELECT *
FROM dbo.Sales
ORDER BY PromotionID, SaleDate, SaleID;
GO
