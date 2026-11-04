--============================================================
--CHANNEL : SHIP OF LEARNING - AMAZON
--TOPIC   : FIND CUSTOMERS WHO HAVE NOT LOGGED IN
--          SINCE THEIR LAST PURCHASE
--============================================================
/*==========================================================
  STEP 1: DROP EXISTING TABLES IF THEY EXIST
==========================================================*/

IF OBJECT_ID('dbo.LoginActivity', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.LoginActivity;
END;

IF OBJECT_ID('dbo.Purchases', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Purchases;
END;


/*==========================================================
  STEP 2: CREATE PURCHASES TABLE
==========================================================*/

CREATE TABLE dbo.Purchases
(
    PurchaseID     INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID     INT NOT NULL,
    PurchaseDate   DATETIME2(0) NOT NULL,
    PurchaseAmount DECIMAL(10,2) NOT NULL
);


/*==========================================================
  STEP 3: CREATE LOGIN ACTIVITY TABLE
==========================================================*/

CREATE TABLE dbo.LoginActivity
(
    LoginID     INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID  INT NOT NULL,
    LoginDate   DATETIME2(0) NOT NULL
);


/*==========================================================
  STEP 4: INSERT PURCHASE DATA
==========================================================*/

INSERT INTO dbo.Purchases
(
    CustomerID,
    PurchaseDate,
    PurchaseAmount
)
VALUES
-- Customer 101: Login after latest purchase
(101, '2025-10-10 10:00:00', 1500),
(101, '2025-10-20 10:00:00', 2500),

-- Customer 102: Last login before latest purchase
(102, '2025-10-20 10:00:00', 3500),

-- Customer 103: Login after purchase
(103, '2025-10-15 12:00:00', 1800),

-- Customer 104: Never logged in
(104, '2025-10-12 09:00:00', 2200),

-- Customer 105: Multiple purchases, login between purchases
(105, '2025-10-10 09:00:00', 1000),
(105, '2025-10-25 09:00:00', 3000),

-- Customer 106: Login after latest purchase
(106, '2025-10-10 09:00:00', 1200),
(106, '2025-10-25 09:00:00', 3200),

-- Customer 107: Login at exactly the purchase timestamp
(107, '2025-10-15 10:00:00', 2000);


/*==========================================================
  STEP 5: INSERT LOGIN ACTIVITY DATA
==========================================================*/

INSERT INTO dbo.LoginActivity
(
    CustomerID,
    LoginDate
)
VALUES

-- Customer 101: Login after latest purchase
(101, '2025-10-15 10:00:00'),
(101, '2025-10-21 10:00:00'),

-- Customer 102: Login before purchase
(102, '2025-10-18 10:00:00'),

-- Customer 103: Login after purchase
(103, '2025-10-16 10:00:00'),

-- Customer 105: Login after first purchase,
-- but before the latest purchase
(105, '2025-10-20 10:00:00'),

-- Customer 106: Login after latest purchase
(106, '2025-10-26 10:00:00'),

-- Customer 107: Login at exactly the purchase timestamp
(107, '2025-10-15 10:00:00');


/*==========================================================
  STEP 6: VIEW MASTER DATA
==========================================================*/

SELECT *
FROM dbo.Purchases
ORDER BY CustomerID, PurchaseDate;

SELECT *
FROM dbo.LoginActivity
ORDER BY CustomerID, LoginDate;