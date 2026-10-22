/*==============================================================================
    SHIP OF LEARNING : META
    TOPIC   : Find users who bought Product X but not Product Y
==============================================================================*/

/*==============================================================================
    STEP 1: DROP TABLES IF THEY ALREADY EXIST
==============================================================================*/

IF OBJECT_ID('dbo.Purchases', 'U') IS NOT NULL
    DROP TABLE dbo.Purchases;

IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
    DROP TABLE dbo.Users;


/*==============================================================================
    STEP 2: CREATE MASTER TABLE - USERS
==============================================================================*/

CREATE TABLE dbo.Users
(
    UserID      INT            NOT NULL PRIMARY KEY,
    UserName    VARCHAR(100)   NOT NULL
);


/*==============================================================================
    STEP 3: CREATE TRANSACTION TABLE - PURCHASES
==============================================================================*/

CREATE TABLE dbo.Purchases
(
    PurchaseID      INT            NOT NULL PRIMARY KEY,
    UserID          INT            NOT NULL,
    ProductName     VARCHAR(100)   NOT NULL,
    PurchaseDate    DATE           NOT NULL,

    CONSTRAINT FK_Purchases_Users
        FOREIGN KEY (UserID)
        REFERENCES dbo.Users(UserID)
);


/*==============================================================================
    STEP 4: INSERT USERS
==============================================================================*/

INSERT INTO dbo.Users
(
    UserID,
    UserName
)
VALUES
    (1, 'Rahul'),
    (2, 'Priya'),
    (3, 'Amit'),
    (4, 'Neha'),
    (5, 'Karan'),
    (6, 'Sneha'),
    (7, 'Arjun');


/*==============================================================================
    STEP 5: INSERT PURCHASE DATA
==============================================================================*/

INSERT INTO dbo.Purchases
(
    PurchaseID,
    UserID,
    ProductName,
    PurchaseDate
)
VALUES
    (101, 1, 'Product X', '2026-01-05'),
    (102, 1, 'Product Y', '2026-01-10'),

    (103, 2, 'Product X', '2026-01-08'),

    (104, 3, 'Product X', '2026-01-12'),
    (105, 3, 'Product Z', '2026-01-15'),

    (106, 4, 'Product Y', '2026-01-18'),

    (107, 5, 'Product X', '2026-01-20'),
    (108, 5, 'Product X', '2026-02-05'),

    (109, 6, 'Product Z', '2026-02-08'),

    (110, 7, 'Product X', '2026-02-10'),
    (111, 7, 'Product Y', '2026-02-12'),
    (112, 7, 'Product Z', '2026-02-15');


/*==============================================================================
    VIEW MASTER DATA
==============================================================================*/

SELECT *
FROM dbo.Users
ORDER BY UserID;

SELECT *
FROM dbo.Purchases
ORDER BY UserID, PurchaseDate;
