--============================================================
-- SHIP OF LEARNING - GOOGLE
-- TOPIC: Calculate Days Between Customer Registration
--         and Their First Login
--============================================================
SELECT * FROM Customers
SELECT * FROM CustomerLogins

SELECT
	C.CustomerID,C.CustomerName,C.RegistrationDate,
	MIN(CL.LoginDateTime) FLC,
	DATEDIFF(DAY,C.RegistrationDate,MIN(CL.LoginDateTime)) DA
FROM Customers C
LEFT JOIN CustomerLogins CL
ON C.CustomerID = CL.CustomerID
GROUP BY 
	C.CustomerID,C.CustomerName,C.RegistrationDate
	