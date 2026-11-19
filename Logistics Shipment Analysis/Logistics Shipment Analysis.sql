
-- STEP 1: CREATE DATABASE

CREATE DATABASE LogisticsDB;
USE LogisticsDB;


-- STEP 2: CREATE HUB TABLE

CREATE TABLE Hub (
    hub_id INT PRIMARY KEY,
    hub_name VARCHAR(50),
    city VARCHAR(50)
);


-- STEP 3: CREATE CARRIER TABLE

CREATE TABLE Carrier (
    carrier_id INT PRIMARY KEY,
    carrier_name VARCHAR(50),
    phone VARCHAR(15)
);


-- STEP 4: CREATE CUSTOMER TABLE

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);


-- STEP 5: CREATE EMPLOYEE TABLE

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    supervisor_id INT,
    FOREIGN KEY (supervisor_id)
        REFERENCES Employee(employee_id)
);


-- STEP 6: CREATE SHIPMENT TABLE

CREATE TABLE Shipment (
    shipment_id INT PRIMARY KEY,
    customer_id INT,
    carrier_id INT,
    origin_hub_id INT,
    destination_hub_id INT,
    employee_id INT,
    shipping_cost DECIMAL(10,2),
    shipped_date DATE,
    expected_delivery DATE,
    actual_delivery DATE,

    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (carrier_id) REFERENCES Carrier(carrier_id),
    FOREIGN KEY (origin_hub_id) REFERENCES Hub(hub_id),
    FOREIGN KEY (destination_hub_id) REFERENCES Hub(hub_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);


-- STEP 7: CREATE DELIVERY EVENT TABLE

CREATE TABLE DeliveryEvent (
    event_id INT PRIMARY KEY,
    shipment_id INT,
    event_type VARCHAR(50),
    event_date DATE,
    remarks VARCHAR(100),

    FOREIGN KEY (shipment_id)
        REFERENCES Shipment(shipment_id)
);


-- STEP 8: CREATE SHIPMENT HUB TABLE

CREATE TABLE ShipmentHub (
    shipment_id INT,
    hub_id INT,
    visit_date DATE,

    PRIMARY KEY (shipment_id, hub_id),

    FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id),
    FOREIGN KEY (hub_id) REFERENCES Hub(hub_id)
);

SHOW TABLES;


INSERT INTO Hub VALUES
(1, 'Central Hub', 'Chennai'),
(2, 'North Hub', 'Delhi'),
(3, 'South Hub', 'Bangalore'),
(4, 'West Hub', 'Mumbai'),
(5, 'East Hub', 'Kolkata');


INSERT INTO Carrier VALUES
(1, 'BlueDart', '9876543210'),
(2, 'DTDC', '9876543211'),
(3, 'Delhivery', '9876543212'),
(4, 'FedEx', '9876543213');


INSERT INTO Customer VALUES
(1, 'Arun', 'Chennai'),
(2, 'Priya', 'Delhi'),
(3, 'Rahul', 'Bangalore'),
(4, 'Sneha', 'Mumbai'),
(5, 'Kavin', 'Kolkata');


INSERT INTO Employee VALUES
(101, 'Raj', NULL),
(102, 'Kumar', 101),
(103, 'Divya', 101),
(104, 'Anu', 102),
(105, 'Vijay', 102),
(106, 'Meena', 103);


INSERT INTO Shipment VALUES
(1001, 1, 1, 1, 2, 102, 1500.00, '2026-11-01', '2026-11-04', '2026-11-08'),
(1002, 2, 2, 2, 3, 103, 2000.00, '2026-11-02', '2026-11-05', '2026-11-06'),
(1003, 3, 1, 3, 4, 104, 1200.00, '2026-11-03', '2026-11-06', '2026-11-06'),
(1004, 1, 3, 1, 3, 105, 1800.00, '2026-11-04', '2026-11-07', '2026-11-11'),
(1005, 4, 4, 4, 2, 106, 2500.00, '2026-11-05', '2026-11-08', '2026-11-12'),
(1006, 5, 2, 3, 2, 102, 1000.00, '2026-11-06', '2026-11-09', '2026-11-09'),
(1007, 2, 3, 2, 4, 103, 2200.00, '2026-11-07', '2026-11-10', '2026-11-14'),
(1008, 3, 4, 3, 1, 104, 1600.00, '2026-11-08', '2026-11-11', '2026-11-12'),
(1009, 4, 1, 4, 3, 105, 3000.00, '2026-11-09', '2026-11-12', '2026-11-12'),
(1010, 5, 2, 2, 3, 106, 1400.00, '2026-11-10', '2026-11-13', '2026-11-18');


