CREATE DATABASE HospitalDB;
 
USE HospitalDB;
 
CREATE TABLE Patients (

    Patient_ID INT PRIMARY KEY,

    Patient_Name VARCHAR(50),

    Age INT,

    Gender VARCHAR(10),

    City VARCHAR(50),

    Disease VARCHAR(50),

    Admission_Date DATE,

    Referred_By INT

);
 
INSERT INTO Patients VALUES

(1, 'Rahul', 35, 'Male', 'Delhi', 'Diabetes', '2026-01-10', NULL),

(2, 'Priya', 28, 'Female', 'Noida', 'Fever', '2026-01-12', 1),

(3, 'Amit', 45, 'Male', 'Delhi', 'Heart Disease', '2026-01-15', 1),

(4, 'Neha', 32, 'Female', 'Gurgaon', 'Migraine', '2026-01-18', 2),

(5, 'Rohit', 50, 'Male', 'Delhi', 'Diabetes', '2026-01-20', 3),

(6, 'Sneha', 25, 'Female', 'Noida', 'Fever', '2026-02-01', 2),

(7, 'Vikas', 40, 'Male', 'Gurgaon', 'Heart Disease', '2026-02-05', 3),

(8, 'Anjali', 30, 'Female', 'Delhi', 'Migraine', '2026-02-10', 4),

(9, 'Karan', 55, 'Male', 'Noida', 'Diabetes', '2026-02-15', 5),

(10, 'Pooja', 27, 'Female', 'Delhi', 'Fever', '2026-02-20', 6);
 
CREATE TABLE Treatments (

    Treatment_ID INT PRIMARY KEY,

    Patient_ID INT,

    Treatment_Name VARCHAR(50),

    Doctor_Name VARCHAR(50),

    Treatment_Cost DECIMAL(10,2),

    Treatment_Date DATE,

    Status VARCHAR(20),

    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)

);
 
INSERT INTO Treatments VALUES

(101, 1, 'Blood Test', 'Dr Sharma', 1500, '2026-01-11', 'Completed'),

(102, 1, 'Insulin Therapy', 'Dr Mehta', 5000, '2026-01-15', 'Completed'),

(103, 2, 'General Checkup', 'Dr Gupta', 1000, '2026-01-13', 'Completed'),

(104, 2, 'Medicine', 'Dr Gupta', 500, '2026-01-14', 'Completed'),

(105, 3, 'ECG', 'Dr Sharma', 2500, '2026-01-16', 'Completed'),

(106, 3, 'Heart Surgery', 'Dr Verma', 50000, '2026-01-20', 'Completed'),

(107, 4, 'MRI Scan', 'Dr Khan', 8000, '2026-01-19', 'Completed'),

(108, 5, 'Blood Test', 'Dr Mehta', 1500, '2026-01-21', 'Completed'),

(109, 5, 'Insulin Therapy', 'Dr Mehta', 5000, '2026-01-25', 'Pending'),

(110, 6, 'General Checkup', 'Dr Gupta', 1000, '2026-02-02', 'Completed'),

(111, 6, 'Medicine', 'Dr Gupta', 700, '2026-02-03', 'Completed'),

(112, 7, 'ECG', 'Dr Sharma', 2500, '2026-02-06', 'Pending'),

(113, 7, 'Heart Surgery', 'Dr Verma', 60000, '2026-02-10', 'Completed'),

(114, 8, 'MRI Scan', 'Dr Khan', 8000, '2026-02-11', 'Completed'),

(115, 9, 'Blood Test', 'Dr Mehta', 1500, '2026-02-16', 'Completed'),

(116, 9, 'Insulin Therapy', 'Dr Mehta', 5000, '2026-02-18', 'Pending'),

(117, 10, 'General Checkup', 'Dr Gupta', 1000, '2026-02-21', 'Completed'),

(118, 10, 'Medicine', 'Dr Gupta', 500, '2026-02-22', 'Completed'),

(119, 3, 'Follow Up', 'Dr Verma', 2000, '2026-02-25', 'Pending'),

(120, 1, 'Follow Up', 'Dr Mehta', 1200, '2026-02-26', 'Completed');
 
 
select p.patient_name, t.*
from patients p
inner join treatments t
on p.patient_id = t.patient_id;

select p.*, t.*
from patients p
right join treatments t
on p.patient_id = t.patient_id;

select p1.patient_name as patient_name,
       p2.patient_name as referred_by
from patients p1
join patients p2
on p1.referred_by = p2.patient_id;

select p.*, t.*
from patients p
cross join treatments t;

select p.patient_id, p.patient_name,
       count(t.treatment_id) as total_treatments
from patients p
inner join treatments t
on p.patient_id = t.patient_id
group by p.patient_id, p.patient_name;

select disease, count(patient_id) as total_patients
from patients
group by disease
having count(patient_id) > 2;

select p.patient_id, p.patient_name,
       count(t.treatment_id) as total_treatments
from patients p
inner join treatments t
on p.patient_id = t.patient_id
group by p.patient_id, p.patient_name
having count(t.treatment_id) > 2;

select p.patient_id, p.patient_name,
       sum(t.treatment_cost) as total_spent
from patients p
inner join treatments t
on p.patient_id = t.patient_id
group by p.patient_id, p.patient_name
having sum(t.treatment_cost) > 10000;

select doctor_name,
       sum(treatment_cost) as total_revenue
from treatments
group by doctor_name
order by total_revenue desc
limit 1;

select p.patient_id, p.patient_name
from patients p
inner join treatments t
on p.patient_id = t.patient_id
where t.treatment_name in ('Blood Test', 'Insulin Therapy')
group by p.patient_id, p.patient_name
having count(distinct t.treatment_name) = 2;

select distinct p.patient_id, p.patient_name
from patients p
inner join treatments t
on p.patient_id = t.patient_id
where p.admission_date between '2026-01-01' and '2026-01-31'
and t.treatment_date between '2026-02-01' and '2026-02-28';

select distinct treatment_cost
from treatments
order by treatment_cost desc
limit 1 offset 1;

select disease, count(patient_id) as total_patients
from patients
group by disease
order by total_patients desc
limit 3;

select doctor_name,
       count(distinct patient_id) as total_patients
from treatments
group by doctor_name
having count(distinct patient_id) > 2;

select p.patient_id, p.patient_name,
       count(p2.patient_id) as total_referred
from patients p
join patients p2
on p.patient_id = p2.referred_by
group by p.patient_id, p.patient_name
having count(p2.patient_id) >= 2;