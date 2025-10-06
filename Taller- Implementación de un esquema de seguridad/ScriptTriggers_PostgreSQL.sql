-- Inserción de pacientes 
DELIMITER 	//
CREATE TRIGGER tgr_audit_insert_patient
AFTER INSERT ON patients
FOR EACH ROW
BEGIN 
    INSERT INTO audits(id_register, accion, affected_table, responsible_user, detail)
    Values (New.id, 'INSERT', 'patients', CURRENT_USER(),
    CONCAT ('¡Paciente registrado con exito! ', NEW.name,' ', NEW.lastname));
END;
//DELIMITER ;

DELIMITER //
-- Actualización de citas
CREATE TRIGGER tgr_audit_update_appointment
AFTER UPDATE ON appointments
FOR EACH ROW
BEGIN 
    INSERT INTO audits(id_register, accion, affected_table, responsible_user, detail)
    Values (NEW.id, 'UPDATE', 'appointments', CURRENT_USER(),
    CONCAT ('Estado anterior: ', OLD.state, '- Nuevo estado: ', NEW.state));
END;
//DELIMITER ;

DELIMITER //
-- Eliminación de tratamientos
CREATE TRIGGER tgr_audit_delete_treatments
AFTER UPDATE ON treatments
FOR EACH ROW
BEGIN 
    INSERT INTO audits(id_register, accion, affected_table, responsible_user, detail)
    Values (OLD.id, 'DELETE', 'treatments', CURRENT_USER(),
    CONCAT ('¡Tratamiento eliminado! '));
END;
//DELIMITER ;

DELIMITER //
-- Desactivas pacientes
CREATE TRIGGER tgr_audit_delete_patient
BEFORE DELETE ON patients
FOR EACH ROW
BEGIN 
    INSERT INTO audits(id_register, accion, affected_table, responsible_user, detail)
    Values (OLD.id, 'DELETE', 'patients', CURRENT_USER(),
    CONCAT ('¡Paciente eliminado! ', OLD.name, ' ', OLD.lastname));
END;
//DELIMITER ;

DELIMITER //
-- No eliminación de pacientes con citas activas 
CREATE TRIGGER tgr_validate_delete_patient
BEFORE DELETE ON patients
FOR EACH ROW
BEGIN 
    DECLARE active_appointment INT;
    SELECT COUNT(*) INTO active_appointment
    FROM appointments
    WHERE patient_id=OLD.id AND state= 'Programada';
    IF active_appointment>0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT=
    'No se puede eliminar el paciente porque tiene una cita pendiente';
    END IF;
END;
//DELIMITER ;
    