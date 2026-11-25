
/*===============================================================
SHIP OF LEARNING
TOPIC: Cumulative Bank Account Balance After Every Transaction
PLATFORM: Microsoft SQL Server 2022
===============================================================

TABLES:
1. dbo.Accounts
2. dbo.BankTransactions

TRANSACTION AMOUNTS:
Deposit    = Positive amount
Withdrawal = Negative amount

OPENING BALANCE:
Stored separately in dbo.Accounts

===============================================================*/

--=============================================================
-- 1. DROP EXISTING TABLES
--=============================================================

IF OBJECT_ID('dbo.BankTransactions', 'U') IS NOT NULL
    DROP TABLE dbo.BankTransactions;

IF OBJECT_ID('dbo.Accounts', 'U') IS NOT NULL
    DROP TABLE dbo.Accounts;

--=============================================================
-- 2. CREATE ACCOUNTS TABLE
--=============================================================

CREATE TABLE dbo.Accounts
(
    AccountID       INT             NOT NULL PRIMARY KEY,
    AccountHolder   VARCHAR(100)    NOT NULL,
    OpeningBalance  DECIMAL(18,2)   NOT NULL
);

--=============================================================
-- 3. CREATE BANK TRANSACTIONS TABLE
--=============================================================

CREATE TABLE dbo.BankTransactions
(
    TransactionID      INT             NOT NULL PRIMARY KEY,
    AccountID          INT             NOT NULL,
    TransactionDate    DATETIME2(0)    NOT NULL,
    TransactionType    VARCHAR(20)      NOT NULL,
    TransactionAmount  DECIMAL(18,2)   NOT NULL,

    CONSTRAINT FK_BankTransactions_Accounts
        FOREIGN KEY (AccountID)
        REFERENCES dbo.Accounts(AccountID),

    CONSTRAINT CK_BankTransactions_Amount
        CHECK (TransactionAmount <> 0),

    CONSTRAINT CK_BankTransactions_Type
        CHECK (TransactionType IN ('Deposit', 'Withdrawal'))
);

--=============================================================
-- 4. INSERT ACCOUNT MASTER DATA
--=============================================================

INSERT INTO dbo.Accounts
(
    AccountID,
    AccountHolder,
    OpeningBalance
)
VALUES
(101, 'Aarav Sharma', 10000.00),
(102, 'Priya Patel',   5000.00),
(103, 'Rahul Mehta',   2500.00);

--=============================================================
-- 5. INSERT TRANSACTION DATA
--=============================================================

INSERT INTO dbo.BankTransactions
(
    TransactionID,
    AccountID,
    TransactionDate,
    TransactionType,
    TransactionAmount
)
VALUES
-- Account 101
(1, 101, '2026-11-01 09:00:00', 'Deposit',     2000.00),
(2, 101, '2026-11-01 10:00:00', 'Withdrawal',   -500.00),
(3, 101, '2026-11-01 10:00:00', 'Deposit',     1500.00),
(4, 101, '2026-11-02 09:00:00', 'Withdrawal',  -1000.00),
(5, 101, '2026-11-03 11:00:00', 'Deposit',      750.00),

-- Account 102
(6, 102, '2026-11-01 08:00:00', 'Deposit',     1000.00),
(7, 102, '2026-11-02 08:00:00', 'Withdrawal',   -200.00),
(8, 102, '2026-11-02 08:00:00', 'Withdrawal',   -300.00),
(9, 102, '2026-11-03 08:00:00', 'Deposit',      600.00),

-- Account 103
(10, 103, '2026-11-01 12:00:00', 'Withdrawal',  -400.00),
(11, 103, '2026-11-02 12:00:00', 'Deposit',      900.00),
(12, 103, '2026-11-03 12:00:00', 'Withdrawal',  -250.00);

--=============================================================
-- 6. VERIFY MASTER DATA
--=============================================================

SELECT *
FROM dbo.Accounts
ORDER BY AccountID;

SELECT *
FROM dbo.BankTransactions
ORDER BY AccountID, TransactionDate, TransactionID;
