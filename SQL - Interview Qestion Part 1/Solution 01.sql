-- @ShipOfLearning
-- 1. You need to find all employees whose salary is greater than 50,000. Which SQL query would you use?
SELECT * FROM Employees

SELECT
	emp_id, emp_name,salary
FROM employees
WHERE
	salary > 50000