-- @ShipOfLearning
-- 15. You need a report showing total sales for each month laid out as separate columns (Jan, Feb, Mar...). Which technique would you use?
SELECT * FROM orders
SELECT * FROM order_items

-- Conditional Aggrigation
SELECT
	SUM(CASE WHEN MONTH(O.order_date) = 1 THEN
		(OT.quantity * OT.price)
	END) AS 'JAN',
	SUM(CASE WHEN MONTH(O.order_date) = 2 THEN
		(OT.quantity * OT.price)
	END) AS 'FEB',
	SUM(CASE WHEN MONTH(O.order_date) = 3 THEN
		(OT.quantity * OT.price)
	END) AS 'MARCH'

FROM orders O
INNER JOIN order_items OT
ON O.order_id = OT.order_id


---With Pivot Operator
SELECT 
    [1] AS JAN,
    [2] AS FEB,
    [3] AS MARCH
FROM (
    SELECT 
        MONTH(O.order_date) AS order_month,
        OT.quantity * OT.price AS line_total
    FROM orders O
    INNER JOIN order_items OT ON O.order_id = OT.order_id
) AS src
PIVOT (
    SUM(line_total)
    FOR order_month IN ([1], [2], [3])
) AS pvt;