--============================================================
-- CHANNEL      : SHIP OF LEARNING
-- TOPIC        : Find Drivers with Highest Trip Completion Rate
--============================================================

-- =========================================================
-- SECTION 01: DROP EXISTING DEMO TABLES
-- =========================================================

IF OBJECT_ID('dbo.Trips', 'U') IS NOT NULL
    DROP TABLE dbo.Trips;
GO

IF OBJECT_ID('dbo.Drivers', 'U') IS NOT NULL
    DROP TABLE dbo.Drivers;
GO


-- =========================================================
-- SECTION 02: CREATE MASTER TABLES
-- =========================================================

CREATE TABLE dbo.Drivers
(
    DriverID   INT PRIMARY KEY,
    DriverName VARCHAR(100) NOT NULL,
    City       VARCHAR(50) NOT NULL
);
GO

CREATE TABLE dbo.Trips
(
    TripID     INT PRIMARY KEY,
    DriverID   INT NOT NULL,
    TripDate   DATE NOT NULL,
    TripStatus VARCHAR(20) NOT NULL,

    CONSTRAINT FK_Trips_Drivers
        FOREIGN KEY (DriverID)
        REFERENCES dbo.Drivers(DriverID),

    CONSTRAINT CK_Trips_Status
        CHECK (TripStatus IN
              ('Completed', 'Cancelled', 'Failed'))
);
GO


-- =========================================================
-- SECTION 03: INSERT DRIVER MASTER DATA
-- =========================================================

INSERT INTO dbo.Drivers
    (DriverID, DriverName, City)
VALUES
    (1, 'Rahul', 'Ahmedabad'),
    (2, 'Priya', 'Mumbai'),
    (3, 'Amit',  'Pune'),
    (4, 'Neha',  'Delhi'),
    (5, 'Karan', 'Bengaluru'),
    (6, 'Sneha', 'Ahmedabad');
GO


-- =========================================================
-- SECTION 04: INSERT TRIP TRANSACTION DATA
-- =========================================================

INSERT INTO dbo.Trips
    (TripID, DriverID, TripDate, TripStatus)
VALUES

-- Rahul: 9 completed out of 10 = 90%
(101,1,'2026-10-01','Completed'),
(102,1,'2026-10-01','Completed'),
(103,1,'2026-10-02','Completed'),
(104,1,'2026-10-02','Completed'),
(105,1,'2026-10-03','Completed'),
(106,1,'2026-10-03','Completed'),
(107,1,'2026-10-04','Completed'),
(108,1,'2026-10-04','Completed'),
(109,1,'2026-10-05','Completed'),
(110,1,'2026-10-05','Cancelled'),

-- Priya: 10 completed out of 10 = 100%
(111,2,'2026-10-01','Completed'),
(112,2,'2026-10-01','Completed'),
(113,2,'2026-10-02','Completed'),
(114,2,'2026-10-02','Completed'),
(115,2,'2026-10-03','Completed'),
(116,2,'2026-10-03','Completed'),
(117,2,'2026-10-04','Completed'),
(118,2,'2026-10-04','Completed'),
(119,2,'2026-10-05','Completed'),
(120,2,'2026-10-05','Completed'),

-- Amit: 8 completed out of 10 = 80%
(121,3,'2026-10-01','Completed'),
(122,3,'2026-10-01','Completed'),
(123,3,'2026-10-02','Completed'),
(124,3,'2026-10-02','Completed'),
(125,3,'2026-10-03','Completed'),
(126,3,'2026-10-03','Completed'),
(127,3,'2026-10-04','Completed'),
(128,3,'2026-10-04','Completed'),
(129,3,'2026-10-05','Cancelled'),
(130,3,'2026-10-05','Failed'),

-- Neha: 10 completed out of 10 = 100%
(131,4,'2026-10-01','Completed'),
(132,4,'2026-10-01','Completed'),
(133,4,'2026-10-02','Completed'),
(134,4,'2026-10-02','Completed'),
(135,4,'2026-10-03','Completed'),
(136,4,'2026-10-03','Completed'),
(137,4,'2026-10-04','Completed'),
(138,4,'2026-10-04','Completed'),
(139,4,'2026-10-05','Completed'),
(140,4,'2026-10-05','Completed'),

-- Karan: 7 completed out of 10 = 70%
(141,5,'2026-10-01','Completed'),
(142,5,'2026-10-01','Completed'),
(143,5,'2026-10-02','Completed'),
(144,5,'2026-10-02','Completed'),
(145,5,'2026-10-03','Completed'),
(146,5,'2026-10-03','Completed'),
(147,5,'2026-10-04','Completed'),
(148,5,'2026-10-04','Cancelled'),
(149,5,'2026-10-05','Cancelled'),
(150,5,'2026-10-05','Failed');

-- Sneha has zero assigned trips.
GO


-- =========================================================
-- SECTION 05: VERIFY MASTER DATA
-- =========================================================

SELECT *
FROM dbo.Drivers
ORDER BY DriverID;

SELECT *
FROM dbo.Trips
ORDER BY TripID;
