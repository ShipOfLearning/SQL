--=============================================================
--CHANNEL : SHIP OF LEARNING - META
--TOPIC   : RUNNING TOTAL OF EXPENSES BY DEPARTMENT
--=============================================================
SELECT * FROM Expenses ORDER BY Department, ExpenseDate

SELECT
	ExpenseID,Department,ExpenseDate,ExpenseAmount,
	SUM(ExpenseAmount) OVER
	(
		PARTITION BY Department
		ORDER BY ExpenseDate, ExpenseID
		ROWS BETWEEN UNBOUNDED PRECEDING AND
		CURRENT ROW
	) RT
FROM Expenses
