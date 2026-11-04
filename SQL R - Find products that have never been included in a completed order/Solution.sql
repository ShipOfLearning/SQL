--=============================================================
--CHANNEL : SHIP OF LEARNING - AMAZON
--TOPIC   : FIND PRODUCTS NEVER INCLUDED IN A COMPLETED ORDER
--=============================================================
SELECT * FROM Products
SELECT * FROM OrderItems

SELECT
	P.ProductID,P.ProductName,P.Category
FROM Products P
WHERE NOT EXISTS
(
	SELECT 1
	FROM OrderItems O
	WHERE O.ProductID = P.ProductID
	AND O.OrderStatus = 'Completed'
)



















