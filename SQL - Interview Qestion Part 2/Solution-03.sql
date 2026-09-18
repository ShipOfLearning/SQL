/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	3. You want to remove all records from a table but keep the table structure. 
		Which command would you use? */
SELECT * FROM employees

--BEGIN TRAN
--DELETE FROM Employees
--COMMIT TRAN

BEGIN TRAN
TRUNCATE TABLE EMPLOYEES
--ROLLBACK TRAN
COMMIT TRAN


