-- ============================================
-- TOPIC: Find Employees Earning More Than Their Manager
-- Concept: Self Join
-- ============================================

-- STEP 1: Create Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary INT,
    ManagerID INT NULL   -- NULL allowed for top-level employee (CEO)
);

-- STEP 2: Insert Sample Data (with intentional edge cases)
INSERT INTO Employees (EmpID, EmpName, Salary, ManagerID) VALUES
(1, 'Aman (CEO)', 90000, NULL),      -- Top-level employee, no manager
(2, 'Rahul', 95000, 1),              -- Earns MORE than manager (Aman)
(3, 'Priya', 70000, 1),              -- Earns LESS than manager
(4, 'Kabir', 90000, 1),              -- Earns EQUAL to manager (edge case)
(5, 'Neha', 85000, 3),               -- Earns MORE than manager (Priya)
(6, 'Arjun', 60000, 3),              -- Earns LESS than manager
(7, 'Simran', 88000, 5);             -- Earns MORE than manager (Neha)
