-- =========================================
-- SHIP OF LEARNING | Team Matches & Win % 
-- =========================================

-- STEP 1: Create Table
CREATE TABLE Matches (
    MatchID     INT PRIMARY KEY,
    Team1       VARCHAR(50),
    Team2       VARCHAR(50),
    Winner      VARCHAR(50),   -- NULL or 'Tie' if no result
    MatchDate   DATE,
    Venue       VARCHAR(100)
);
GO

-- STEP 2: Insert Sample Data
INSERT INTO Matches (MatchID, Team1, Team2, Winner, MatchDate, Venue) VALUES
(1, 'India', 'Australia', 'India', '2024-01-05', 'Mumbai'),
(2, 'Australia', 'England', 'England', '2024-01-08', 'Sydney'),
(3, 'India', 'England', 'India', '2024-01-12', 'Delhi'),
(4, 'Pakistan', 'India', 'Pakistan', '2024-01-15', 'Lahore'),
(5, 'England', 'Pakistan', NULL, '2024-01-18', 'London'),      -- Rain, No Result
(6, 'Australia', 'India', 'Australia', '2024-01-20', 'Perth'),
(7, 'Pakistan', 'Australia', 'Pakistan', '2024-01-22', 'Karachi'),
(8, 'England', 'India', 'Tie', '2024-01-25', 'Leeds'),         -- Tied match
(9, 'India', 'Pakistan', 'India', '2024-01-28', 'Chennai'),
(10, 'Australia', 'Pakistan', 'Australia', '2024-01-30', 'Adelaide');
GO
