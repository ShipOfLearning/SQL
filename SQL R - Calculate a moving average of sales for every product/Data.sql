/*=============================================================
SHIP OF LEARNING
TOPIC: CALCULATE A MOVING AVERAGE OF SALES FOR EVERY PRODUCT
PLATFORM: MICROSOFT SQL SERVER 2022

INTERVIEW PROBLEM:
Calculate the moving average of sales for every product.
The rolling window includes the current sale and the
previous 2 sales for the same product.

DATA MODEL:
1 TABLE ONLY - SALES
=============================================================*/

/*=============================================================
  SECTION 1: CLEANUP
=============================================================*/

IF OBJECT_ID('dbo.Sales', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Sales;
END;
GO


/*=============================================================
  SECTION 2: CREATE TABLE
=============================================================*/

CREATE TABLE dbo.Sales
(
    SaleID       INT           NOT NULL PRIMARY KEY,
    ProductID    INT           NOT NULL,
    SaleDate     DATE          NOT NULL,
    SalesAmount  DECIMAL(10,2) NOT NULL
);
GO


/*=============================================================
  SECTION 3: INSERT MASTER DATA
=============================================================*/

INSERT INTO dbo.Sales
(
    SaleID,
    ProductID,
    SaleDate,
    SalesAmount
)
VALUES
(1, 101, '2026-01-01', 100.00),
(2, 101, '2026-01-02', 200.00),
(3, 101, '2026-01-03', 300.00),
(4, 101, '2026-01-04', 400.00),
(5, 101, '2026-01-05', 500.00),

(6, 102, '2026-01-01', 500.00),
(7, 102, '2026-01-03', 700.00),
(8, 102, '2026-01-04', 900.00),
(9, 102, '2026-01-05', 1100.00),

(10, 103, '2026-01-01', 50.00),
(11, 103, '2026-01-02', 100.00),
(12, 103, '2026-01-05', 150.00);
GO


/*=============================================================
  SECTION 4: VERIFY MASTER DATA
=============================================================*/

SELECT *
FROM dbo.Sales
ORDER BY ProductID, SaleDate, SaleID;
GO


