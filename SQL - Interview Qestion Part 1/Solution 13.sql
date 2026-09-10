-- @ShipOfLearning
-- 13. You want to find customers who have placed orders in all categories available in the system. How would you do it?
SELECT * FROM customers
SELECT * FROM orders
SELECT * FROM order_items
SELECT * FROM products
SELECT * FROM categories

SELECT
	C.customer_id,C.customer_name,*
FROM customers C
INNER JOIN orders O
	ON C.customer_id = O.customer_id
INNER JOIN order_items OT
	ON O.order_id = OT.order_id
INNER JOIN products P
	ON OT.product_id = P.product_id
GROUP BY 
	C.customer_id,C.customer_name
HAVING
	COUNT(DISTINCT category_id) = (SELECT COUNT(*) FROM categories)

--ORDER BY C.customer_name