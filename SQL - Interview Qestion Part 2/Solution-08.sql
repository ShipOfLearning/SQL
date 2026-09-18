/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	8. You need to find the second highest salary in an employee table. 
		How would you approach it? */
SELECT * FROM Employees 

SELECT MAX(Salary) AS SHS
FROM Employees 
WHERE Salary  < (
SELECT
	MAX(Salary)
FROM Employees)
