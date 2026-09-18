/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	14. You need to calculate each employee's salary growth compared to the previous year. 
		Which window function combo would you use? */
SELECT * FROM SalaryHistory

SELECT
	EmpID, YearNum, Salary,
	LAG(Salary) OVER
	(
		PARTITION BY EMPID
		ORDER BY YearNum 
	) AS PS,
	SALARY - LAG(Salary) OVER
	(
		PARTITION BY EMPID
		ORDER BY YearNum 
	) AS DIFF
FROM SalaryHistory