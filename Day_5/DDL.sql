create database hexaware1;
 
use hexaware1;
 
  Create table Student
  ( Student_ID int,
    Student_Name varchar(50),
    Age int,
    City varchar(30),
    Marks int);

 Create table Employee
  ( Emp_ID int,
    Emp_Name varchar(50),
    Salary decimal(10,2),
    Department varchar(30),
    Joining_Date date);

 Create table Department
  ( Dept_ID int,
    Dept_Name varchar(50),
    Location varchar(50)
  );

 Create table Product
  ( Product_ID int,
    Product_Name varchar(100),
    Price decimal(10,2),
    Quantity int);

 Alter table Student ADD COLUMN Email varchar(100);

 Alter table Employee ADD COLUMN Phone_Number int, ADD COLUMN Date_of_Birth date;

ALTER TABLE Student MODIFY COLUMN Student_Name VARCHAR(100);

 Alter table Employee MODIFY COLUMN Salary decimal(12,2);

 ALTER TABLE Student MODIFY COLUMN Age smallint;

 ALTER TABLE Student RENAME COLUMN City TO Student_City;

ALTER TABLE Student DROP COLUMN Email;

DESC Student;

ALTER TABLE Student RENAME COLUMN Student TO Student_Details;

 TRUNCATE TABLE Product;

 DROP TABLE Department;

 CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 18)
    );

 CREATE TABLE Bank_Account (
    Account_ID INT PRIMARY KEY,
    Account_Holder VARCHAR(50) NOT NULL,
    Balance DECIMAL(10,2) DEFAULT 0,
    Account_Type VARCHAR(20)
    CHECK (Account_Type IN ('Savings', 'Current'))
    );

 CREATE TABLE Department_Master (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50)
    );

    CREATE TABLE Employee_Master (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID)
    REFERENCES Department_Master(Dept_ID)
    );

 CREATE TABLE Student_Exam (
    Exam_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50) NOT NULL,
    Marks INT CHECK (Marks BETWEEN 0 AND 100),
    Result VARCHAR(20) DEFAULT 'Pending'
    );

 CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL UNIQUE,
    Order_Date DATE,
    Amount DECIMAL(10,2) CHECK (Amount > 0),
    Order_Status VARCHAR(30) DEFAULT 'Processing'
    );

