/* =====================================================================
   TOPIC   : Find Manager Name and Number of Direct Reports (Self Join)
   CHANNEL : Ship of Learning
   ===================================================================== */

-- ---------------------------------------------------------------------
-- STEP 1: Create the Employees table (self-referencing hierarchy)
-- ---------------------------------------------------------------------
CREATE TABLE Employees (
    EmployeeID   INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    ManagerID    INT NULL   -- NULL means this employee has no manager (e.g., CEO)
);

-- ---------------------------------------------------------------------
-- STEP 2: Insert teaching data
-- Includes: a top-level employee with NULL manager (CEO),
--           a manager with ZERO direct reports (Sneha),
--           and a normal multi-level hierarchy
-- ---------------------------------------------------------------------
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES
(1, 'Rohan (CEO)', NULL),      -- Top of hierarchy, no manager
(2, 'Priya',        1),        -- Reports to Rohan
(3, 'Aman',         2),        -- Reports to Priya
(4, 'Kunal',        2),        -- Reports to Priya
(5, 'Sneha',        1),        -- Reports to Rohan, but has NO direct reports herself
(6, 'Ishaan',       3),        -- Reports to Aman
(7, 'Meera',        3);        -- Reports to Aman