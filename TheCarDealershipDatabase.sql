DROP SCHEMA IF EXISTS cardealership;
CREATE SCHEMA cardealership;
USE cardealership;

CREATE TABLE dealerships (
dealership_id INT AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(50),
address VARCHAR(50),
phone VARCHAR(12)
);

CREATE TABLE vehicles (
VIN VARCHAR(17) PRIMARY KEY, 
make VARCHAR(30),
model VARCHAR(30),
price DECIMAL(10, 2), 
mileage INT,
year INT,
color VARCHAR(20),
SOLD BOOLEAN 
); 

CREATE TABLE inventory (
dealership_id INT,
VIN VARCHAR(17),
CONSTRAINT `fk_inventory_vehicles` 
FOREIGN KEY (VIN) REFERENCES vehicles (VIN) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE sales_contracts (
id INT AUTO_INCREMENT PRIMARY KEY, 
VIN VARCHAR (17),
customer_name VARCHAR(30),
sales_date DATE,
price_paid DECIMAL(10, 2),
CONSTRAINT `fk_sales_contracts`
FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO dealerships (name, address, phone) VALUES
('Ford Dealership', '123 Ave, Kent, WA 98030', '206-555-7777'),
('Tonys Automobiles', '426 St, Renton, WA 98057', '253-465-8985'),
('Seattle Mercedes', '7542 Airport Wy, Seattle, WA 98134', '206-588-6442'),
('Burien Chevorlet', '14400 1st Ave, Burien, WA 98168', '206-784-4825'),
('Toyota of Seattle', '9257, 5th Ave Seattle, WA 98884', '206-486-1235'),
('PNW Luxury Cars', '4265 Ave, Bellevue, WA 98004', '425-854-9874');

INSERT INTO vehicles (VIN, make, model, price, mileage, year, color, SOLD) VALUES
('1FADY4XG4B7000101', 'Ford', 'Mustang', 45000.00, 150, 2024, 'Red', FALSE),
('5YJSA1CN4E2000202', 'Tesla', 'Model 3', 32500.00, '1200', 2023, 'Blue', TRUE), 
('JF1BL2F16P7000303', 'Mercedes', 'GLE',28999.50, 25000, 2022, 'Silver', FALSE), 
('WBAXN4C58G2000404', 'BMW', 'X5', 48000.00, 40000, 2021, 'Black', TRUE),
('3GNAFCE05E5000505', 'Chevrolet', 'Malibu',21500.00, 500, 2023, 'White', FALSE);


INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1FADY4XG4B7000101'), 
(2, '5YJSA1CN4E2000202'), 
(3, 'JF1BL2F16P7000303'), 
(2, 'WBAXN4C58G2000404'),
(4, '3GNAFCE05E5000505');

INSERT INTO sales_contracts (VIN, customer_name, sales_date, price_paid) VALUES
('5YJSA1CN4E2000202', 'Ezra Vincent', '2025-8-14', 32500.00),
('WBAXN4C58G2000404', 'Judy Sitero', '2025-2-15', 48000.00);



