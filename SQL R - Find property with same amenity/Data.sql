-- ===============================================
-- Ship of Learning | Master Dataset
-- Topic: Find Properties With the Same Amenities
-- Asked in: Airbnb SQL Interview
-- ================================================
-- Drop tables if they already exist
DROP TABLE IF EXISTS PropertyAmenity;
DROP TABLE IF EXISTS Property;

-- Create tables
CREATE TABLE Property (
    property_id   INT PRIMARY KEY,
    property_name VARCHAR(100),
    city          VARCHAR(50)
);

CREATE TABLE PropertyAmenity (
    property_id INT,
    amenity     VARCHAR(50)
);

-- Insert sample data
INSERT INTO Property (property_id, property_name, city) VALUES
(1, 'Sunset Villa',      'Goa'),
(2, 'Ocean Breeze',      'Goa'),
(3, 'Palm Retreat',      'Goa'),
(4, 'City Loft',         'Mumbai'),
(5, 'Skyline Apartment', 'Mumbai'),
(6, 'Garden Cottage',    'Pune');

INSERT INTO PropertyAmenity (property_id, amenity) VALUES
(1, 'WiFi'), (1, 'Pool'), (1, 'Parking'),
(2, 'WiFi'), (2, 'Parking'),
(3, 'Parking'), (3, 'Pool'), (3, 'WiFi'),
(4, 'WiFi'), (4, 'AC'),
(5, 'AC'),   (5, 'WiFi'),
(6, 'Pool');