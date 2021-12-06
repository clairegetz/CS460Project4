CREATE TABLE License (
       licenseNo VARCHAR(20) NOT NULL,
       issueDate DATE,  -- need to change
       expireDate DATE AS add_months(issueDate, 144)),
       class VARCHAR(3) NOT NULL,
       customerID INT NOT NULL,
       deptID INT NOT NULL,
       PRIMARY KEY(licenseNo),
       FOREIGN KEY(customerID) REFERENCES Customer(customerID),
       FOREIGN KEY(deptID) REFERENCES Department(deptID)
);
	
