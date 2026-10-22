
--=============================================================
-- SHIP OF LEARNING
-- TOPIC : Game Play Analysis
--          Find the fraction of players who return to a gaming 
--          platform exactly one day after their first login.
--=============================================================

SET NOCOUNT ON;

-- ==========================================================
-- SECTION 01: DROP TABLE IF IT EXISTS
-- ==========================================================

IF OBJECT_ID('dbo.Activity', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Activity;
END;
GO

-- ==========================================================
-- SECTION 02: CREATE ORIGINAL ACTIVITY TABLE
-- ==========================================================

CREATE TABLE dbo.Activity
(
    player_id    INT  NOT NULL,
    device_id    INT  NOT NULL,
    event_date   DATE NOT NULL,
    games_played INT  NOT NULL,

    CONSTRAINT PK_Activity
        PRIMARY KEY (player_id, event_date),

    CONSTRAINT CK_Activity_GamesPlayed
        CHECK (games_played >= 0)
);
GO

-- ==========================================================
-- SECTION 03: INSERT ORIGINAL LEETCODE SAMPLE DATA
-- ==========================================================

INSERT INTO dbo.Activity
(
    player_id,
    device_id,
    event_date,
    games_played
)
VALUES
(1, 2, '20160301', 5),
(1, 2, '20160302', 6),
(2, 3, '20170625', 1),
(3, 1, '20160302', 0),
(3, 4, '20180703', 5);

-- ==========================================================
-- SECTION 04: VIEW INPUT DATA
-- ==========================================================

SELECT
    player_id,
    device_id,
    event_date,
    games_played
FROM dbo.Activity
ORDER BY player_id, event_date;
