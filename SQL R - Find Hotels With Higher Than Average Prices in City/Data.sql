--========================================================
--Ship of Learning | Airbnb
--Topic: Find Hotels With Higher Than Average Prices 
--			Compared to Their City 
--========================================================

--Step 1. Drop Existing Table
DROP TABLE IF EXISTS Hotels;

--Step 2️/. Create Table
CREATE TABLE Hotels
(
    HotelID INT PRIMARY KEY,
    HotelName VARCHAR(100),
    City VARCHAR(50),
    Price DECIMAL(10,2)
);

--Step 3️. Insert Master Data
INSERT INTO Hotels
(
    HotelID,
    HotelName,
    City,
    Price
)
VALUES
(1,  'Taj Palace',          'Mumbai',    5000),
(2,  'Hotel Marine',        'Mumbai',    3000),
(3,  'City Inn Mumbai',    'Mumbai',    2000),
(4,  'Oberoi Grand',        'Delhi',     7000),
(5,  'Delhi Comfort',       'Delhi',     4000),
(6,  'Capital Stay',        'Delhi',     3000),
(7,  'Royal Bangalore',     'Bangalore', 6000),
(8,  'Tech Park Hotel',     'Bangalore', 5000),
(9,  'Budget Bangalore',    'Bangalore', 3000),
(10, 'Ahmedabad Palace',    'Ahmedabad', 3500),
(11, 'River View Hotel',    'Ahmedabad', 2500),
(12, 'City Stay',           'Ahmedabad', 2000);