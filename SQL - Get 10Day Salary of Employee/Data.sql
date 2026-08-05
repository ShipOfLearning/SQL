CREATE TABLE Employees (
    EmployeeID     INT PRIMARY KEY,
    EmployeeName   VARCHAR(100),
    Department     VARCHAR(50),
    MonthlySalary  DECIMAL(10,2)
);

-- Step 2: Insert sample data
INSERT INTO Employees (EmployeeID, EmployeeName, Department, MonthlySalary) VALUES
(1, 'Rahul Sharma', 'IT',      30000.00),
(2, 'Priya Verma',  'HR',      25000.00),
(3, 'Amit Singh',   'Sales',   28000.00),
(4, 'Sneha Patel',  'Finance', 32000.00),
(5, 'Malhar Roy',  'IT', 32000.00);