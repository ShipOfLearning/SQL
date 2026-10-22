--============================================================
--Ship of Learning : Amazon
--Topic: Find Users Who Purchased Products but Never Reviewed
--============================================================
SELECT * FROM Users
SELECT * FROM Purchases
SELECT * FROM Reviews

SELECT
	DISTINCT
	U.UserID,U.UserName
FROM Users U
JOIN Purchases P
ON U.USERID = P.UserID
WHERE NOT EXISTS
(
SELECT
	1
FROM Purchases P1
JOIN Reviews R
ON P1.UserID = R.UserID AND
	P1.ProductID = R.ProductID
	WHERE P1.USERID = P.USERID
	)