CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'doctor';
CREATE ROLE IF NOT EXISTS 'receptionist';
CREATE ROLE IF NOT EXISTS 'audit';

-- Asignar privilegios segun el rol
GRANT ALL PRIVILEGES ON HospitalCare.* TO 'admin';

GRANT SELECT ON HospitalCare.patients TO 'doctor';
GRANT SELECT, INSERT, UPDATE ON HospitalCare.medical_history TO 'doctor';
GRANT SELECT, INSERT, UPDATE ON HospitalCare.appointments TO 'doctor';

GRANT SELECT, INSERT, UPDATE ON HospitalCare.patients TO 'receptionist';
GRANT SELECT, INSERT, UPDATE ON HospitalCare.appointments TO 'receptionist';

GRANT SELECT ON HospitalCare.* TO 'audit';

-- Crear unuario de sistema
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'Admin123';
CREATE USER IF NOT EXISTS 'doctor'@'localhost' IDENTIFIED BY 'Doctor123';
CREATE USER IF NOT EXISTS 'receptionist'@'localhost' IDENTIFIED BY 'Receptionist';
CREATE USER IF NOT EXISTS 'audit'@'localhost' IDENTIFIED BY 'Audit123';

-- Asignación de roles
GRANT 'admin' TO 'admin'@'localhost';
GRANT 'doctor' TO 'admin'@'localhost';
GRANT 'receptionist' TO 'admin'@'localhost';
GRANT 'audit' TO 'admin'@'localhost';