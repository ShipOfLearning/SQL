/*======================================================
 SHIP OF LEARNING
 Topic: Find customers who purchased in at least 
         3 UNIQUE categories
 Server: MS SQL Server (T-SQL)
=======================================================*/
SELECT * FROM customers
SELECT * FROM Purchases

SELECT
    C.CustomerID,MAX(C.CustomerName) AS CUST_NAME,
    COUNT(DISTINCT P.Category) AS CNT
FROM Customers C
JOIN Purchases P
    ON C.CustomerID = P.CustomerID
WHERE P.Category IS NOT NULL
GROUP BY C.CustomerID
HAVING COUNT(DISTINCT P.Category) >= 3
