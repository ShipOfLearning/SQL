--====================================================================
--  CHANNEL      : SHIP OF LEARNING (1164)
--  TOPIC        : All Product Price at a Given Date
--  TARGET DATE  : 2019-08-16
--  DEFAULT PRICE: 10
--====================================================================
SELECT * FROM products

;WITH AP AS
(
	SELECT
		DISTINCT product_id
	FROM Products
),
PH AS
(
	SELECT 
		product_id,new_price,change_date,
		ROW_NUMBER() OVER
		(
			PARTITION BY product_id
			ORDER BY change_date DESC
		) AS RN
	FROM Products
	WHERE change_date <= '2019-08-16'
)
SELECT
	A.product_id, ISNULL(P.new_price,10) new_price
FROM AP A
LEFT JOIN PH P
ON A.product_id = P.product_id AND RN = 1