INSERT INTO DeliveryEvent VALUES
(1, 1001, 'Picked Up', '2026-11-01', 'Shipment collected'),
(2, 1001, 'Delayed', '2026-11-06', 'Vehicle breakdown'),
(3, 1002, 'In Transit', '2026-11-04', 'Moving to destination'),
(4, 1003, 'Delivered', '2026-11-06', 'Successfully delivered'),
(5, 1004, 'Delayed', '2026-11-10', 'Weather conditions'),
(6, 1005, 'Delayed', '2026-11-11', 'Traffic delay'),
(7, 1006, 'Delivered', '2026-11-09', 'Successfully delivered'),
(8, 1007, 'Delayed', '2026-11-13', 'Sorting delay'),
(9, 1008, 'Delivered', '2026-11-12', 'Successfully delivered'),
(10, 1009, 'Delivered', '2026-11-12', 'Successfully delivered'),
(11, 1010, 'Delayed', '2026-11-17', 'Weather conditions');


INSERT INTO ShipmentHub VALUES
(1001, 1, '2026-11-01'),
(1001, 2, '2026-11-03'),
(1001, 4, '2026-11-05'),

(1004, 1, '2026-11-04'),
(1004, 3, '2026-11-06'),
(1004, 5, '2026-11-09'),

(1002, 2, '2026-11-02'),
(1002, 3, '2026-11-05'),

(1003, 3, '2026-11-03'),
(1003, 4, '2026-11-06'),

(1005, 4, '2026-11-05'),
(1005, 2, '2026-11-10'),

(1006, 3, '2026-11-06'),
(1006, 2, '2026-11-09'),

(1007, 2, '2026-11-07'),
(1007, 4, '2026-11-12'),

(1008, 3, '2026-11-08'),
(1008, 1, '2026-11-12'),

(1009, 4, '2026-11-09'),
(1009, 3, '2026-11-12'),

(1010, 2, '2026-11-10'),
(1010, 3, '2026-11-17');

-- TASK 1
-- Q1. Display all shipments with their customer names.
-- JOIN: INNER JOIN

SELECT
    s.shipment_id,
    c.customer_name,
    s.shipping_cost
FROM Shipment s
INNER JOIN Customer c
ON s.customer_id = c.customer_id;


-- Q2. Display all shipments with their carrier names.
-- JOIN: INNER JOIN

SELECT
    s.shipment_id,
    ca.carrier_name,
    s.shipping_cost
FROM Shipment s
INNER JOIN Carrier ca
ON s.carrier_id = ca.carrier_id;


-- Q3. Display shipments delayed by more than 2 days
-- along with their carrier names.
-- JOIN: INNER JOIN

SELECT
    s.shipment_id,
    ca.carrier_name,
    s.expected_delivery,
    s.actual_delivery,
    DATEDIFF(s.actual_delivery, s.expected_delivery) AS delay_days
FROM Shipment s
INNER JOIN Carrier ca
ON s.carrier_id = ca.carrier_id
WHERE DATEDIFF(s.actual_delivery, s.expected_delivery) > 2;


-- Q4. Display shipment details with origin and destination hub names.
-- JOIN: INNER JOIN (joining the Hub table twice)

SELECT
    s.shipment_id,
    h1.hub_name AS origin_hub,
    h2.hub_name AS destination_hub
FROM Shipment s
INNER JOIN Hub h1
ON s.origin_hub_id = h1.hub_id
INNER JOIN Hub h2
ON s.destination_hub_id = h2.hub_id;


-- Q5. Display all customers and their shipment details.
-- JOIN: LEFT JOIN

SELECT
    c.customer_name,
    s.shipment_id,
    s.shipping_cost
FROM Customer c
LEFT JOIN Shipment s
ON c.customer_id = s.customer_id;


-- Q6. Display all carriers and their shipment details,
-- including carriers without shipments.
-- JOIN: RIGHT JOIN

