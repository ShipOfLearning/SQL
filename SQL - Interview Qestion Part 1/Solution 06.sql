-- @ShipOfLearning
-- 6. You want to count how many employees work in each department. How would you do it?
SELECT * FROM Departments
SELECT * FROM Employees

SELECT
	D.dept_id,D.dept_name, COUNT(E.emp_id) AS CNT
FROM departments D
LEFT JOIN employees E
ON D.dept_id = E.dept_id
GROUP BY D.dept_id,D.dept_name