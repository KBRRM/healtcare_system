DROP database healthcaresystem;

CREATE DATABASE IF NOT EXISTS HealthCareSystem;
USE HealthCareSystem;

CREATE TABLE Patient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    City Varchar(15),
    ContactNumber VARCHAR(15)
);

CREATE TABLE Doctor (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Specialization VARCHAR(255),
    ContactNumber VARCHAR(15),
    Salary INT
);

CREATE TABLE Nurse (
    NurseID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Department VARCHAR(255),
    ContactNumber VARCHAR(15)
);

CREATE TABLE Appointment (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE ,
    Time TIME ,
    Location VARCHAR(255),
    PatientID INT,
    DoctorID INT,
    NurseID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID), 
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (NurseID) REFERENCES Nurse(NurseID)
);


CREATE TABLE MedicalRecord (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE ,
    Diagnosis VARCHAR(255),
    Prescription VARCHAR(255),
    PatientID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

SHOW tables;

Describe patient;

DROP TABLE patient;

SELECT * FROM patient LIMIT 10;

SELECT * FROM doctor;

SELECT * FROM nurse;

SELECT * FROM appointment;

SELECT * FROM medicalrecord;

Select Count(Name) from patient;
SELECT COUNT(DISTINCT City) AS DistinctCityCount FROM patient;

SELECT sum(Salary) AS TotalPAYSALARY from doctor;
SELECT Name, City from Patient;

ALTER TABLE patient
ADD COLUMN Age INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE patient
SET Age = TIMESTAMPDIFF(YEAR, DateOfBirth, CURRENT_DATE());

SELECT upper(Name), Age, City FROM Patient Where Age<30; 

SELECT * FROM Patient Where
City in ('Raipur', 'Hazaribagh', 'Delhi')
Order by City;

Select Gender, avg(Age) as AverageAge From Patient
group by Gender;


select * From doctor Where Salary between 50000 and 100000 order by Salary DESC;


INSERT INTO Patient (PatientID, Name, DateOfBirth, Gender, ContactNumber)
VALUES (155,'Palak Kumari', '1990-05-15', 'Female', '+912288929293');

INSERT INTO Patient (Name, DateOfBirth, Gender, ContactNumber)
VALUES ('Sachin Kumar', '1990-05-15', 'Male', '+911234567890');

INSERT INTO doctor(Name, Specialization, ContactNumber)
values ('Rahul','Kidney Specialist', '+919638527410');

INSERT INTO nurse(Name, Department, ContactNumber)
values ('Pinki','Nephrologist', '+919638512310');

-- Foreign Key 
INSERT INTO Appointment (Date, Time, Location, PatientID, DoctorID, NurseID)
VALUES (CURRENT_DATE,CURRENT_TIME,'Hospital B', 1, 1, 1);

INSERT INTO MedicalRecord (Diagnosis, Prescription, PatientID, Date)
VALUES ('Some diagnosis', 'Some prescription', 1, CURRENT_DATE);

select* from appointment;
select * from Doctor;
