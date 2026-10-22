/*==============================================================================
    CHANNEL       : Ship of Learning :Amazon
    TOPIC         : Generate Every Possible Combination of Sizes and Colors
==============================================================================*/


/*==============================================================================
    STEP 1: DROP EXISTING TABLES
==============================================================================*/

IF OBJECT_ID('dbo.Sizes', 'U') IS NOT NULL
    DROP TABLE dbo.Sizes;
GO

IF OBJECT_ID('dbo.Colors', 'U') IS NOT NULL
    DROP TABLE dbo.Colors;
GO


/*==============================================================================
    STEP 2: CREATE SIZES TABLE
==============================================================================*/

CREATE TABLE dbo.Sizes
(
    SizeID      INT         NOT NULL PRIMARY KEY,
    SizeName    VARCHAR(10) NOT NULL
);
GO


/*==============================================================================
    STEP 3: CREATE COLORS TABLE
==============================================================================*/

CREATE TABLE dbo.Colors
(
    ColorID     INT         NOT NULL PRIMARY KEY,
    ColorName   VARCHAR(20) NOT NULL
);
GO


/*==============================================================================
    STEP 4: INSERT MASTER DATA INTO SIZES
==============================================================================*/

INSERT INTO dbo.Sizes
(
    SizeID,
    SizeName
)
VALUES
    (1, 'S'),
    (2, 'M'),
    (3, 'L'),
    (4, 'XL');
GO


/*==============================================================================
    STEP 5: INSERT MASTER DATA INTO COLORS
==============================================================================*/

INSERT INTO dbo.Colors
(
    ColorID,
    ColorName
)
VALUES
    (1, 'Red'),
    (2, 'Blue'),
    (3, 'Black');
GO


/*==============================================================================
    STEP 6: VERIFY MASTER DATA
==============================================================================*/

SELECT *
FROM dbo.Sizes;

SELECT *
FROM dbo.Colors;
GO
