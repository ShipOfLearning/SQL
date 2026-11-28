/*===============================================================
SHIP OF LEARNING
TOPIC: Find the First Date on Which Each Product Reaches
        or Exceeds Its Cumulative Sales Target
===============================================================*/
SELECT * FROM Products
SELECT * FROM Sales

;WITH DS AS
(
    SELECT
        ProductID,SaleDate,
        SUM(SalesQty) DAILY_SALES
    FROM Sales
    GROUP BY
        ProductID,SaleDate
),
CS AS
(
    SELECT
        ProductID,SaleDate,DAILY_SALES,
        SUM(DAILY_SALES) OVER
        (
            PARTITION BY ProductID
            ORDER BY SaleDate
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) CUMILATIVE_SALE
    FROM DS
),
TM AS
(
    SELECT
        P.ProductID,P.ProductName,P.SalesTarget,
        SaleDate,C.CUMILATIVE_SALE,
        ROW_NUMBER() OVER
        (
            PARTITION BY  P.ProductID
            ORDER BY SaleDate
        ) RN
    FROM CS C
    JOIN Products P
    ON C.ProductID = P.ProductID
    WHERE
        C.CUMILATIVE_SALE > = P.SalesTarget
)
SELECT
    *
FROM TM
WHERE RN = 1
