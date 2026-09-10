-- @ShipOfLearning
-- 14. You want to find the top 1 products in each category by total quantity sold. How would you do it?
SELECT * FROM orders
SELECT * FROM order_items
SELECT * FROM products
SELECT * FROM categories

;WITH CTE AS 
(
	SELECT
		P.product_id,P.product_name,C.category_id,C.category_name,
		SUM(OT.quantity) AS QNT,
		DENSE_RANK() OVER
		(
			PARTITION BY C.category_name
			ORDER BY SUM(OT.quantity) DESC
		) AS RN
	FROM order_items OT
	INNER JOIN products P
		ON OT.product_id = P.product_id
	INNER JOIN categories C
		ON C.category_id = P.category_id
	GROUP BY 
		P.product_id,P.product_name,C.category_id,C.category_name
)
SELECT * FROM CTE WHERE RN = 1

-- As Subquery
SELECT * FROM
(
	SELECT
		P.product_id,P.product_name,C.category_id,C.category_name,
		SUM(OT.quantity) AS QNT,
		DENSE_RANK() OVER
		(
			PARTITION BY C.category_name
			ORDER BY SUM(OT.quantity) DESC
		) AS RN
	FROM order_items OT
	INNER JOIN products P
		ON OT.product_id = P.product_id
	INNER JOIN categories C
		ON C.category_id = P.category_id
	GROUP BY 
		P.product_id,P.product_name,C.category_id,C.category_name
) AS SQ
WHERE RN = 1