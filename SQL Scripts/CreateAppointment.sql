CREATE TABLE Appointment (
       apptID INT NOT NULL,
       apptTime TIMESTAMP NOT NULL,
       apptSuccessful NUMBER(1,0),
       apptType VARCHAR(15),
       fee INT CHECK(fee > 0),
       deptID INT NOT NULL,
       customerID INT NOT NULL,
       employeeID INT NOT NULL,
       PRIMARY KEY(apptID),
       FOREIGN KEY(deptID) REFERENCES Department(deptID),
       FOREIGN KEY(customerID) REFERENCES Customer(customerID),
       FOREIGN KEY(employeeID) REFERENCES Employee(employeeID)
);

--prevents appointments that overlap
--CREATE TRIGGER no_overlap
--BEFORE INSERT ON Appointment
--FOR EACH ROW
--DECLARE apptCount NUMBER;
--BEGIN
--	SELECT COUNT(*) INTO apptCount
--	FROM Appointments
--	WHERE userID = new.userID
--	AND apptDate = new.apptDate
--	AND apptTime = new.apptTime
--IF: apptCount > 1
--    THEN RAISE_APPLICATION_ERROR(-20002, 'APPOINTMENT CONFLICT FOR THIS USER');
--END IF;
--END;
--/
	
