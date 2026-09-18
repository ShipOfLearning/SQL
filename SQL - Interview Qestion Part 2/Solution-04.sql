/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	4. A table should not allow duplicate employee IDs. 
		Which constraint would you apply? */
SELECT * FROM employees

ALTER TABLE EMPLOYEES
ADD CONSTRAINT PK_EMPLOYEES 
	PRIMARY KEY (EMPID)