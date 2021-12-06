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

--customers cannot have two of any ID
CREATE OR REPLACE TRIGGER no_two_permits
BEFORE UPDATE OR INSERT ON Permit
FOR EACH ROW
DECLARE customerCount NUMBER;
BEGIN
    SELECT COUNT(*) INTO customerCount
    FROM Permit
    WHERE customerID = :new.customerID
IF customerCount >= 1
    THEN RAISE_APPLICATION_ERROR(-20002, 'USER ALREADY HAS A PERMIT');
END IF;
END;
/

CREATE OR REPLACE TRIGGER no_two_license
BEFORE UPDATE OR INSERT ON License
FOR EACH ROW
DECLARE customerCount NUMBER;
BEGIN
    SELECT COUNT(*) INTO customerCount
    FROM License
    WHERE customerID = :new.customerID
IF customerCount >= 1
    THEN RAISE_APPLICATION_ERROR(-20002, 'USER ALREADY HAS A LICENSE');
END IF;
END;
/

CREATE OR REPLACE TRIGGER no_two_StateIDs
BEFORE UPDATE OR INSERT ON StateID
FOR EACH ROW
DECLARE customerCount NUMBER;
BEGIN
    SELECT COUNT(*) INTO customerCount
    FROM StateID
    WHERE customerID = :new.customerID
IF customerCount >= 1
    THEN RAISE_APPLICATION_ERROR(-20002, 'USER ALREADY HAS A STATEID');
END IF;
END;
/

--a VIN uniquely identifies a car, so a VIN should no appear twice
CREATE OR REPLACE TRIGGER no_two_VINs
BEFORE UPDATE OR INSERT ON Registration
FOR EACH ROW
DECLARE customerCount NUMBER;
BEGIN
    SELECT COUNT(*) INTO customerCount
    FROM Registration
    WHERE customerID = :new.customerID
IF customerCount >= 1
    THEN RAISE_APPLICATION_ERROR(-20002, 'THIS VEHICLE IS ALREADY REGISTERED');
END IF;
END;
/