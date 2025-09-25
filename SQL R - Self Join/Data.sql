-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ManagerID INT
);

-- Insert sample data
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES
(1, 'Amit', NULL),
(2, 'Rohit', 1),
(3, 'Neha', 1),
(4, 'Suman', 2),
(5, 'Kiran', 2);
