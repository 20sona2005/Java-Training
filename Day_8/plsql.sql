create database plsql;
use plsql;

delimiter //
 
create procedure calculateMarks(in s1 int,in s2 int,in s3 int,in s4 int)
begin
    declare total int;
    declare avg_marks decimal(5,2);
    declare result varchar(10);
 
    set total = s1 + s2 + s3 + s4;
    set avg_marks = total / 4;
    
    if(avg_marks >= 75) then
       set result = 'pass';
	else
       set result = 'fail' ;
end if;
 
    select total as 'total marks', avg_marks as 'average marks', result as 'result';
end //
 
delimiter ;
call calculateMarks(70,50,90,80)
--
delimiter //
 
create procedure checkVoting(
     age int
)
begin
    declare result varchar(20);
 
    if (age >= 18) then
        set result = 'eligible';
    else
        set result = 'not eligible';
    end if;
 
    select result as 'voting status';
end //
 
delimiter ;
call checkVoting(20);
--
DELIMITER //
 
CREATE PROCEDURE CheckVoting1(

    IN age INT,

    OUT result VARCHAR(30)

)

BEGIN
 
    IF age >= 18 THEN

        SET result = 'Eligible to Vote';

    ELSE

        SET result = 'Not Eligible';

    END IF;
 
END //
 
DELIMITER ;
 
 
SET @voting_result = '';
 
CALL CheckVoting1(18, @voting_result);
 


SELECT @voting_result AS Voting_Status;
--

delimiter //

create procedure calbill(
    in units int,
    out bill int
)
begin
    if (units >= 0 and units <= 100) then
        set bill = 0;

    elseif (units >= 101 and units <= 200) then
        set bill = units * 4;

    elseif (units >= 201 and units <= 300) then
        set bill = units * 3;

    else
        set bill = units * 2;
    end if;
end //

delimiter ;
call calbill(150, @bill);
select @bill as 'electricity bill';
 
 --
 delimiter //

create function calbill(units int)

returns int

deterministic

begin
    declare bill int;

    if (units >= 0 and units <= 100) then
        set bill = 0;

    elseif (units >= 101 and units <= 200) then
        set bill = units * 4;

    elseif (units >= 201 and units <= 300) then
        set bill = units * 3;

    else
        set bill = units * 2;

    end if;

    return bill;

end //

delimiter ;
select calbill(150) as 'electricity bill';

--

delimiter //

create procedure sumNatural()
begin
    declare i int default 1;
    declare total int default 0;

    while (i <= 10) do

        set total = total + i;
        set i = i + 1;

    end while;
    select total as 'sum of natural numbers';
    
end //

delimiter ;

call sumNatural();
--

delimiter //

create procedure factorial()
begin
    declare i int default 1;
    declare num int default 5;
    declare fact int default 1;

    while (i <= num) do

        set fact = fact * i;
        set i = i + 1;

    end while;

   select fact as 'factorial';
end //

delimiter ;

call factorial();
--

delimiter //

create procedure evenSum()
begin
    declare i int default 1;
    declare total int default 0;

    repeat
        if (i % 2 = 0) then
            set total = total + i;
        end if;

        set i = i + 1;

    until i <= 10
    end repeat;

    select total as 'sum of even numbers';
end //

delimiter ;

call evenSum();

--
CREATE TABLE Student (
    roll INT PRIMARY KEY,
    name VARCHAR(50),
    fee DECIMAL(10,2),
    subject VARCHAR(50)
);
 
INSERT INTO Student VALUES
(101, 'Amit', 25000, 'Python'),
(102, 'Riya', 30000, 'Java'),
(103, 'Rahul', 28000, 'SQL'),
(104, 'Priya', 32000, 'Data Science'),
(105, 'Neha', 27000, 'Web Development');
 
 
DELIMITER //
 
CREATE PROCEDURE ShowStudent1()
BEGIN
 
    DECLARE v_name VARCHAR(50);
    DECLARE v_fee DECIMAL(10,2);
    DECLARE v_subject VARCHAR(50);
 
    SELECT name, fee, subject
    INTO v_name, v_fee, v_subject
    FROM Student
    WHERE roll = 101;

 
    SELECT v_name AS Name,
           v_fee AS Fee,
           v_subject AS Subject;
 
END //
 
DELIMITER ;
 
CALL ShowStudent1();
--

DELIMITER //

CREATE PROCEDURE ShowStudent2(IN p_roll INT)
BEGIN
    DECLARE v_name VARCHAR(50);
    DECLARE v_fee DECIMAL(10,2);
    DECLARE v_subject VARCHAR(50);

    SELECT name, fee, subject
    INTO v_name, v_fee, v_subject
    FROM Student
    WHERE roll = p_roll;

    SELECT v_name AS Name,
           v_fee AS Fee,
           v_subject AS Subject;

END //

DELIMITER ;

CALL ShowStudent2(105);
 --
 
 DELIMITER //

CREATE PROCEDURE UpdateStudentFee(IN p_roll INT)
BEGIN
    DECLARE v_subject VARCHAR(50);
    DECLARE v_exists INT DEFAULT 0;

    SELECT COUNT(*) INTO v_exists
    FROM Student
    WHERE roll = p_roll;

    IF v_exists = 0 THEN
        SELECT 'Roll number does not exist' AS Message;

    ELSE
        SELECT subject INTO v_subject
        FROM Student
        WHERE roll = p_roll;

        IF v_subject = 'Java' THEN
            UPDATE Student
            SET fee = fee + 100
            WHERE roll = p_roll;
        ELSE
            UPDATE Student
            SET fee = fee + 200
            WHERE roll = p_roll;
        END IF;

        SELECT * FROM Student
        WHERE roll = p_roll;

    END IF;

