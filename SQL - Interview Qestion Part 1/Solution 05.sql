-- @ShipOfLearning
-- 5. Two tables contain customer and order information. How would you retrieve customers along with their orders?
SELECT * FROM customers
SELECT * FROM orders

SELECT
	C.customer_id,customer_name,email,
	order_id
FROM customers C
INNER JOIN orders O
ON C.customer_id = O.customer_id

--FIND CUSTOMER WHO NEVER PLACED ORDER
