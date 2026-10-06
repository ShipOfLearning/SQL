--=======================================================================
-- SHIP OF LEARNING : Microsoft
-- TOPIC : Find All Employees With the Same Salary
--=====================================================================


/*=====================================================================
  STEP 1: DROP TABLE IF IT ALREADY EXISTS
=====================================================================*/

IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Employees;
END;
GO


/*=====================================================================
  STEP 2: CREATE EMPLOYEES TABLE
=====================================================================*/

CREATE TABLE dbo.Employees
(
    EmployeeID   INT           NOT NULL PRIMARY KEY,
    EmployeeName VARCHAR(100)  NOT NULL,
    Department   VARCHAR(50)   NOT NULL,
    Salary       DECIMAL(12,2) NULL
);
GO


/*=====================================================================
  STEP 3: INSERT SAMPLE DATA
=====================================================================*/

INSERT INTO dbo.Employees
(
    EmployeeID,
    EmployeeName,
    Department,
    Salary
)
VALUES
(1, 'Rahul',  'IT',      60000.00),
(2, 'Priya',  'HR',      75000.00),
(3, 'Amit',   'Finance', 60000.00),
(4, 'Neha',   'IT',      90000.00),
(5, 'Karan',  'Sales',   75000.00),
(6, 'Anjali', 'IT',      95000.00),
(7, 'Vikram', 'Finance', 95000.00),
(8, 'Rohan',  'IT',     110000.00),
(9, 'Dilip',  'IT',     NULL),
(10, 'Manohar',  'IT',     NULL);
GO


/*=====================================================================
  VERIFY MASTER DATA
=====================================================================*/

SELECT
    EmployeeID,
    EmployeeName,
    Department,
    Salary
FROM dbo.Employees
GO
