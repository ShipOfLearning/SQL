-- =========================================
-- MASTER TABLE: Employee Hierarchy
-- =========================================
CREATE TABLE Employee (
    EmpID       INT PRIMARY KEY,
    EmpName     VARCHAR(50),
    Designation VARCHAR(50),
    ManagerID   INT NULL
);

-- =========================================
-- MASTER DATA: Sample Organization Hierarchy
-- =========================================
INSERT INTO Employee (EmpID, EmpName, Designation, ManagerID) VALUES
(1, 'Neha Sharma',  'VP - Engineering',      NULL),
(2, 'Rohit Verma',  'Engineering Manager',   1),
(3, 'Amit Kumar',   'Software Engineer',     2),
(4, 'Priya Singh',  'Software Engineer',     2),
(5, 'Sanjay Mehta', 'QA Manager',            1),
(6, 'Kavita Rao',   'QA Engineer',           5),
(7, 'Arjun Nair',   'QA Engineer',           5),
(8, 'Divya Iyer',   'Senior Software Engineer', 2);