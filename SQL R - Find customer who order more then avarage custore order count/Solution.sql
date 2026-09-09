/*================================================================
  SHIP OF LEARNING
  Topic   : Find Customers Who Order More Than the Average 
            CustomerOrder Count (Asked in Google SQL Interview)
================================================================ */
SELECT * FROM Customers
SELECT * FROM Orders
;WITH CTE1 AS 
(
    SELECT
        CustomerID,COUNT(*) CNT
    FROM Orders
    GROUP BY CustomerID
),
CTE2 AS
(
    SELECT
        AVG(CNT) AS AC
    FROM CTE1
)
SELECT 
    C.CustomerID,C.CustomerName,CNT,CTE2.AC
FROM Customers C
JOIN CTE1 C1
ON C.CustomerID = C1.CustomerID
CROSS JOIN CTE2
WHERE CNT > AC