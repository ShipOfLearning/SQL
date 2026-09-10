-- @ShipOfLearning
-- 8. A manager asks for the total purchase made by each customer. Which SQL function and clause would help?
SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM order_items

SELECT
	C.customer_id,C.customer_name,
	SUM(ISNULL(ROUND((OT.quantity * OT.price),2),0)) AS ORER_VALUE
FROM customers C
LEFT JOIN orders O
	ON C.customer_id = O.customer_id
LEFT JOIN order_items OT
	ON OT.order_id = O.order_id
GROUP BY
	C.customer_id,C.customer_name
	