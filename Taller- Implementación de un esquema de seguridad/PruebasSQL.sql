-- PRUEBAS --

-- Insertar pacientes, doctores y citas
INSERT INTO patients(name, lastname, birthdate, email, address, telephone) VALUES 
('Miriam','Cabello Lara','2000-02-12','miricabellolara@gmail.com','Calle 12 #20-12','8282717132'), 
('Leonidas', 'Tovar Tamallo', '1962-02-27','leotovartamallo@gmail.com','Carrera 8 #10-21', '9181818912'),
('Juan Camilo','Mora Lima','1999-05-01', 'juancamimoralima@gmail.com','Calle 3 #1-50','0094411222132');

INSERT INTO doctors(name, lastname, email, speciality, telephone) VALUES
('Luna','Montenegro Diez','lunamontenegro@hospital.com','Neurocirujano','3211192822'),
('Jhon Alex','Méndez Medina','jhonmendezmedina@hospital.com','Urología','9288273737'),
('Marlon','Quintero López','marlonquinterol@hospital.com','Medicina General','838737721');

INSERT INTO appointments(date, state, patient_id, doctor_id) VALUES
('2025-10-05','Asistida',1, 2),
('2025-10-05','Cancelada', 2, 3),
('2025-12-06','Programada', 3, 1);

-- Tratar de eliminar paciente con cita activa 
DELETE FROM patients WHERE id=3;
SELECT*FROM patients WHERE id=3;

-- Actualizar estado de la cita de Programada a Asistida
UPDATE appointments SET state= 'Asistida' WHERE id=3;
SELECT*FROM appointments WHERE id=3;

-- Tabla auditoria 
SELECT*FROM audits;