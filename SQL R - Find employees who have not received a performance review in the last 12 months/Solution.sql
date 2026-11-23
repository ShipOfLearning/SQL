/*============================================================
CHANNEL  : SHIP OF LEARNING
TOPIC    : FIND EMPLOYEES WITHOUT A PERFORMANCE REVIEW
           IN THE LAST 12 MONTHS
============================================================*/
SELECT * FROM Employees
SELECT * FROM PerformanceReviews

SELECT
    E.EmployeeID,E.EmployeeName,
    (
        SELECT 
            MAX(ReviewDate)
        FROM PerformanceReviews PR
        WHERE PR.EmployeeID = E.EmployeeID
    ) LPRD
FROM Employees E
WHERE NOT EXISTS
(
SELECT
    1
FROM PerformanceReviews PR
WHERE
    PR.EmployeeID = E.EmployeeID AND
    ReviewDate < GETDATE() AND
    ReviewDate > DATEADD(DAY,-365,GETDATE())
    )