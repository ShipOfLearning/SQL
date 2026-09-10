-- @ShipOfLearning
-- 12. You want to find the top 2 highest paid employees in each department. How would you do it?
SELECT * FROM employees

SELECT	
	emp_id,emp_name,dept_id,salary
FROM
(
	SELECT
		emp_id,emp_name,dept_id,salary,
		ROW_NUMBER() OVER
		(
			PARTITION BY dept_id
			ORDER BY salary DESC
		) AS RN
	FROM employees
) AS E
WHERE RN < 3