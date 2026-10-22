--============================================================
-- SHIP OF LEARNING
-- TOPIC: Find the Top 3 Customers by Total Purchase Amount
--============================================================
-- =========================================================
-- SECTION 01: DROP TABLE IF IT EXISTS
-- =========================================================

IF OBJECT_ID('dbo.CustomerOrders', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.CustomerOrders;
END;
GO

-- =========================================================
-- SECTION 02: CREATE TABLE
-- =========================================================

CREATE TABLE dbo.CustomerOrders
(
    OrderID       INT           NOT NULL PRIMARY KEY,
    CustomerID    INT           NOT NULL,
    CustomerName  NVARCHAR(100) NOT NULL,
    OrderDate     DATE          NOT NULL,
    OrderAmount   DECIMAL(12,2) NOT NULL,
    OrderStatus   VARCHAR(20)   NOT NULL,

    CONSTRAINT CK_CustomerOrders_Amount
        CHECK (OrderAmount >= 0),

    CONSTRAINT CK_CustomerOrders_Status
        CHECK (OrderStatus IN
            ('Completed', 'Pending', 'Cancelled'))
);
GO

-- =========================================================
-- SECTION 03: INSERT SAMPLE DATA
-- =========================================================

INSERT INTO dbo.CustomerOrders
(
    OrderID,
    CustomerID,
    CustomerName,
    OrderDate,
    OrderAmount,
    OrderStatus
)
VALUES
(1, 101, N'Aakash', '2026-01-05', 50000, 'Completed'),

(2, 102, N'Bhavna', '2026-01-06', 20000, 'Completed'),
(3, 102, N'Bhavna', '2026-01-07', 20000, 'Completed'),
(4, 102, N'Bhavna', '2026-01-08', 20000, 'Completed'),
(5, 102, N'Bhavna', '2026-01-09', 20000, 'Completed'),

(6, 103, N'Chirag', '2026-01-10', 65000, 'Completed'),

(7, 104, N'Divya', '2026-01-11', 35000, 'Completed'),
(8, 104, N'Divya', '2026-01-12', 15000, 'Completed'),

(9, 105, N'Eshan', '2026-01-13', 30000, 'Completed'),

(10, 106, N'Farhan', '2026-01-14', 90000, 'Completed'),

-- Excluded from spending calculations
(11, 101, N'Aakash', '2026-01-15', 80000, 'Cancelled'),
(12, 105, N'Eshan', '2026-01-16', 70000, 'Pending');
GO

-- =========================================================
-- SECTION 04: VERIFY MASTER DATA
-- =========================================================

SELECT *
FROM dbo.CustomerOrders
ORDER BY CustomerID, OrderID;
