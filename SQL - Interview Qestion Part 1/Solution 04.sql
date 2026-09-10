-- @ShipOfLearning
-- 4. A customer table contains duplicate email addresses. How would you identify duplicates?
SELECT * FROM customers

SELECT
	email, COUNT(*) AS CNT
FROM customers
GROUP BY email
HAVING  COUNT(*) > 1


-- GET ALL CUSTOMER with duplicate emails

SELECT * FROM customers WHERE email IN 
(
	SELECT
		email
	FROM customers
	GROUP BY email
	HAVING  COUNT(*) > 1
)