--=================================================================
--CHANNEL : SHIP OF LEARNING
--TOPIC   : FIND CUSTOMERS WHOSE PHONE NUMBERS CONTAIN
--          SPACES, HYPHENS, OR BRACKETS
--=================================================================
--=================================================================
--STEP 1: DROP EXISTING TABLE IF IT EXISTS
--=================================================================


IF OBJECT_ID(N'dbo.Customers', N'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Customers;
END;
GO

--=================================================================
--STEP 2: CREATE CUSTOMERS TABLE
--=================================================================

CREATE TABLE dbo.Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    PhoneNumber NVARCHAR(30)
);
GO

--=================================================================
--STEP 3: INSERT SAMPLE DATA
--=================================================================

INSERT INTO dbo.Customers
(
    CustomerID,
    CustomerName,
    PhoneNumber
)
VALUES
(1,  N'Amit',       N'9876543210'),

(2,  N'Rahul',      N'98765-43210'),

(3,  N'Priya',      N'(987) 654-3210'),

(4,  N'Neha',       N'98765 43210'),

(5,  N'Vikram',     N'[98765]43210'),

(6,  N'Anjali',     N'9876543211'),

(7,  N'Rohit',      NULL),

(8,  N'Sneha',      N'+91-9876543212'),

(9,  N'Karan',      N'09876543210'),

(10, N'Pooja',      N'[98765]-43210');
GO

--=================================================================
--STEP 4: VIEW COMPLETE CUSTOMER DATA
--=================================================================

SELECT
    CustomerID,
    CustomerName,
    PhoneNumber
FROM dbo.Customers
ORDER BY CustomerID;
GO