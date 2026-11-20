/* ===============================================================
CHANNEL       : SHIP OF LEARNING
TOPIC         : FIND SUBSCRIPTIONS EXPIRING WITHIN NEXT 15 DAYS
===============================================================
SECTION 1: DROP EXISTING TABLE IF IT EXISTS
===============================================================*/

IF OBJECT_ID('dbo.Subscriptions', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Subscriptions;
END;
GO

/*===============================================================
SECTION 2: CREATE SUBSCRIPTIONS TABLE
===============================================================*/

CREATE TABLE dbo.Subscriptions
(
    SubscriptionID INT IDENTITY(101,1) PRIMARY KEY,
    CustomerName   VARCHAR(100) NOT NULL,
    PlanName       VARCHAR(50) NOT NULL,
    StartDate      DATE NOT NULL,
    ExpiryDate     DATETIME2(0) NOT NULL,
    IsAutoRenew    BIT NOT NULL DEFAULT 0
);
GO

/*===============================================================
SECTION 3: GENERATE DYNAMIC SAMPLE DATA
===============================================================*/

DECLARE @Today DATE = CAST(GETDATE() AS DATE);

INSERT INTO dbo.Subscriptions
(
    CustomerName,
    PlanName,
    StartDate,
    ExpiryDate,
    IsAutoRenew
)
VALUES

-- Already expired: Must be excluded
('Karan', 'Basic',
 DATEADD(DAY, -365, @Today),
 DATEADD(DAY, -5, CAST(@Today AS DATETIME2)),
 0),

-- Expires today: Must be included
('Priya', 'Premium',
 DATEADD(DAY, -180, @Today),
 CAST(@Today AS DATETIME2),
 0),

-- Expires tomorrow: Must be included
('Amit', 'Basic',
 DATEADD(DAY, -90, @Today),
 DATEADD(DAY, 1, CAST(@Today AS DATETIME2)),
 1),

-- Expires in 3 days: Must be included
('Neha', 'Pro',
 DATEADD(DAY, -120, @Today),
 DATEADD(HOUR, 10,
     CAST(DATEADD(DAY, 3, @Today) AS DATETIME2)),
 0),

-- Expires in 10 days: Must be included
('Rahul', 'Premium',
 DATEADD(DAY, -300, @Today),
 DATEADD(DAY, 10, CAST(@Today AS DATETIME2)),
 1),

-- Expires exactly on Day 15 at midnight: Included
('Sneha', 'Basic',
 DATEADD(DAY, -60, @Today),
 DATEADD(DAY, 15, CAST(@Today AS DATETIME2)),
 0),

-- Expires on Day 15 at 11:59 PM: Included
('Vikram', 'Pro',
 DATEADD(DAY, -200, @Today),
 DATEADD(SECOND, -1,
     CAST(DATEADD(DAY, 16, @Today) AS DATETIME2)),
 1),

-- Expires on Day 16: Must be excluded
('Anjali', 'Premium',
 DATEADD(DAY, -150, @Today),
 DATEADD(DAY, 16, CAST(@Today AS DATETIME2)),
 0),

-- Expires in 30 days: Must be excluded
('Rohit', 'Basic',
 DATEADD(DAY, -100, @Today),
 DATEADD(DAY, 30, CAST(@Today AS DATETIME2)),
 1);
GO

/*===============================================================
SECTION 4: CREATE INDEX
===============================================================*/

CREATE NONCLUSTERED INDEX IX_Subscriptions_ExpiryDate
ON dbo.Subscriptions (ExpiryDate);
GO

/*===============================================================
SECTION 5: VERIFY MASTER DATA
===============================================================*/

SELECT
    SubscriptionID,
    CustomerName,
    PlanName,
    StartDate,
    ExpiryDate,
    IsAutoRenew
FROM dbo.Subscriptions
ORDER BY ExpiryDate;
GO
