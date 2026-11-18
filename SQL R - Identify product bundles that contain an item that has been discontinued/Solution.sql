/*============================================================
CHANNEL : SHIP OF LEARNING
TOPIC   : IDENTIFY PRODUCT BUNDLES THAT CONTAIN
          AN ITEM THAT HAS BEEN DISCONTINUED
============================================================*/
SELECT * FROM Products
SELECT * FROM BundleItems

SELECT
    *
FROM Products   P1
WHERE EXISTS 
(
SELECT
    1
FROM Products P
JOIN BundleItems BI
ON P.ProductID = BI.ProductID
WHERE
    P.ProductType = 'ITEM'
    AND P.IsDiscontinued = 1
    AND BI.BundleID = P1.ProductID
    )