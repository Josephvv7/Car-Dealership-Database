-- Car Dealership Database with Legend of Zelda Theme
DROP DATABASE IF EXISTS CarDealership;
CREATE DATABASE CarDealership;
USE CarDealership;

DROP TABLE IF EXISTS dealerships;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS sales_contract;
DROP TABLE IF EXISTS lease_contracts;


-- Create dealerships table
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NOT NULL
);

-- Create vehicles table
CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    SOLD BOOLEAN DEFAULT FALSE,
    color VARCHAR(50) NOT NULL,
    vehicletype VARCHAR(50) NOT NULL,
    odometer INT NOT NULL,
    price DOUBLE NOT NULL
);

-- Create inventory table
CREATE TABLE inventory (
    dealership_id INT NOT NULL,
    VIN VARCHAR(17) NOT NULL,
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Create sales_contracts table
CREATE TABLE sales_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    sale_date DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Create lease_contracts table
CREATE TABLE lease_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    lease_start DATE NOT NULL,
    lease_end DATE NOT NULL,
    monthly_payment DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Populate dealerships with Zelda-themed locations
INSERT INTO dealerships (name, address, phone) VALUES
('Hyrule Castle Motors', '1 Castle Town Road, Hyrule', '555-1234'),
('Goron City Auto', 'Death Mountain Trail, Goron City', '555-2345'),
('Zora''s Domain Vehicles', 'Zora River, Zora''s Domain', '555-3456'),
('Gerudo Valley Rides', 'Haunted Wasteland, Gerudo Desert', '555-4567'),
('Kakariko Village Cars', 'Eldin Foothills, Kakariko', '555-5678');

-- Populate vehicles with Zelda-themed cars
INSERT INTO vehicles (VIN, make, model, year, SOLD, color, vehicletype, odometer, price) VALUES
('ZELDA123456789012', 'Hylian', 'Master Cycle', 2023, FALSE, 'Blue', 'Motorcycle', 500, 15000.00),
('TRIFORCE098765432', 'Sheikah', 'Slate Mobile', 2022, FALSE, 'Black', 'SUV', 1200, 35000.00),
('GODDESS567890123', 'Goron', 'Rolling Boulder', 2021, FALSE, 'Red', 'Truck', 3500, 28000.00),
('ZORA456789012345', 'Zora', 'Silver Scale', 2023, TRUE, 'Silver', 'Luxury', 200, 42000.00),
('GERUDO7890123456', 'Gerudo', 'Sand Seal', 2022, FALSE, 'Gold', 'Convertible', 1800, 32000.00),
('KOKIRI2345678901', 'Kokiri', 'Deku Cruiser', 2023, FALSE, 'Green', 'Compact', 300, 18000.00),
('TWILIGHT345678901', 'Twili', 'Mirror Ride', 2021, TRUE, 'Purple', 'Sedan', 4200, 38000.00),
('SKYWARD678901234', 'Loftwing', 'Cloud Chaser', 2023, FALSE, 'Crimson', 'Sports', 150, 45000.00),
('OCARINA901234567', 'Tempo', 'Time Machine', 2022, FALSE, 'Ocarina', 'Luxury', 800, 50000.00),
('MAJORA1234567890', 'Mask', 'Moon Cruiser', 2021, FALSE, 'Multi', 'Van', 2500, 40000.00);

-- Populate inventory
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, 'ZELDA123456789012'),
(1, 'TRIFORCE098765432'),
(2, 'GODDESS567890123'),
(3, 'ZORA456789012345'),
(4, 'GERUDO7890123456'),
(5, 'KOKIRI2345678901'),
(1, 'TWILIGHT345678901'),
(2, 'SKYWARD678901234'),
(3, 'OCARINA901234567'),
(4, 'MAJORA1234567890');

-- Populate sales_contracts
INSERT INTO sales_contracts (VIN, sale_date, price) VALUES
('ZORA456789012345', '2023-05-15', 40000.00),
('TWILIGHT345678901', '2023-06-20', 35000.00);

-- Populate lease_contracts
INSERT INTO lease_contracts (VIN, lease_start, lease_end, monthly_payment) VALUES
('KOKIRI2345678901', '2023-07-01', '2024-07-01', 350.00),
('GERUDO7890123456', '2023-08-15', '2024-08-15', 500.00);