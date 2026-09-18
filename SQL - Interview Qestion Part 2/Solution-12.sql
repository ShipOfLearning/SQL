/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	12. You want to find departments where the average salary is greater than the company average salary. 
		How would you do it? */
SELECT * FROM employees

SELECT
	DeptID,AVG(Salary) DAS
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 
(
SELECT AVG(SALARY) FROM Employees)
