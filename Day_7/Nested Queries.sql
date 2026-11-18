create database emp;
use emp;

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    City VARCHAR(50)
);
INSERT INTO Employee VALUES
(1, 'Amit', 'IT', 30000, 'Delhi'),
(2, 'Neha', 'HR', 45000, 'Mumbai'),
(3, 'Ravi', 'IT', 60000, 'Delhi'),
(4, 'Priya', 'Sales', 25000, 'Pune'),
(5, 'Rahul', 'HR', 50000, 'Delhi'),
(6, 'Sneha', 'Sales', 35000, 'Mumbai'),
(7, 'Karan', 'IT', 70000, 'Pune'),
(8, 'Pooja', 'HR', 40000, 'Delhi');

select name from employee where salary > (select salary from employee where salary = 40000);

select name from employee where salary < (select avg(salary) from employee);

select name from employee where salary = (select max(salary) from employee);

select name from employee where salary = (select min(salary) from employee);

select name  from employee where department = (select department from employee where name = 'amit');

select name from employee where department in (select department from employee where salary > 45000);

select name from employee where salary > all (select salary from employee where department = 'hr');

select name from employee where salary > any (select salary from employee where department = 'sales');

select department from employee
group by department
having avg(salary) > (select avg(salary) from employee);

select name from employee where department not in (select department from employee where department = 'IT');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price INT,
    Quantity INT,
    Brand VARCHAR(50),
    City VARCHAR(50),
    Status VARCHAR(20)
);
INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 55000, 10, 'HP', 'Delhi', 'Available'),
(2, 'Mouse', 'Accessories', 500, 50, 'Dell', 'Delhi', 'Available'),
(3, 'Keyboard', 'Accessories', 1200, 30, 'HP', 'Noida', 'Available'),
(4, 'Monitor', 'Electronics', 12000, 15, 'Dell', 'Noida', 'Available'),
(5, 'Mobile', 'Electronics', 25000, 20, 'Samsung', 'Delhi', 'Available'),
(6, 'Headphones', 'Accessories', 2000, 40, 'Sony', 'Gurgaon', 'Available'),
(7, 'Tablet', 'Electronics', 30000, 12, 'Samsung', 'Noida', 'Available'),
(8, 'Printer', 'Electronics', 15000, 8, 'HP', 'Gurgaon', 'Available'),
(9, 'USB Cable', 'Accessories', 300, 100, 'Dell', 'Delhi', 'Available'),
(10, 'Smart Watch', 'Electronics', 8000, 25, 'Samsung', 'Noida', 'Available'),
(11, 'Webcam', 'Accessories', 2500, 18, 'Sony', 'Gurgaon', 'Available'),
(12, 'Speaker', 'Accessories', 3500, 22, 'Sony', 'Delhi', 'Available'),
(13, 'Camera', 'Electronics', 40000, 5, 'Canon', 'Noida', 'Available'),
(14, 'Power Bank', 'Accessories', 1800, 35, 'Samsung', 'Delhi', 'Available'),
(15, 'Scanner', 'Electronics', 10000, 7, 'Canon', 'Gurgaon', 'Unavailable');

select productname from products p1 where price < ( select avg(price) from products p2 where  p2.category = p1.category);

select productname from products p1 where price  = ( select avg(price) from products p2 where  p2.category = p1.category);

select productname from products p1 where quantity  = ( select max(quantity) from products p2 where  p2.brand = p1.brand);

select productname from products p1 where price >  any( select price from products p2 where  p2.category = p1.category);

select productname from products p1 where price >  all( select price from products p2 where  p2.category = p1.category);

CREATE TABLE Patients (

    PatientID INT PRIMARY KEY,

    PatientName VARCHAR(50),

    Age INT,

    Gender VARCHAR(10),

    City VARCHAR(50),

    Disease VARCHAR(50),

    BillAmount DECIMAL(10,2)

);
 
CREATE TABLE Doctors (

    DoctorID INT PRIMARY KEY,

    DoctorName VARCHAR(50),

    Specialization VARCHAR(50),

    Salary DECIMAL(10,2),

    City VARCHAR(50)

);
 
CREATE TABLE Treatments (

    TreatmentID INT PRIMARY KEY,

    PatientID INT,

    DoctorID INT,

    TreatmentName VARCHAR(50),

    TreatmentCost DECIMAL(10,2),

    TreatmentDate DATE

);
 



select patientname, billamount
from patients
where billamount > (select avg(billamount) from patients);




select doctorname
from doctors d
where not exists (
    select 1
    from treatments t
    where t.doctorid = d.doctorid
);




select max(salary)
from doctors
where salary < (select max(salary) from doctors);




select patientname
from patients
where patientid in (
    select patientid
    from treatments
    where doctorid in (
        select doctorid
        from doctors
        where specialization = 'cardiology'
    )
);




select doctorname, salary
from doctors
where salary > all (
    select salary
    from doctors
    where city = 'mumbai'
);




select patientname, city, billamount
from patients p1
where billamount > (
    select avg(billamount)
    from patients p2
    where p2.city = p1.city
);




select patientname
from patients p
where not exists (
    select 1
    from treatments t
    where t.patientid = p.patientid
    and t.treatmentcost > 5000
);




select doctorname, salary
from doctors
where salary > any (
    select salary
    from doctors
    where city = 'delhi'
);




select doctorname
from doctors d
where doctorid in (
    select doctorid
    from treatments
    group by doctorid
    having count(distinct patientid) >= all (
        select count(distinct patientid)
        from treatments
        group by doctorid
    )
);




select p.patientname
from patients p
where (
    select sum(t.treatmentcost)
    from treatments t
    where t.patientid = p.patientid
) > (
    select avg(treatmentcost)
    from treatments
);