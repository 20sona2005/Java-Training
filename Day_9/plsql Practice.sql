CREATE DATABASE CollegeDB;

USE CollegeDB;

CREATE TABLE Student
(
    roll INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    subject VARCHAR(30),
    marks INT,
    fee DECIMAL(10,2)
);
INSERT INTO Student VALUES
(101, 'Amit', 20, 'Python', 85, 15000),
(102, 'Neha', 21, 'Java', 75, 12000),
(103, 'Rahul', 19, 'SQL', 90, 10000),
(104, 'Priya', 22, 'Python', 65, 15000),
(105, 'Karan', 20, 'Java', 45, 12000),
(106, 'Simran', 23, 'SQL', 95, 10000);

DELIMITER //

CREATE PROCEDURE checkResults(IN s_roll INT)
BEGIN
    DECLARE s_marks INT;
    DECLARE result VARCHAR(10);

    SELECT marks INTO s_marks
    FROM Student
    WHERE roll = s_roll;

    IF (s_marks >= 40) THEN
        SET result = 'pass';
    ELSE
        SET result = 'fail';
    END IF;

    SELECT s_roll AS 'roll number',
           s_marks AS 'marks',
           result AS 'result';

END //

DELIMITER ;

CALL checkResults(105);

--

DELIMITER //

CREATE PROCEDURE calculateDiscounts(IN s_roll INT)
BEGIN
    DECLARE s_fee INT;
    DECLARE discount INT;
    DECLARE final_fee INT;

    SELECT fee INTO s_fee
    FROM Student
    WHERE roll = s_roll;

    IF (s_fee > 10000) THEN
        SET discount = s_fee * 10 / 100;
    ELSE
        SET discount = 0;
    END IF;

    SET final_fee = s_fee - discount;

    SELECT s_roll AS 'roll number',
           s_fee AS 'original fee',
           discount AS 'discount',
           final_fee AS 'final fee';
END //

DELIMITER ;

CALL calculateDiscounts(101);
