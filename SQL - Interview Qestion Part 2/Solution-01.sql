/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	1. You want to display employees sorted by highest salary first. 
		Which clause would you use? */
SELECT * FROM Employees 
SELECT
	EmpID,EmpName,Salary
FROM Employees
ORDER BY Salary DESC