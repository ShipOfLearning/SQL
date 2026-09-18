/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	7. You want to combine results from two tables with the same structure and remove duplicates. 
	Which operator would you use? */
SELECT * FROM Employees2023
SELECT * FROM Employees2024

SELECT *
FROM Employees2023
UNION 
SELECT *
FROM Employees2024

SELECT EmpID
FROM Employees2023
UNION 
SELECT EmpID
FROM Employees2024

SELECT *
FROM Employees2023
UNION ALL
SELECT *
FROM Employees2024