END //

DELIMITER ;
CALL UpdateStudentFee(102);
--
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    experience INT
);
INSERT INTO Employee VALUES
(101, 'Amit', 25000, 1),
(102, 'Riya', 30000, 2),
(103, 'Rahul', 35000, 3),
(104, 'Priya', 40000, 5),
(105, 'Neha', 28000, 4);

DELIMITER //

CREATE PROCEDURE IncreaseSalary(IN p_id INT)
BEGIN
    DECLARE v_exp INT;

    SELECT experience INTO v_exp
    FROM Employee
    WHERE emp_id = p_id;

    IF v_exp = 1 THEN

        UPDATE Employee
        SET salary = salary + (salary * 10 / 100)
        WHERE emp_id = p_id;

    ELSEIF v_exp > 1 AND v_exp <= 3 THEN

        UPDATE Employee
        SET salary = salary + (salary * 15 / 100)
        WHERE emp_id = p_id;

    ELSEIF v_exp > 3 THEN

        UPDATE Employee
        SET salary = salary + (salary * 20 / 100)
        WHERE emp_id = p_id;

    ELSE

        SELECT 'Invalid experience' AS Message;

    END IF;

    SELECT * FROM Employee WHERE emp_id = p_id;

END //

DELIMITER ;

CALL IncreaseSalary(101);
CALL IncreaseSalary(103);
CALL IncreaseSalary(104);

--

CREATE TABLE Items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    price INT,
    stock INT
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(50),
    item_name VARCHAR(50),
    quantity INT,
    bill INT
);

INSERT INTO Items VALUES
(1, 'Laptop', 50000, 10),
(2, 'Mobile', 20000, 15),
(3, 'Keyboard', 1000, 5);

DELIMITER //

CREATE PROCEDURE PlaceOrder(
    IN p_name VARCHAR(50),
    IN p_id INT,
    IN p_qty INT
)
BEGIN
    DECLARE v_price INT DEFAULT 0;
    DECLARE v_stock INT DEFAULT 0;
    DECLARE v_count INT DEFAULT 0;

    SELECT COUNT(*) INTO v_count
    FROM Items
    WHERE item_id = p_id;

    IF v_count = 0 THEN

        SELECT 'Item not found' AS Message;

    ELSE

        SELECT price, stock INTO v_price, v_stock
        FROM Items
        WHERE item_id = p_id;

        IF p_qty <= 0 THEN

            SELECT 'Invalid quantity' AS Message;

        ELSEIF v_stock >= p_qty THEN

            INSERT INTO Orders(client_name, item_name, quantity, bill)
            SELECT p_name, item_name, p_qty, v_price * p_qty
            FROM Items
            WHERE item_id = p_id;

            UPDATE Items
            SET stock = stock - p_qty
            WHERE item_id = p_id;

            SELECT 'Order placed successfully' AS Message,
                   v_price * p_qty AS Bill;

        ELSE

            SELECT 'Stock not available' AS Message;

        END IF;

    END IF;

END //

DELIMITER ;

CALL PlaceOrder('Amit', 1, 2);
SELECT * FROM Items;
SELECT * FROM Orders;

--

CREATE DATABASE ShopDB;
 
USE ShopDB;
CREATE TABLE Items

(

    item_code INT PRIMARY KEY,

    item_name VARCHAR(50),

    category VARCHAR(50),

    quantity INT,

    price DECIMAL(10,2),

    status VARCHAR(20)

);
 
 
 
INSERT INTO Items VALUES

(101, 'Laptop', 'Electronics', 10, 50000, 'AVAILABLE'),

(102, 'Mouse', 'Accessories', 5, 500, 'AVAILABLE'),

(103, 'Keyboard', 'Accessories', 3, 1000, 'AVAILABLE'),

(104, 'Monitor', 'Electronics', 2, 12000, 'AVAILABLE');
 

 
 
CREATE TABLE Orders

(

    oid INT PRIMARY KEY AUTO_INCREMENT,

    item_code INT,

    item_name VARCHAR(50),

    order_qty INT,

    order_price DECIMAL(10,2),

    total_amount DECIMAL(10,2),

    order_date DATE,

    message VARCHAR(100)

);
 
 
 
DELIMITER //
 
CREATE TRIGGER Stock_Finished

AFTER UPDATE ON Items

FOR EACH ROW

BEGIN
 
    IF NEW.quantity = 0 AND OLD.quantity > 0 THEN
 
        INSERT INTO Orders

        (

            item_code,

            item_name,

            order_qty,

            order_price,

            total_amount,

            order_date,

            message

        )

        VALUES

        (

            NEW.item_code,

            NEW.item_name,

            0,

            NEW.price,

            0,

            CURDATE(),

            'Stock Finished'

        );
 
    END IF;
 
END //
 
DELIMITER ;
 
 
SELECT * FROM Items;
 
 
 
UPDATE Items

SET quantity = 0,

    status = 'OUT OF STOCK'

WHERE item_code = 103;
 
 
 
SELECT * FROM Items;
 
 
SELECT * FROM Orders;
 
 
UPDATE Items

SET quantity = 0,

    status = 'OUT OF STOCK'

WHERE item_code = 103;
 
 
SELECT * FROM Orders;
 