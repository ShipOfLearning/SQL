-- ================================
-- Ship of Learning | Master Dataset
-- Topic: Manager & Reportee Count
-- Asked in: Google SQL Interview
-- ================================

DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmployeeID   INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ManagerID    INT NULL
);

INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES
(1, 'Rohit Sharma', NULL),     -- Top-level, CEO, no manager
(2, 'Anjali Mehta', 1),
(3, 'Karan Verma', 1),
(4, 'Priya Nair', 2),
(5, 'Sameer Khan', 2),
(6, 'Neha Gupta', 3),
(7, 'Arjun Rao', 3),
(8, 'Divya Patel', 3),
(9, 'Vikram Singh', 4),
(10,'Simran Kaur', NULL);      -- Standalone employee, no manager, no reportees