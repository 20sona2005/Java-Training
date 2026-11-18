CREATE DATABASE retail_inventory;

USE retail_inventory;

-- TASK 2
CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    supplier_phone VARCHAR(15) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE Warehouse (
    warehouse_id INT PRIMARY KEY AUTO_INCREMENT,
    warehouse_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Product (
    sku VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    supplier_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0 CHECK (quantity >= 0),
    reorder_level INT NOT NULL DEFAULT 10,

    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES Category(category_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES Supplier(supplier_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_warehouse
        FOREIGN KEY (warehouse_id)
        REFERENCES Warehouse(warehouse_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- TASK 3

INSERT INTO Category (category_name) VALUES
('Electronics'),
('Furniture'),
('Stationery'),
('Clothing'),
('Groceries'),
('Footwear'),
('Accessories'),
('Home Appliances'),
('Sports'),
('Books');

INSERT INTO Supplier (supplier_name, supplier_phone) VALUES
('ABC Suppliers', '9876543210'),
('XYZ Traders', '9876543211'),
('Home Supplies', '9876543212'),
('Paper World', '9876543213'),
('Global Stores', '9876543214'),
('Metro Distributors', '9876543215'),
('City Wholesale', '9876543216'),
('Prime Suppliers', '9876543217'),
('Star Enterprises', '9876543218'),
('National Traders', '9876543219');

INSERT INTO Warehouse (warehouse_name, location) VALUES
('Warehouse Chennai', 'Chennai'),
('Warehouse Bangalore', 'Bangalore'),
('Warehouse Mumbai', 'Mumbai'),
('Warehouse Delhi', 'Delhi'),
('Warehouse Hyderabad', 'Hyderabad'),
('Warehouse Coimbatore', 'Coimbatore'),
('Warehouse Kochi', 'Kochi'),
('Warehouse Pune', 'Pune'),
('Warehouse Kolkata', 'Kolkata'),
('Warehouse Jaipur', 'Jaipur');

INSERT INTO Product
(sku, product_name, category_id, supplier_id, warehouse_id, quantity, reorder_level)
VALUES
('P001', 'Laptop', 1, 1, 1, 25, 10),
('P002', 'Mouse', 1, 1, 2, 50, 15),
('P003', 'Keyboard', 1, 2, 3, 30, 10),
('P004', 'Office Chair', 2, 3, 1, 15, 5),
('P005', 'Dining Table', 2, 3, 2, 20, 8),
('P006', 'Notebook', 3, 4, 1, 100, 30),
('P007', 'Pen', 3, 4, 2, 200, 50),
('P008', 'Printer', 1, 2, 4, 12, 5),
('P009', 'Desk Lamp', 8, 5, 5, 18, 6),
('P010', 'Monitor', 1, 1, 3, 22, 8);

SELECT * FROM Category;
SELECT * FROM Supplier;
SELECT * FROM Warehouse;
SELECT * FROM Product;

SHOW TABLES;

SHOW TABLE STATUS;

DESC Category;
DESC Supplier;
DESC Warehouse;
DESC Product;

-- Four deliberately failing inserts 

INSERT INTO Category (category_id, category_name)
VALUES (1, 'Toys');

INSERT INTO Product
(sku, product_name, category_id, supplier_id, warehouse_id, quantity, reorder_level)
VALUES
('P011', 'Tablet', 99, 1, 1, 20, 5);

INSERT INTO Product
(sku, product_name, category_id, supplier_id, warehouse_id, quantity, reorder_level)
VALUES
('P012', 'Smartphone', 1, 1, 1, -10, 5);

INSERT INTO Supplier
(supplier_name, supplier_phone)
VALUES
(NULL, '9876543220');

-- TASK 4

-- UPDATE supplier phone number

SELECT * FROM Supplier
WHERE supplier_id = 1;

UPDATE Supplier
SET supplier_phone = '9998887770'
WHERE supplier_id = 1;

SELECT * FROM Supplier
WHERE supplier_id = 1;


-- DELETE discontinued product

SELECT * FROM Product
WHERE sku = 'P010';

DELETE FROM Product
WHERE sku = 'P010';

SELECT * FROM Product
WHERE sku = 'P010';


-- Display remaining products

SELECT * FROM Product;

-- TASK 5

-- 1. Display all databases
SHOW DATABASES;


-- 2. Explore information_schema
USE information_schema;
SHOW TABLES;


-- 3. Explore mysql database
USE mysql;
SHOW TABLES;


-- 4. Explore performance_schema
USE performance_schema;
SHOW TABLES;


-- 5. Explore sys database
USE sys;
SHOW TABLES;


-- 6. List all tables in retail_inventory
SELECT TABLE_NAME
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'retail_inventory';


-- 7. Display table names, storage engine and row count
SELECT
    TABLE_NAME,
    ENGINE,
    TABLE_ROWS
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'retail_inventory'
AND TABLE_TYPE = 'BASE TABLE';


-- 8. Display exact row count of each table
USE retail_inventory;

SELECT 'Category' AS Table_Name, COUNT(*) AS Total_Rows
FROM Category

UNION ALL

SELECT 'Supplier', COUNT(*)
FROM Supplier

UNION ALL

SELECT 'Warehouse', COUNT(*)
FROM Warehouse

UNION ALL

SELECT 'Product', COUNT(*)
FROM Product;