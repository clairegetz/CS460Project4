--prevents appointments that overlap
CREATE OR REPLACE TRIGGER no_overlap
BEFORE UPDATE OR INSERT ON Appointment
FOR EACH ROW
DECLARE apptCount NUMBER;
BEGIN
	SELECT COUNT(*) INTO apptCount
	FROM Appointment
	WHERE customerID = :new.customerID
	AND apptTime = :new.apptTime;
IF apptCount >= 1
    THEN RAISE_APPLICATION_ERROR(-20002, 'APPOINTMENT CONFLICT FOR THIS USER');
END IF;
END;
/
	
