-- @ShipOfLearning
-- 7. You need to find customers who have not placed any orders. Which join would you use?
SELECT * FROM Customers
SELECT * FROM Orders

SELECT
	C.customer_id,C.customer_name,C.email	
FROM customers C
LEFT JOIN orders O
ON C.customer_id = O.customer_id
WHERE
	O.order_id IS NULL


-- Solutin with Right join

SELECT
	C.customer_id,C.customer_name,C.email	
FROM orders O
RIGHT JOIN customers C
ON C.customer_id = O.customer_id
WHERE
	O.order_id IS NULL