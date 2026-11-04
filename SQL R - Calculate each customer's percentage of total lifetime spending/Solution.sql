--===============================================================
-- CHANNEL : SHIP OF LEARNING
-- TOPIC   : CALCULATE EACH CUSTOMER'S PERCENTAGE OF
--           TOTAL LIFETIME SPENDING
-- PER = Customer spending * 100 / Total Customer spending
--===============================================================
SELECT * FROM Customers
SELECT * FROM Orders

;WITH CTE AS(
SELECT
	C.CustomerID, C.CustomerName,
	ISNULL(SUM(O.Amount),0) LTS
FROM Customers C
LEFT JOIN Orders O
ON C.CustomerID = O.CustomerID
GROUP BY
	C.CustomerID, C.CustomerName)

SELECT
	CustomerID,CustomerName,LTS,
	LTS * 100 / SUM(LTS) OVER()
FROM CTE