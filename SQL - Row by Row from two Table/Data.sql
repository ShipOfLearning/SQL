-- Create Products table
CREATE TABLE Products (
    ProductName VARCHAR(50)
);

-- Insert sample data
INSERT INTO Products (ProductName)
VALUES ('Soap'), ('Laptop'), ('Pen'), ('Mobile');

-- Create Prices table
CREATE TABLE Prices (
    Price INT
);

-- Insert sample data
INSERT INTO Prices (Price)
VALUES (20), (50000), (10), (15000);