-- =========================================================
-- SHIP OF LEARNING 
-- Topic: Find Employee -> Manager -> Manager's Manager
-- =========================================================
SELECT * FROM Employee

SELECT
	E.EmpID,E.EmpName, EM.EmpName MANAGERNAME,
	EMM.EmpName MOM
FROM Employee E
LEFT JOIN Employee EM
ON E.ManagerID = EM.EmpID
LEFT JOIN Employee EMM
ON EM.ManagerID = EMM.EmpID