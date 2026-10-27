--===============================================================================
-- Channel : Ship of Learning - Meta 
-- Topic   : Divide Customers Into Four Spending Groups
--===============================================================================
SELECT * FROM Customers
SELECT * FROM Orders

;WITH CTE AS (
SELECT
	C.CustomerID,C.CustomerName,
	SUM(O.OrderAmount) OA
FROM Customers C
JOIN Orders O
ON C.CustomerID = O.CustomerID
AND OrderStatus = 'Completed' 
GROUP BY 
	C.CustomerID,C.CustomerName)
SELECT
	*,
	NTILE(4) OVER
	(
		ORDER BY OA DESC
	)
FROM CTE