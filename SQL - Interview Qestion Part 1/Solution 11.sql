-- @ShipOfLearning
-- 11. You need to list every employee along with their manager's name. Which SQL query would you use?
SELECT * FROM employees

SELECT 
	E.emp_id,E.emp_name,E.manager_id, EM.emp_name
FROM employees E
LEFT JOIN employees EM
ON E.manager_id = EM.emp_id