SELECT
    ca.carrier_name,
    s.shipment_id,
    s.shipping_cost
FROM Shipment s
RIGHT JOIN Carrier ca
ON s.carrier_id = ca.carrier_id;


-- Q7. Display hubs that have no outbound shipments.
-- JOIN: LEFT JOIN

SELECT
    h.hub_id,
    h.hub_name
FROM Hub h
LEFT JOIN Shipment s
ON h.hub_id = s.origin_hub_id
WHERE s.shipment_id IS NULL;


-- Q8. Display employees and their supervisor names.
-- JOIN: SELF JOIN

SELECT
    e.employee_name AS employee,
    m.employee_name AS supervisor
FROM Employee e
LEFT JOIN Employee m
ON e.supervisor_id = m.employee_id;


-- Q9. Display shipment details along with delivery event details.
-- JOIN: LEFT JOIN

SELECT
    s.shipment_id,
    d.event_type,
    d.event_date,
    d.remarks
FROM Shipment s
LEFT JOIN DeliveryEvent d
ON s.shipment_id = d.shipment_id;


-- Q10. Display customer names, shipment IDs and carrier names.
-- JOIN: Multiple INNER JOINs

SELECT
    c.customer_name,
    s.shipment_id,
    ca.carrier_name
FROM Shipment s
INNER JOIN Customer c
ON s.customer_id = c.customer_id
INNER JOIN Carrier ca
ON s.carrier_id = ca.carrier_id;

-- TASK 2

-- IN – Find customers who shipped from Chennai.

SELECT customer_name
FROM Customer
WHERE customer_id IN (
    SELECT customer_id
    FROM Shipment
    WHERE origin_hub_id = 1
);

-- EXISTS – Find customers who have at least one delayed shipment.

SELECT customer_name
FROM Customer c
WHERE EXISTS (
    SELECT *
    FROM Shipment s
    WHERE s.customer_id = c.customer_id
    AND s.actual_delivery > s.expected_delivery
);

-- ANY – Find carriers whose average delay is greater than at least one carrier's average delay.

SELECT carrier_id,
       AVG(DATEDIFF(actual_delivery, expected_delivery)) AS avg_delay
FROM Shipment
GROUP BY carrier_id
HAVING AVG(DATEDIFF(actual_delivery, expected_delivery)) > ANY (
    SELECT AVG(DATEDIFF(actual_delivery, expected_delivery))
    FROM Shipment
    GROUP BY carrier_id
);

-- ALL – Find carriers whose average delay is greater than every other carrier's average delay.

SELECT carrier_id,
       AVG(DATEDIFF(actual_delivery, expected_delivery)) AS avg_delay
FROM Shipment
GROUP BY carrier_id
HAVING AVG(DATEDIFF(actual_delivery, expected_delivery)) > ALL (
    SELECT AVG(DATEDIFF(actual_delivery, expected_delivery))
    FROM Shipment
    GROUP BY carrier_id
    HAVING carrier_id <> 3
);

-- TASK 3

-- 1. customers who have delayed shipments.

-- Using Subquery

SELECT customer_name
FROM Customer
WHERE customer_id IN (
    SELECT customer_id
    FROM Shipment
    WHERE actual_delivery > expected_delivery
);


-- Using JOIN
SELECT DISTINCT c.customer_name
FROM Customer c
INNER JOIN Shipment s
ON c.customer_id = s.customer_id
WHERE s.actual_delivery > s.expected_delivery;

-- 2. Find shipments with their carrier names.

-- Using Subquery

SELECT shipment_id,
       (SELECT carrier_name
        FROM Carrier
        WHERE Carrier.carrier_id = Shipment.carrier_id) AS carrier_name
FROM Shipment;


-- Using JOIN

SELECT s.shipment_id, c.carrier_name
FROM Shipment s
INNER JOIN Carrier c
ON s.carrier_id = c.carrier_id;

-- TASK 4

-- Find the second-highest shipping cost per hub

SELECT h.hub_name, s.shipping_cost
FROM Shipment s
JOIN Hub h
ON s.origin_hub_id = h.hub_id
WHERE 1 = (
    SELECT COUNT(DISTINCT s2.shipping_cost)
    FROM Shipment s2
    WHERE s2.origin_hub_id = s.origin_hub_id
    AND s2.shipping_cost > s.shipping_cost
);