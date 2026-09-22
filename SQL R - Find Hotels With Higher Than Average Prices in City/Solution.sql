--========================================================
--Ship of Learning | Airbnb
--Topic: Find Hotels With Higher Than Average Prices 
--			Compared to Their City 
--========================================================
SELECT * FROM Hotels

SELECT
	HotelName,City,Price,AVG_CITY
FROM 
(
	SELECT
		HotelName,City,Price,
		AVG(Price) OVER
		(
			PARTITION BY CITY
		) AVG_CITY
	FROM Hotels
) AS K
WHERE Price > AVG_CITY