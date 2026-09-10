-- @ShipOfLearning
-- 2. You accidentally inserted wrong data into a table. How would you correct it?
-- Salary of employee id 101 is 60000

SELECT * FROM Employees

BEGIN TRAN
--SELECT * FROM employees
UPDATE employees
	SET salary = 60000
WHERE 
	emp_id =  101
COMMIT TRAN
--ROLLBACK TRAN

SELECT * FROM employees