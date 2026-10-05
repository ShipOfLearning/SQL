/* ================================================================
   SHIP OF LEARNING : Zomato
   TOPIC: Find Top 2 Riders Who Have Traveled the Greatest
            Total Distance to Deliver Orders
   ==============================================================*/
SELECT * FROM Riders
SELECT * FROM Deliveries

SELECT
    TOP 2
    R.rider_id,R.rider_name,
    SUM(D.distance_km) TOT_DIS
FROM Riders R
JOIN Deliveries D
ON R.rider_id = D.rider_id
GROUP BY 
    R.rider_id,R.rider_name
ORDER BY 
    SUM(D.distance_km)  DESC

