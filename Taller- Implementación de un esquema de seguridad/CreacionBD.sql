DROP DATABASE IF EXISTS HospitalCare;
CREATE DATABASE HospitalCare;
USE HospitalCare;

CREATE TABLE patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL, 
    lastname VARCHAR(50) NOT NULL,
    birthdate DATE,
    email VARCHAR(100),
    address VARCHAR(100),
    telephone VARCHAR(15),
    state BOOLEAN DEFAULT TRUE
);

CREATE TABLE doctors(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    speciality VARCHAR(100),
    telephone VARCHAR(15),
    state BOOLEAN DEFAULT TRUE
);

CREATE TABLE audits (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_register INT,
    accion VARCHAR(50) NOT NULL,
    affected_table VARCHAR(100),
    responsible_user VARCHAR(100),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    detail TEXT
);

CREATE TABLE appointments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    state ENUM ('Programada','Cancelada','Asistida') DEFAULT 'Programada',
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (doctor_id) REFERENCES doctors (id)
);

CREATE TABLE treatments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    worth DECIMAL(10,3),
    appointment_id INT NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES appointments(id)
);

CREATE TABLE medical_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE DEFAULT (CURRENT_DATE),
    diagnostic TEXT,
    treatments TEXT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);



