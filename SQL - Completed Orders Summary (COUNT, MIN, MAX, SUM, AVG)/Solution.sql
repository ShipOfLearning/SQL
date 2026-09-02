-- @ShipOfLearning
-- Completed Orders Summary (COUNT, MIN, MAX, SUM, AVG)
--SELECT * FROM Orders

SELECT
	COUNT(*)		AS TOTAL_ORDER,
	MIN(OrderAmount)	AS MIN_VALUE,
	MAX(OrderAmount)	AS MAX_VALUE,
	SUM(OrderAmount)	AS SUM_VALUE,
	AVG(OrderAmount)	AS AVG_VALUE
FROM Orders
WHERE
	OrderStatus = 'Completed'
