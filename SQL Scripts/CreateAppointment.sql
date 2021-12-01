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
	
