-- @ShipOfLearning
-- Windows Funcaiton Lag(), Lead(), First_Value(), Last_Value()

SELECT * FROM Employees
SELECT * FROM StockPrices
--Top 3 per department, plus difference from the previous joiner's salary"

-- Last_Value function
SELECT
	EmpName,Department,HireDate,Salary,
	LAST_VALUE(Salary) OVER
	(
		PARTITION BY Department
		ORDER BY SALARY DESC
		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING 
	) AS DLS
FROM Employees

-- First_Value function
SELECT
	EmpName,Department,HireDate,Salary,
	FIRST_VALUE(Salary) OVER
	(
		PARTITION BY Department
		ORDER BY SALARY DESC
	) AS DHS
FROM Employees

-- Lead function
SELECT
	StockName,PriceDate,ClosePrice,
	LEAD(ClosePrice) OVER
	(
		PARTITION BY STOCKNAME
		ORDER BY PRICEDATE
	) AS NCP,
	LEAD(ClosePrice,2) OVER
	(
		PARTITION BY STOCKNAME
		ORDER BY PRICEDATE
	) AS NCP2
FROM StockPrices

-- Lag function
SELECT
	StockName,PriceDate,ClosePrice,
	LAG(ClosePrice) OVER
	(
		PARTITION BY STOCKNAME
		ORDER BY PRICEDATE
	) AS PCP,
	LAG(ClosePrice,2) OVER
	(
		PARTITION BY STOCKNAME
		ORDER BY PRICEDATE
	) AS PCP2
FROM StockPrices
