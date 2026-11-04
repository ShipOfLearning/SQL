--============================================================
-- SHIP OF LEARNING - GOOGLE
-- TOPIC: Calculate Days Between Customer Registration
--         and Their First Login
--============================================================

-- STEP 1: DROP EXISTING TABLES IF THEY EXIST

IF OBJECT_ID('dbo.CustomerLogins', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.CustomerLogins;
END;
GO

IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Customers;
END;
GO


-- STEP 2: CREATE CUSTOMERS TABLE

CREATE TABLE dbo.Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    RegistrationDate DATETIME2(0) NOT NULL
);
GO


-- STEP 3: CREATE CUSTOMER LOGINS TABLE

CREATE TABLE dbo.CustomerLogins
(
    LoginID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    LoginDateTime DATETIME2(0) NOT NULL,

    CONSTRAINT FK_CustomerLogins_Customers
        FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customers(CustomerID)
);
GO


-- STEP 4: INSERT CUSTOMER MASTER DATA

INSERT INTO dbo.Customers
(
    CustomerID,
    CustomerName,
    RegistrationDate
)
VALUES
(101, 'Amit',   '2026-01-01 09:00:00'),
(102, 'Priya',  '2026-01-02 10:00:00'),
(103, 'Rahul',  '2026-01-03 11:00:00'),
(104, 'Neha',   '2026-01-04 23:59:00'),
(105, 'Karan',  '2026-01-05 08:00:00'),
(106, 'Sneha',  '2026-01-06 12:00:00'),
(107, 'Vikas',  '2026-01-07 15:00:00'),
(108, 'Anjali', '2026-01-08 09:00:00');
GO


-- STEP 5: INSERT CUSTOMER LOGIN HISTORY

INSERT INTO dbo.CustomerLogins
(
    LoginID,
    CustomerID,
    LoginDateTime
)
VALUES

-- Customer 101: Multiple logins
(1, 101, '2026-01-04 10:00:00'),
(2, 101, '2026-01-05 11:00:00'),
(3, 101, '2026-01-08 09:00:00'),

-- Customer 102: First login after 4 calendar days
(4, 102, '2026-01-06 14:00:00'),
(5, 102, '2026-01-10 16:00:00'),

-- Customer 103: Never logged in
-- No login record

-- Customer 104: Crosses midnight
(6, 104, '2026-01-05 00:01:00'),

-- Customer 105: Same-day first login
(7, 105, '2026-01-05 09:30:00'),
(8, 105, '2026-01-07 10:00:00'),

-- Customer 106: First login after 7 calendar days
(9, 106, '2026-01-13 12:00:00'),

-- Customer 107: Invalid business scenario:
-- Login timestamp occurs before registration
(10, 107, '2026-01-06 10:00:00'),

-- Customer 108: Login on next calendar day
(11, 108, '2026-01-09 08:00:00');
GO


-- STEP 6: VERIFY MASTER DATA

SELECT *
FROM dbo.Customers
ORDER BY CustomerID;

SELECT *
FROM dbo.CustomerLogins
ORDER BY CustomerID, LoginDateTime;
GO
