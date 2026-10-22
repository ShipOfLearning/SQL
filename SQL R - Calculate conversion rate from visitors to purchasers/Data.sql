--============================================================
--  CHANNEL  : Ship of Learning
--  TOPIC    : Calculate Conversion Rate in MS SQL Server
--  Conversion Rate (%) =
--  Unique Converted Visitors / Total Unique Visitors * 100
--============================================================
/*============================================================
  STEP 1: DROP EXISTING TABLES IF THEY EXIST
============================================================*/

IF OBJECT_ID('dbo.Purchases', 'U') IS NOT NULL
    DROP TABLE dbo.Purchases;

IF OBJECT_ID('dbo.Visitors', 'U') IS NOT NULL
    DROP TABLE dbo.Visitors;


/*============================================================
  STEP 2: CREATE VISIT EVENTS TABLE
  One visitor can have multiple visit events.
============================================================*/

CREATE TABLE dbo.Visitors
(
    VisitEventID INT IDENTITY(1,1) PRIMARY KEY,
    VisitorID    INT NOT NULL,
    VisitDate    DATE NOT NULL
);


/*============================================================
  STEP 3: CREATE PURCHASES TABLE
  One visitor can have multiple purchase records.
============================================================*/

CREATE TABLE dbo.Purchases
(
    PurchaseID   INT IDENTITY(1,1) PRIMARY KEY,
    VisitorID    INT NOT NULL,
    PurchaseDate DATE NOT NULL,
    Status       VARCHAR(20) NOT NULL
);


/*============================================================
  STEP 4: INSERT MASTER DATA - VISIT EVENTS
  There are 10 unique visitors, with repeat visits included.
============================================================*/

INSERT INTO dbo.Visitors (VisitorID, VisitDate)
VALUES
(1,  '2026-10-01'),
(2,  '2026-10-01'),
(3,  '2026-10-01'),
(4,  '2026-10-01'),
(5,  '2026-10-01'),
(6,  '2026-10-01'),
(7,  '2026-10-01'),
(8,  '2026-10-01'),
(9,  '2026-10-01'),
(10, '2026-10-01'),
(2,  '2026-10-02'),
(4,  '2026-10-02'),
(4,  '2026-10-03'),
(9,  '2026-10-02');


/*============================================================
  STEP 5: INSERT MASTER DATA - PURCHASES

  Visitor 2: Two completed purchases.
  Visitor 4: One completed purchase.
  Visitor 7: One completed purchase.
  Visitor 8: One failed purchase.
  Visitor 9: One completed purchase.

  Unique successful purchasers = 4
  Total unique visitors         = 10
  Expected conversion rate      = 40.00%
============================================================*/

INSERT INTO dbo.Purchases (VisitorID, PurchaseDate, Status)
VALUES
(2, '2026-10-01', 'Completed'),
(2, '2026-10-02', 'Completed'),
(4, '2026-10-02', 'Completed'),
(7, '2026-10-02', 'Completed'),
(8, '2026-10-02', 'Failed'),
(9, '2026-10-02', 'Completed');


/*============================================================
  STEP 6: VIEW THE MASTER DATA
============================================================*/

SELECT *
FROM dbo.Visitors
ORDER BY VisitorID, VisitDate;

SELECT *
FROM dbo.Purchases
ORDER BY VisitorID, PurchaseDate;

