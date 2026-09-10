-- @ShipOfLearning
-- 9. A report should show only departments with more than 2 employees. Which clause would you use after GROUP BY?
SELECT * FROM employees
SELECT * FROM departments

SELECT
	D.dept_id,D.dept_name,COUNT(E.emp_id) AS CNT
FROM departments D
LEFT JOIN employees E
ON	D.dept_id = E.dept_id
GROUP BY
	D.dept_id,D.dept_name
HAVING
	COUNT(E.emp_id) > 2