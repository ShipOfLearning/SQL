-- LAG() AND LEAD()
-- LAG() - returns the value of a column from a previous row
-- LEAD() - t returns the value of a column from a next row




SELECT * FROM employees ORDER BY emp_id

--LEAD()
SELECT emp_id,emp_name,salary,dept_id,
	LEAD(salary) OVER (ORDER BY EMP_ID) AS NEXT_EMP_SALARY
FROM employees

--LEG()
SELECT emp_id,emp_name,salary,dept_id,
	LAG(salary) OVER (ORDER BY EMP_ID) AS PRE_EMP_SALARY
FROM employees
