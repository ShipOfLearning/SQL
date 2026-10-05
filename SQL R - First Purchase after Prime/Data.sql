/*====================================================================
  SHIP OF LEARNING
  ================================================================
  TOPIC:
  Find the First Purchase of a Customer After Becoming a Prime Member

  INTERVIEW CONTEXT:
  Amazon-Style SQL Interview Problem

  BUSINESS QUESTION:
  For every customer who became a Prime member, find their first
  purchase made AFTER the Prime membership start date.
====================================================================*/


/*--------------------------------------------------------------------
  STEP 1: DROP TABLES IF THEY ALREADY EXIST
--------------------------------------------------------------------*/

IF OBJECT_ID('dbo.CustomerPurchases', 'U') IS NOT NULL
    DROP TABLE dbo.CustomerPurchases;

IF OBJECT_ID('dbo.CustomerPrimeMembership', 'U') IS NOT NULL
    DROP TABLE dbo.CustomerPrimeMembership;


/*--------------------------------------------------------------------
  STEP 2: CREATE PRIME MEMBERSHIP MASTER TABLE
--------------------------------------------------------------------*/

CREATE TABLE dbo.CustomerPrimeMembership
(
    customer_id       INT           NOT NULL PRIMARY KEY,
    customer_name     VARCHAR(100)  NOT NULL,
    prime_start_date  DATETIME2(0)  NOT NULL
);


/*--------------------------------------------------------------------
  STEP 3: INSERT PRIME MEMBERSHIP DATA
--------------------------------------------------------------------*/

INSERT INTO dbo.CustomerPrimeMembership
(
    customer_id,
    customer_name,
    prime_start_date
)
VALUES
(101, 'Amit',   '2026-01-10 10:00:00'),
(102, 'Priya',  '2026-01-15 09:30:00'),
(103, 'Rahul',  '2026-02-01 12:00:00'),
(104, 'Neha',   '2026-02-05 15:00:00'),
(105, 'Vikas',  '2026-02-10 11:00:00'),
(106, 'Sneha',  '2026-02-15 10:30:00');


/*--------------------------------------------------------------------
  STEP 4: CREATE PURCHASE MASTER TABLE
--------------------------------------------------------------------*/

CREATE TABLE dbo.CustomerPurchases
(
    purchase_id    INT            NOT NULL PRIMARY KEY,
    customer_id    INT            NOT NULL,
    purchase_date  DATETIME2(0)   NOT NULL,
    product_name   VARCHAR(100)   NOT NULL,
    amount         DECIMAL(10,2)  NOT NULL
);


/*--------------------------------------------------------------------
  STEP 5: INSERT PURCHASE DATA
--------------------------------------------------------------------*/

INSERT INTO dbo.CustomerPurchases
(
    purchase_id,
    customer_id,
    purchase_date,
    product_name,
    amount
)
VALUES

/* Customer 101
   Prime: 10-Jan 10:00
*/
(1001, 101, '2026-01-05 12:00:00', 'Keyboard',       1500.00),
(1002, 101, '2026-01-10 10:00:00', 'Mouse',           800.00),
(1003, 101, '2026-01-12 09:15:00', 'Monitor',        12000.00),
(1004, 101, '2026-01-15 18:30:00', 'USB Hub',         900.00),

/* Customer 102
   Prime: 15-Jan 09:30
*/
(1005, 102, '2026-01-01 10:00:00', 'Book',             500.00),
(1006, 102, '2026-01-16 11:00:00', 'Headphones',      2500.00),
(1007, 102, '2026-01-20 15:00:00', 'Webcam',          3500.00),

/* Customer 103
   Prime: 01-Feb 12:00
*/
(1008, 103, '2026-01-20 14:00:00', 'Shoes',           3000.00),
(1009, 103, '2026-02-01 12:30:00', 'Watch',           5000.00),
(1010, 103, '2026-02-03 09:00:00', 'Bag',             2200.00),

/* Customer 104
   Prime: 05-Feb 15:00
   Two purchases at exactly the same timestamp
*/
(1011, 104, '2026-02-05 15:00:00', 'Mobile Case',      700.00),
(1012, 104, '2026-02-05 15:30:00', 'Charger',          1200.00),
(1013, 104, '2026-02-05 15:30:00', 'Cable',             500.00),
(1014, 104, '2026-02-07 12:00:00', 'Power Bank',       1800.00),

/* Customer 105
   Prime: 10-Feb 11:00
   No purchase after Prime
*/
(1015, 105, '2026-02-01 10:00:00', 'Laptop Bag',       1800.00),
(1016, 105, '2026-02-10 10:30:00', 'Notebook',          400.00),

/* Customer 106
   Prime: 15-Feb 10:30
*/
(1017, 106, '2026-02-15 11:00:00', 'Tablet',           18000.00),
(1018, 106, '2026-02-16 09:00:00', 'Cover',             900.00);


/*--------------------------------------------------------------------
  STEP 6: VERIFY MASTER DATA
--------------------------------------------------------------------*/

SELECT *
FROM dbo.CustomerPrimeMembership
ORDER BY customer_id;

SELECT *
FROM dbo.CustomerPurchases
ORDER BY customer_id, purchase_date, purchase_id;
