--============================================================
--Ship of Learning : Amazon
--Topic: Find Users Who Purchased Products but Never Reviewed
--============================================================

SET NOCOUNT ON;

-- 1. DROP TABLES SAFELY (CHILD TABLES FIRST)
IF OBJECT_ID(N'dbo.Reviews', N'U') IS NOT NULL
    DROP TABLE dbo.Reviews;

IF OBJECT_ID(N'dbo.Purchases', N'U') IS NOT NULL
    DROP TABLE dbo.Purchases;

IF OBJECT_ID(N'dbo.Users', N'U') IS NOT NULL
    DROP TABLE dbo.Users;

-- 2. CREATE MASTER TABLE
CREATE TABLE dbo.Users
(
    UserID   INT          NOT NULL PRIMARY KEY,
    UserName VARCHAR(50)  NOT NULL
);

-- 3. CREATE PURCHASES TABLE
CREATE TABLE dbo.Purchases
(
    PurchaseID INT NOT NULL PRIMARY KEY,
    UserID     INT NOT NULL,
    ProductID  INT NOT NULL,
    PurchaseDate DATE NOT NULL,
    CONSTRAINT FK_Purchases_Users
        FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID)
);

-- 4. CREATE REVIEWS TABLE
CREATE TABLE dbo.Reviews
(
    ReviewID   INT NOT NULL PRIMARY KEY,
    UserID     INT NOT NULL,
    ProductID  INT NOT NULL,
    ReviewDate DATE NOT NULL,
    CONSTRAINT FK_Reviews_Users
        FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID)
);

-- 5. INSERT MASTER DATA
INSERT INTO dbo.Users (UserID, UserName)
VALUES
(1, 'Aarav'),
(2, 'Diya'),
(3, 'Kabir'),
(4, 'Meera'),
(5, 'Rohan'),
(6, 'Anaya');

INSERT INTO dbo.Purchases
    (PurchaseID, UserID, ProductID, PurchaseDate)
VALUES
(1001, 1, 101, '2026-01-01'),
(1002, 1, 102, '2026-01-05'),
(1003, 2, 103, '2026-01-02'),
(1004, 3, 104, '2026-01-03'),
(1005, 4, 105, '2026-01-04'),
(1006, 4, 106, '2026-01-06'),
(1007, 5, 107, '2026-01-07');

INSERT INTO dbo.Reviews
    (ReviewID, UserID, ProductID, ReviewDate)
VALUES
(5001, 1, 101, '2026-01-08'),
(5002, 3, 104, '2026-01-09'),
(5003, 5, 107, '2026-01-10');
