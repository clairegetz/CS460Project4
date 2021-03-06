CREATE TABLE Registration (
       licensePlateNo VARCHAR(10) NOT NULL,
       issueDate DATE,  -- need to change
       expireDate DATE AS (add_months(issueDate, 12)),
       VIN VARCHAR(20) NOT NULL,
       customerID INT NOT NULL,
       deptID INT NOT NULL,
       PRIMARY KEY(licensePlateNo),
       FOREIGN KEY(customerID) REFERENCES Customer(customerID),
       FOREIGN KEY(deptID) REFERENCES Department(deptID)
);
	
