-- Sub Query (Query inside query)
SELECT * FROM employees
SELECT * FROM departments

-- SUB QUERY IN WHERE CLUASE
SELECT  emp_id,emp_name,salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)

-- SUB QUERY IN SELECT
SELECT
	emp_id,emp_name,salary, (SELECT AVG(salary) FROM employees) AS AVG_SALARY
FROM employees

-- SUB QUERY IN FROM CLAUSE
SELECT DEPT.dept_id,dept_name,TEMP.MAX_SALARY
FROM
(SELECT dept_id,MAX(SALARY) AS MAX_SALARY
FROM employees
GROUP BY dept_id) AS TEMP
INNER JOIN departments DEPT
ON TEMP.dept_id = DEPT.dept_id

-- CORRELATED SUBQUERY
SELECT emp_id,emp_name,salary,dept_id
FROM employees E
WHERE salary = 
(
SELECT MAX(SALARY)
FROM employees
 WHERE dept_id = E.dept_id
)