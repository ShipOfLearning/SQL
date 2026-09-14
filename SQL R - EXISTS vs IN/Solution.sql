/*==================================================
  SHIP OF LEARNING
  Topic   : In vs Exists
================================================== */
SELECT * FROM Customers
SELECT * FROM Orders

SELECT
	CustomerID,CustomerName
FROM Customers
WHERE CustomerID NOT IN
(
	SELECT CustomerID FROM Orders
)

SELECT
	CustomerID,CustomerName
FROM Customers C
WHERE NOT EXISTS 
(
	SELECT 1 FROM Orders O
	WHERE O.CustomerID = C.CustomerID
)