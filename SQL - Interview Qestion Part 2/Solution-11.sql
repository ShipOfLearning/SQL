/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	11. You need to list employees who joined in the same month as their manager. 
		How would you do it? */
SELECT * FROM Employees 


SELECT
	E.EmpID,E.EmpName,E.JoinDate AS EJ,
	EM.JoinDate AS EMJ,EM.EmpID,EM.EmpName
FROM Employees E
INNER JOIN Employees EM
ON EM.EmpID = E.ManagerID
WHERE
MONTH(E.JoinDate) = MONTH(EM.JoinDate)