
create database telecom_db;

use telecom_db;



create table subscribers (
    subscriber_id int primary key,
    subscriber_name varchar(50),
    phone_number varchar(15),
    user_type varchar(20),
    balance decimal(10,2),
    plan_name varchar(50),
    validity_end date
);



create table recharge_history (
    recharge_id int primary key auto_increment,
    subscriber_id int,
    recharge_amount decimal(10,2),
    recharge_date date,
    new_balance decimal(10,2),
    foreign key (subscriber_id)
    references subscribers(subscriber_id)
);



create table notifications (
    notification_id int primary key auto_increment,
    subscriber_id int,
    message varchar(200),
    notification_date date,
    foreign key (subscriber_id)
    references subscribers(subscriber_id)
);



insert into subscribers values
(1, 'Arun', '9876543210', 'PREPAID', 30, 'Basic', '2026-12-10'),
(2, 'Priya', '9876543211', 'PREPAID', 150, 'Premium', '2026-12-20'),
(3, 'Kumar', '9876543212', 'PREPAID', 20, 'Basic', '2026-11-25'),
(4, 'Divya', '9876543213', 'POSTPAID', 500, 'Monthly', '2026-12-30'),
(5, 'Ravi', '9876543214', 'PREPAID', 45, 'Standard', '2026-11-30');



select * from subscribers;

select * from recharge_history;

select * from notifications;

-- TASK 1

create view vw_prepaid_subscribers as
select
    subscriber_id,
    subscriber_name,
    balance,
    plan_name,
    validity_end
from subscribers
where user_type = 'PREPAID';

select * from vw_prepaid_subscribers;

create view vw_recharge_summary as
select
    recharge_id,
    subscriber_id,
    recharge_amount,
    recharge_date,
    new_balance
from recharge_history;

select * from vw_recharge_summary;

-- TASK 2


DELIMITER //

CREATE PROCEDURE sp_recharge(
    IN s_id INT,
    IN recharge_amt DECIMAL(10,2),
    OUT new_balance DECIMAL(10,2)
)
BEGIN
    DECLARE old_balance DECIMAL(10,2);
    DECLARE s_plan VARCHAR(50);
    DECLARE msg VARCHAR(100);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    SELECT balance, plan_name
    INTO old_balance, s_plan
    FROM subscribers
    WHERE subscriber_id = s_id;

    IF recharge_amt <= 0 THEN
        SET msg = 'Invalid recharge amount';
    END IF;

    IF s_plan IS NULL OR s_plan = '' THEN
        SET msg = 'Invalid plan';
    END IF;

    IF msg IS NULL THEN

        SET new_balance = old_balance + recharge_amt;

        UPDATE subscribers
        SET balance = new_balance
        WHERE subscriber_id = s_id;

        INSERT INTO recharge_history
        (subscriber_id, recharge_amount, recharge_date, new_balance)
        VALUES
        (s_id, recharge_amt, CURDATE(), new_balance);

        COMMIT;

    ELSE
        ROLLBACK;
        SELECT msg AS Error_Message;
    END IF;

END //

DELIMITER ;

CALL sp_recharge(1, 100, @result);

SELECT @result AS new_balance;

-- TASK 3


DELIMITER //

CREATE FUNCTION fn_validity_days_left(end_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE days_left INT;

    SET days_left = DATEDIFF(end_date, CURDATE());

    RETURN days_left;
END //

DELIMITER ;

SELECT subscriber_id,subscriber_name,validity_end,fn_validity_days_left(validity_end) AS days_left
FROM subscribers;

-- TASK 4


DELIMITER //

CREATE PROCEDURE sp_low_balance_cursor()
BEGIN
    DECLARE finished INT DEFAULT 0;
    DECLARE s_id INT;

    DECLARE cur CURSOR FOR
        SELECT subscriber_id
        FROM subscribers
        WHERE balance < 50
        AND user_type = 'PREPAID';

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET finished = 1;

    OPEN cur;

    read_loop: LOOP

        FETCH cur INTO s_id;

        IF finished = 1 THEN
            LEAVE read_loop;
        END IF;

        INSERT INTO notifications
        (subscriber_id, message, notification_date)
        VALUES
        (s_id, 'Your balance is below 50 units', CURDATE());

    END LOOP;

    CLOSE cur;

END //

DELIMITER ;

CALL sp_low_balance_cursor();

SELECT * FROM notifications;


-- Using Insert into

DELETE FROM notifications;


INSERT INTO notifications
(subscriber_id, message, notification_date)
SELECT
    subscriber_id,
    'Your balance is below 50 units',
    CURDATE()
FROM subscribers
WHERE balance < 50
AND user_type = 'PREPAID';


SELECT * FROM notifications;
--

-- TASK 5



DELIMITER //

CREATE PROCEDURE sp_check_recharge(IN recharge_amt INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Invalid recharge amount - Error handled'
        AS Error_Message;
    END;

    IF recharge_amt <= 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid recharge amount';

    ELSE

        SELECT 'Recharge amount is valid' AS Result;

    END IF;

END //

DELIMITER ;


CALL sp_check_recharge(-100);