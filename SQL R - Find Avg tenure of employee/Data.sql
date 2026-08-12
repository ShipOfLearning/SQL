DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    DepartmentID   INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID      INT PRIMARY KEY,
    EmployeeName    VARCHAR(50) NOT NULL,
    DepartmentID    INT NULL,               -- NULL edge case: unassigned employee
    HireDate        DATE NOT NULL,
    TerminationDate DATE NULL               -- NULL = currently active employee
);

-- =========================================================
-- STEP 2: INSERT DEPARTMENTS
-- =========================================================

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'HR'),
(4, 'Marketing');   -- Edge case: department with ZERO employees

-- =========================================================
-- STEP 3: INSERT EMPLOYEES (with deliberate edge cases)
-- =========================================================

INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID, HireDate, TerminationDate) VALUES
-- Engineering: mix of active + terminated employees
(101, 'Rahul Sharma',  1, '2018-01-15', '2023-01-15'),   -- exactly 5 years, terminated
(102, 'Priya Verma',   1, '2020-06-01', NULL),           -- active employee (NULL trap)
(103, 'Amit Verma',    1, '2019-03-10', '2019-03-10'),   -- SAME-DAY hire & termination = 0 tenure

-- Sales: duplicate names edge case
(104, 'Sanya Gupta',   2, '2021-01-01', '2022-01-01'),   -- exactly 1 year
(105, 'Sanya Gupta',   2, '2015-07-20', NULL),           -- duplicate name, active employee

-- HR: only ONE employee (tests single-row AVG)
(106, 'Neha Singh',    3, '2022-02-01', NULL),           -- active employee

-- Unassigned employee (NULL DepartmentID edge case)
(107, 'Karan Mehta',   NULL, '2021-05-05', NULL);