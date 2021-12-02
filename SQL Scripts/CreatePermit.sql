CREATE TABLE Permit (
       permitNo VARCHAR(20) NOT NULL,
       issueDate DATE,  -- need to change
       expireDate DATE, -- need to change
       class VARCHAR(3) NOT NULL,
       customerID INT NOT NULL,
       deptID INT NOT NULL,
       PRIMARY KEY(permitNo),
       FOREIGN KEY(customerID) REFERENCES Customer(customerID),
       FOREIGN KEY(deptID) REFERENCES Department(deptID)
);
	
