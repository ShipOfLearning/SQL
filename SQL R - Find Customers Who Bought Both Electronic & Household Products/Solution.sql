--========================================================
--Ship of Learning | Most asked interview Quetion
--Topic: Find Customers Who Bought Both 
--	Electronic & Household Products 
--========================================================
SELECT * FROM Orders

SELECT
	CustomerID
FROM Orders
WHERE Category IN ('Electronic','Household')
GROUP BY  CustomerID
HAVING COUNT(DISTINCT Category) = 2