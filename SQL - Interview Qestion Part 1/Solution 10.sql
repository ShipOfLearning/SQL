-- @ShipOfLearning
-- 10. You need to find employees who earn more than the average salary of their department. How would you write it?
SELECT * FROM employees

SELECT
	E.emp_id,E.emp_name,E.salary,E.dept_id
FROM employees E
WHERE E.salary > 
(
	SELECT
		AVG(salary)
	FROM employees E1
	WHERE E.dept_id = E1.dept_id
)

--- AVG salary of Department
SELECT
	AVG(salary),dept_id
FROM employees
GROUP BY dept_id

-- JOIN CORRELATED
SELECT 
    E.emp_id,E.emp_name,E.salary,E.dept_id
FROM employees E
JOIN (
    SELECT 
        dept_id, 
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
) AS DeptAvg
    ON E.dept_id = DeptAvg.dept_id
WHERE E.salary > DeptAvg.avg_salary;

-- WINDOWS FUCNTION
;WITH CTE AS
(
	SELECT 
		emp_id,emp_name,salary,dept_id,
		AVG(salary) OVER
		(
			PARTITION BY dept_id
		) AS AVG_SALARY
	FROM employees
)
SELECT * FROM CTE WHERE salary > AVG_SALARY
