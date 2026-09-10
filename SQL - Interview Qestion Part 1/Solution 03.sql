-- @ShipOfLearning
-- 3. A table contains NULL values in the phone number column. How would you retrieve only rows with missing phone numbers?
SELECT * FROM Customers

SELECT
	customer_id,customer_name,email
FROM customers
WHERE
	phone IS NULL

--get all customer where phone is not available text should be 'not available'
