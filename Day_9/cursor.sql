CREATE DATABASE CompanyDB;
 
USE CompanyDB;
 
 
CREATE TABLE Employee
(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);
 
 
 
INSERT INTO Employee VALUES
(101, 'Amit', 'IT', 40000),
(102, 'Neha', 'HR', 35000),
(103, 'Rahul', 'Sales', 30000),
(104, 'Priya', 'IT', 50000),
(105, 'Karan', 'Finance', 45000);
 
 
SELECT * FROM Employee;
DELIMITER //
 
CREATE PROCEDURE DisplayEmployees()
 
BEGIN
 
    -- Declare variables
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(50);
    DECLARE v_department VARCHAR(30);
    DECLARE v_salary DECIMAL(10,2);
 
    
    DECLARE finished INT DEFAULT 0;
 
    
    DECLARE emp_cursor CURSOR FOR
    SELECT emp_id, emp_name, department, salary
    FROM Employee;
 
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET finished = 1;
 
 
    
    OPEN emp_cursor;
 
 
    read_loop: LOOP
 
        
        FETCH emp_cursor
        INTO v_id, v_name, v_department, v_salary;
 
 
        
        IF finished = 1 THEN
            LEAVE read_loop;
        END IF;
 
 
	
        SELECT
            v_id AS Employee_ID,
            v_name AS Employee_Name,
            v_department AS Department,
            v_salary AS Salary;
 
    END LOOP;
 
 
    CLOSE emp_cursor;
 
END //
 
DELIMITER ;
 
 
 
CALL DisplayEmployees();
--

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 5, 45000),
(2, 'Mouse', 'Accessories', 15, 500),
(3, 'Keyboard', 'Accessories', 35, 1000),
(4, 'Monitor', 'Electronics', 8, 12000),
(5, 'Printer', 'Electronics', 25, 8000);

SELECT * FROM Products;

DELIMITER //

CREATE PROCEDURE UpdateStock()

BEGIN

    
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(50);
    DECLARE v_quantity INT;
    DECLARE v_old_quantity INT;
    DECLARE v_new_quantity INT;


    
    DECLARE finished INT DEFAULT 0;


    
    DECLARE product_cursor CURSOR FOR
    SELECT product_id, product_name, quantity
    FROM Products;

    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET finished = 1;

   
    OPEN product_cursor;

    read_loop: LOOP

       
        FETCH product_cursor
        INTO v_id, v_name, v_quantity;

        
        IF finished = 1 THEN
            LEAVE read_loop;
        END IF;

        
        SET v_old_quantity = v_quantity;

        
        IF v_quantity < 10 THEN
            SET v_new_quantity = v_quantity + 20;

        ELSEIF v_quantity BETWEEN 10 AND 30 THEN
            SET v_new_quantity = v_quantity + 10;

        ELSE
            SET v_new_quantity = v_quantity;

        END IF;

       
        UPDATE Products
        SET quantity = v_new_quantity
        WHERE product_id = v_id;

        
        SELECT
            v_name AS Product_Name,
            v_old_quantity AS Old_Quantity,
            v_new_quantity AS Updated_Quantity;

    END LOOP;

    
    CLOSE product_cursor;

END //

DELIMITER ;

CALL UpdateStock();

SELECT * FROM Products;