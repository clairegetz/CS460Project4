CREATE TABLE StateID (
       stateIDNo VARCHAR(20) NOT NULL,
       issueDate DATE,  -- need to change
       expireDate DATE AS add_months(issueDate, 240)),
       customerID INT NOT NULL,
       deptID INT NOT NULL,
       PRIMARY KEY(stateIDNo),
       FOREIGN KEY(customerID) REFERENCES Customer(customerID),
       FOREIGN KEY(deptID) REFERENCES Department(deptID)
);
	
