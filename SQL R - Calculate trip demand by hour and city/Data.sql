/*==============================================================================
    SHIP OF LEARNING
    Company Context : Uber-Style Interview Problem
    Topic           : Calculate Trip Demand by Hour and City
==============================================================================*/


/*==============================================================================
    1. DROP EXISTING TABLE
==============================================================================*/

DROP TABLE IF EXISTS dbo.Trips;
GO


/*==============================================================================
    2. CREATE MASTER TABLE
==============================================================================*/

CREATE TABLE dbo.Trips
(
    TripID          BIGINT          NOT NULL,
    RiderID         BIGINT          NOT NULL,
    DriverID        BIGINT          NULL,
    City            VARCHAR(50)     NOT NULL,
    RequestTime     DATETIME2(0)    NOT NULL,
    AcceptedTime    DATETIME2(0)    NULL,
    CompletedTime   DATETIME2(0)    NULL,
    TripStatus      VARCHAR(20)     NOT NULL,
    FareAmount      DECIMAL(10,2)   NULL,

    CONSTRAINT PK_Trips
        PRIMARY KEY (TripID),

    CONSTRAINT CK_Trips_TripStatus
        CHECK (TripStatus IN
        (
            'Requested',
            'Accepted',
            'Completed',
            'Cancelled'
        ))
);
GO


/*==============================================================================
    3. INSERT SAMPLE DATA
==============================================================================*/

INSERT INTO dbo.Trips
(
    TripID,
    RiderID,
    DriverID,
    City,
    RequestTime,
    AcceptedTime,
    CompletedTime,
    TripStatus,
    FareAmount
)
VALUES
-- Delhi: 01-Oct, 09:00 hour
(1001, 501, 201, 'Delhi', '2026-10-01T09:05:00',
 '2026-10-01T09:07:00', '2026-10-01T09:35:00', 'Completed', 320.00),

(1002, 502, 202, 'Delhi', '2026-10-01T09:18:00',
 '2026-10-01T09:20:00', '2026-10-01T09:48:00', 'Completed', 280.00),

(1003, 503, NULL, 'Delhi', '2026-10-01T09:42:00',
 NULL, NULL, 'Cancelled', NULL),

-- Delhi: 01-Oct, 10:00 hour
(1004, 504, 203, 'Delhi', '2026-10-01T10:03:00',
 '2026-10-01T10:05:00', '2026-10-01T10:30:00', 'Completed', 410.00),

(1005, 505, 204, 'Delhi', '2026-10-01T10:27:00',
 '2026-10-01T10:30:00', NULL, 'Accepted', NULL),

-- Mumbai: 01-Oct, 09:00 hour
(1006, 506, 205, 'Mumbai', '2026-10-01T09:10:00',
 '2026-10-01T09:12:00', '2026-10-01T09:40:00', 'Completed', 350.00),

(1007, 507, 206, 'Mumbai', '2026-10-01T09:25:00',
 '2026-10-01T09:27:00', '2026-10-01T09:55:00', 'Completed', 390.00),

(1008, 508, NULL, 'Mumbai', '2026-10-01T09:50:00',
 NULL, NULL, 'Cancelled', NULL),

-- Mumbai: 01-Oct, 10:00 hour
(1009, 509, 207, 'Mumbai', '2026-10-01T10:08:00',
 '2026-10-01T10:10:00', '2026-10-01T10:42:00', 'Completed', 450.00),

-- Bengaluru: 01-Oct
(1010, 510, 208, 'Bengaluru', '2026-10-01T09:12:00',
 '2026-10-01T09:14:00', '2026-10-01T09:44:00', 'Completed', 300.00),

(1011, 511, 209, 'Bengaluru', '2026-10-01T10:15:00',
 '2026-10-01T10:17:00', '2026-10-01T10:51:00', 'Completed', 375.00),

(1012, 512, 210, 'Bengaluru', '2026-10-01T10:38:00',
 '2026-10-01T10:40:00', '2026-10-01T11:05:00', 'Completed', 290.00),

-- IMPORTANT: Same hour, different date
-- These rows demonstrate why grouping only by DATEPART(HOUR) can be wrong.

(1013, 513, 211, 'Delhi', '2026-10-02T09:11:00',
 '2026-10-02T09:13:00', '2026-10-02T09:40:00', 'Completed', 330.00),

(1014, 514, NULL, 'Delhi', '2026-10-02T09:36:00',
 NULL, NULL, 'Cancelled', NULL),

(1015, 515, 212, 'Mumbai', '2026-10-02T09:21:00',
 '2026-10-02T09:24:00', '2026-10-02T09:58:00', 'Completed', 420.00),

(1016, 516, 213, 'Mumbai', '2026-10-02T11:04:00',
 '2026-10-02T11:06:00', '2026-10-02T11:39:00', 'Completed', 510.00),

(1017, 517, 214, 'Bengaluru', '2026-10-02T09:08:00',
 '2026-10-02T09:10:00', '2026-10-02T09:36:00', 'Completed', 260.00),

(1018, 518, 215, 'Bengaluru', '2026-10-02T09:47:00',
 '2026-10-02T09:49:00', '2026-10-02T10:20:00', 'Completed', 340.00);
GO


/*==============================================================================
    4. VERIFY MASTER DATA
==============================================================================*/

SELECT *
FROM dbo.Trips
ORDER BY RequestTime, City;
GO

