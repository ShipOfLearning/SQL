--===============================================================
-- CHANNEL : SHIP OF LEARNING - Amazon
-- TOPIC   : Find Products Purchased by At 
--				Least 5 Unique Customers
--===============================================================
SELECT * FROM Purchases

SELECT
	ProductID, ProductName,
	COUNT(DISTINCT CustomerID) AS CNT
FROM Purchases
GROUP BY 
	ProductID, ProductName

HAVING 
	COUNT(DISTINCT CustomerID) >= 5
