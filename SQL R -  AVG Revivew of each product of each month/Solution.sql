/* ===========================================================
SHIP OF LEARNING — Amazon SQL Interview Question
Topic : Avg Product Review Rating, Per Product, Per Month
============================================================*/
SELECT * FROM Products
SELECT * FROM ProductReviews

SELECT 
	P.ProductID,MAX(P.ProductName),
	AVG(PR.Rating) AS PR,MONTH(PR.ReviewDate) AS RM,
	YEAR(PR.ReviewDate) AS RM
FROM Products P
JOIN ProductReviews PR
ON P.ProductID = PR.ProductID
WHERE PR.Rating IS NOT NULL
GROUP BY P.ProductID,MONTH(PR.ReviewDate),
YEAR(PR.ReviewDate)