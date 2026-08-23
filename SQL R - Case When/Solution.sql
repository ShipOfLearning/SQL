-- @ShipOfLearning
-- Case When in Where Clause

--SELECT * FROM Employees
DECLARE @SR AS CHAR(2) = 'ME'

SELECT
	*
FROM Employees
WHERE
	CASE WHEN @SR = 'HE' AND Salary > 80000 THEN
		1
	WHEN @SR = 'ME' AND Salary BETWEEN 60000 AND 80000 THEN
		1
	WHEN @SR  = 'LE' AND Salary < 60000 THEN
		1
	END = 1
	 

