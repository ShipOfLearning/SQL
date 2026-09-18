/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	5. You need to ensure salary values cannot be NULL. 
		Which constraint would you use? */
SELECT * FROM Employees 

ALTER TABLE EMPLOYEES
ALTER COLUMN SALARY DECIMAL(10,2) NOT NULL

INSERT INTO Employees (EmpID,EmpName,DeptID,Salary)
VALUES
(111,'KK',1,90000)

