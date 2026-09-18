/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	2. You need to fetch only the first 5 records from a table. 
		How would you do it? */
SELECT * FROM Employees 

SELECT 
	TOP 5 *
FROM Employees

SELECT
	*
FROM Employees
ORDER BY EmpID
OFFSET 0 ROWS
FETCH NEXT 5 ROWS ONLY
