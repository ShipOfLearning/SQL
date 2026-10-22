--=========================================================
-- SHIP OF LEARNING
-- Topic : Find Average Order Value (AOV)
-- AOV = Completed Order Revenue / Completed Order Count
--=========================================================

-- ======================================================
-- SECTION 01: DROP TABLE IF IT ALREADY EXISTS
-- ======================================================

IF OBJECT_ID(N'dbo.Orders', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Orders;
END;
GO

-- ======================================================
-- SECTION 02: CREATE ORDERS TABLE
-- ======================================================

CREATE TABLE dbo.Orders
(
    OrderID      INT           NOT NULL PRIMARY KEY,
    CustomerID   INT           NOT NULL,
    OrderDate    DATE          NOT NULL,
    OrderAmount  DECIMAL(12,2) NULL,
    OrderStatus  VARCHAR(20)   NOT NULL,

    CONSTRAINT CK_Orders_Amount
        CHECK (OrderAmount >= 0),

    CONSTRAINT CK_Orders_Status
        CHECK
        (
            OrderStatus IN
            ('Completed', 'Pending', 'Cancelled')
        )
);
GO

-- ======================================================
-- SECTION 03: INSERT SAMPLE DATA
-- ======================================================

INSERT INTO dbo.Orders
(
    OrderID,
    CustomerID,
    OrderDate,
    OrderAmount,
    OrderStatus
)
VALUES
(101, 1, '2026-10-01',  500.00, 'Completed'),
(102, 2, '2026-10-01', 1000.00, 'Completed'),
(103, 3, '2026-10-02', 1500.00, 'Cancelled'),
(104, 1, '2026-10-02', 2000.00, 'Completed'),
(105, 4, '2026-10-03',  750.00, 'Completed'),
(106, 2, '2026-10-03', 1250.00, 'Pending'),
(107, 5, '2026-10-04', 3000.00, 'Completed'),
(108, 3, '2026-10-04', 1500.00, 'Completed'),
(109, 4, '2026-10-05',  250.00, 'Completed'),
(110, 5, '2026-10-05',  500.00, 'Completed');
GO

-- ======================================================
-- SECTION 04: VERIFY DATA
-- ======================================================

SELECT
    OrderID,
    CustomerID,
    OrderDate,
    OrderAmount,
    OrderStatus
FROM dbo.Orders
ORDER BY OrderID;
