create database JavaProject;
use JavaProject;

-- Table for Authentication
CREATE TABLE Authenticate (
    email_id VARCHAR(30) PRIMARY KEY,
    password VARCHAR(30) NOT NULL,
    role CHAR(30) UNIQUE
);

-- Table for Admin
CREATE TABLE Admin (
    admin_id INT PRIMARY KEY NOT NULL,
    admin_name VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    email_address VARCHAR(30) NOT NULL,
    password VARCHAR(20) NOT NULL,
    contact_no VARCHAR(12) NOT NULL
);

-- Table for Doctor
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY NOT NULL,
    doctor_name VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    email_address VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    education VARCHAR(30) NOT NULL,
    specialization VARCHAR(30) NOT NULL,
    working_days VARCHAR(30) NOT NULL
);

-- Table for Patient
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY NOT NULL,
    patient_name VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    email_address VARCHAR(30) NOT NULL,
    password VARCHAR(20) NOT NULL,
    contact_num VARCHAR(20) NOT NULL,
    aadhar_num VARCHAR(12) UNIQUE NOT NULL,
    address VARCHAR(35) NOT NULL,
    disease VARCHAR(35) NOT NULL,
    appointment_date DATE NOT NULL,
    age INT NOT NULL
);

-- Table for Receptionist
CREATE TABLE Receptionist (
    receptionist_id INT PRIMARY KEY NOT NULL,
    receptionist_name VARCHAR(30) NOT NULL,
    email_address VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    contact_no VARCHAR(12) NOT NULL,
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE
);

-- Table for Record
CREATE TABLE Record (
    record_id INT PRIMARY KEY NOT NULL,
    patient_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_status VARCHAR(30) NOT NULL,
    doctor_id INT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE
);

-- Table for Medical Report
CREATE TABLE MedicalReport (
    report_id INT PRIMARY KEY NOT NULL,
    patient_id INT NOT NULL,
    medicine_name INT NOT NULL,
    quantity INT NOT NULL,
    doctor_id INT,
    no_of_days INT,
    date DATE NOT NULL,
    dosage VARCHAR(30) NOT NULL,
    tests VARCHAR(30) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE
);