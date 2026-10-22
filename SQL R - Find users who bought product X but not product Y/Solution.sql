/*==============================================================================
    SHIP OF LEARNING : META
    TOPIC   : Find users who bought Product X but not Product Y
==============================================================================*/
SELECT * FROM dbo.Users;
SELECT * FROM dbo.Purchases;

SELECT
    DISTINCT
    U.UserID, U.UserName
FROM Users U
JOIN Purchases P
ON U.UserID = P.UserID
WHERE P.ProductName = 'Product X'
AND NOT EXISTS  
    (
        SELECT 1
        FROM Purchases Y
        WHERE Y.UserID = P.UserID
        AND ProductName = 'Product Y'
    )
