--=============================================================
--CHANNEL : SHIP OF LEARNING
--TOPIC   : CALCULATE OUTSTANDING BALANCE FOR EVERY CUSTOMER
--BUSINESS RULE:
--        Outstanding Balance = Total Invoices - Total Payments
--=============================================================
-------------------------------------------------------------
-- STEP 1: DROP EXISTING TABLES SAFELY
-------------------------------------------------------------

IF OBJECT_ID('dbo.CustomerTransactions', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.CustomerTransactions;
END;
GO

IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Customers;
END;
GO

-------------------------------------------------------------
-- STEP 2: CREATE CUSTOMERS TABLE
-------------------------------------------------------------

CREATE TABLE dbo.Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);
GO

-------------------------------------------------------------
-- STEP 3: CREATE CUSTOMER TRANSACTIONS TABLE
-------------------------------------------------------------

CREATE TABLE dbo.CustomerTransactions
(
    TransactionID INT PRIMARY KEY,

    CustomerID INT NOT NULL,

    TransactionType VARCHAR(20) NOT NULL,

    Amount DECIMAL(12,2) NOT NULL,

    TransactionDate DATE NOT NULL,

    CONSTRAINT FK_CustomerTransactions_Customers
        FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customers(CustomerID),

    CONSTRAINT CK_CustomerTransactions_Type
        CHECK (TransactionType IN ('Invoice', 'Payment')),

    CONSTRAINT CK_CustomerTransactions_Amount
        CHECK (Amount > 0)
);
GO

-------------------------------------------------------------
-- STEP 4: INSERT CUSTOMER MASTER DATA
-------------------------------------------------------------

INSERT INTO dbo.Customers
(
    CustomerID,
    CustomerName
)
VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Neha'),
(5, 'Karan'),
(6, 'Sneha');
GO

-------------------------------------------------------------
-- STEP 5: INSERT INVOICE AND PAYMENT DATA
-------------------------------------------------------------

INSERT INTO dbo.CustomerTransactions
(
    TransactionID,
    CustomerID,
    TransactionType,
    Amount,
    TransactionDate
)
VALUES

-- CUSTOMER 1: RAHUL
-- Total Invoice  = 30000
-- Total Payment  = 20000
-- Outstanding   = 10000

(101, 1, 'Invoice', 10000, '2026-01-01'),
(102, 1, 'Invoice', 15000, '2026-01-05'),
(103, 1, 'Invoice',  5000, '2026-01-10'),

(104, 1, 'Payment',  8000, '2026-01-15'),
(105, 1, 'Payment', 12000, '2026-01-20'),


-- CUSTOMER 2: PRIYA
-- Total Invoice  = 45000
-- Total Payment  = 45000
-- Outstanding   = 0

(106, 2, 'Invoice', 25000, '2026-01-02'),
(107, 2, 'Invoice', 20000, '2026-01-08'),

(108, 2, 'Payment', 30000, '2026-01-12'),
(109, 2, 'Payment', 15000, '2026-01-22'),


-- CUSTOMER 3: AMIT
-- Total Invoice  = 25000
-- Total Payment  = 10000
-- Outstanding   = 15000

(110, 3, 'Invoice', 15000, '2026-01-03'),
(111, 3, 'Invoice', 10000, '2026-01-11'),

(112, 3, 'Payment', 10000, '2026-01-18'),


-- CUSTOMER 4: NEHA
-- Invoice only
-- Outstanding = 18000

(113, 4, 'Invoice', 18000, '2026-01-09'),


-- CUSTOMER 5: KARAN
-- Payment only
-- Outstanding = -5000 (Credit / Advance)

(114, 5, 'Payment', 5000, '2026-01-19');

-- CUSTOMER 6: SNEHA
-- No transactions
-- Outstanding = 0

GO

-------------------------------------------------------------
-- STEP 6: VERIFY MASTER DATA
-------------------------------------------------------------

SELECT *
FROM dbo.Customers
ORDER BY CustomerID;

SELECT *
FROM dbo.CustomerTransactions
ORDER BY CustomerID, TransactionDate, TransactionID;
GO

/*
=============================================================
MASTER DATA SUMMARY

RAHUL : 30000 - 20000 = 10000
PRIYA : 45000 - 45000 =     0
AMIT  : 25000 - 10000 = 15000
NEHA  : 18000 -     0 = 18000
KARAN :     0 -  5000 = -5000
SNEHA :     0 -     0 =     0

=============================================================
*/
