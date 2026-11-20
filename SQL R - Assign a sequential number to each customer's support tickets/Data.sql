/*============================================================
CHANNEL : SHIP OF LEARNING - AMAZON
TOPIC   : CUSTOMER-WISE SEQUENTIAL TICKET NUMBERING
============================================================
STEP 1: DROP EXISTING TABLE IF IT EXISTS
============================================================*/

IF OBJECT_ID('dbo.SupportTickets', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.SupportTickets;
END;
GO

/*============================================================
STEP 2: CREATE SUPPORT TICKETS TABLE
============================================================*/

CREATE TABLE dbo.SupportTickets
(
    TicketID INT NOT NULL PRIMARY KEY,
    CustomerID INT NOT NULL,
    CreatedAt DATETIME2(0) NOT NULL,
    Subject VARCHAR(200) NOT NULL
);
GO

/*============================================================
STEP 3: INSERT MASTER DATA
============================================================*/

INSERT INTO dbo.SupportTickets
(
    TicketID,
    CustomerID,
    CreatedAt,
    Subject
)
VALUES
(1001, 101, '2026-11-01 09:00:00', 'Login Issue'),
(1002, 101, '2026-11-01 10:00:00', 'Payment Failure'),
(1003, 101, '2026-11-01 10:00:00', 'Password Reset'),
(1004, 101, '2026-11-02 11:00:00', 'Account Locked'),

(1005, 102, '2026-11-01 08:30:00', 'Unable To Register'),
(1006, 102, '2026-11-02 09:30:00', 'Profile Update'),
(1007, 102, '2026-11-03 12:00:00', 'Subscription Issue'),

(1008, 103, '2026-11-01 07:00:00', 'App Not Working'),
(1009, 103, '2026-11-01 07:00:00', 'Notification Issue'),

(1010, 104, '2026-11-04 15:00:00', 'Refund Request');
GO

/*============================================================
STEP 4: VIEW MASTER DATA
============================================================*/

SELECT *
FROM dbo.SupportTickets
ORDER BY CustomerID, CreatedAt, TicketID;
GO
