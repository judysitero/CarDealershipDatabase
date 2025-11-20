-- Q1. Get all dealerships
SELECT * 
FROM dealerships;

-- Q2. Find all vehicles for a specific dealership
SELECT name AS DealershipName, v.VIN, v.make, v.model, v.year
FROM dealerships AS d
JOIN inventory AS i 
ON d.dealership_id = i.dealership_id
JOIN vehicles AS v
ON i.VIN = v.VIN
WHERE name = 'Tonys Automobiles';


-- Q3. Find a car by VIN
SELECT *
FROM vehicles 
WHERE VIN = '3GNAFCE05E5000505';



-- Q4. Find the dealership where a certain car is located, by VIN
SELECT name AS DealershipName, v.make, v.model, d.address
FROM vehicles AS v
JOIN inventory AS i
ON v.VIN = i.VIN
JOIN dealerships AS d
ON i.dealership_id = d.dealership_id
WHERE v.VIN = 'JF1BL2F16P7000303';


-- Q5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
SELECT d.name AS DealershipName, d.phone
FROM dealerships d
JOIN inventory AS i 
ON d.dealership_id = i.dealership_id
JOIN vehicles AS v 
ON i.VIN = v.VIN
WHERE v.make = 'Chevrolet' AND v.model = 'Malibu' AND v.color = 'White';


-- Q6. Get all sales information for a specific dealer for a specific date range
SELECT sc.sales_date, sc.customer_name, sc.price_paid, v.make, v.model, v.year, d.name AS DealershipName
FROM sales_contracts AS sc
JOIN dealerships AS d 
ON sc.id = d.dealership_id
JOIN vehicles AS v 
ON sc.VIN = v.VIN
WHERE d.name = 'Tonys Automobiles' AND sc.sales_date BETWEEN '2025-01-01' AND '2025-12-31';