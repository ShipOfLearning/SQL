-- @ShipOfLearning
-- Shipped & Delivered Count by Country

SELECT * FROM Orders

SELECT
	Country,
	COUNT(CASE WHEN OrderStatus = 'Shipped' THEN 1 END)
		AS Shipped,
	COUNT(CASE WHEN OrderStatus = 'Delivered' THEN 1 END)
		AS Delivered
FROM Orders
GROUP BY Country


-- Same Result with Pivot Operator
SELECT Country, [Shipped] AS ShippedCount, [Delivered] AS DeliveredCount
FROM
(
    SELECT Country, OrderStatus
    FROM Orders
) AS SourceTable
PIVOT
(
    COUNT(OrderStatus)
    FOR OrderStatus IN ([Shipped], [Delivered])
) AS PivotTable
ORDER BY Country;