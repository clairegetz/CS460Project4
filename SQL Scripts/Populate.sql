-- Insert for Department
INSERT INTO Department(deptID, deptName) VALUES (1, 'Permit');
INSERT INTO Department(deptID, deptName) VALUES (2, 'License');
INSERT INTO Department(deptID, deptName) VALUES (3, 'Vehicle Registration');
INSERT INTO Department(deptID, deptName) VALUES (4, 'StateID');

-- Insert for Jobs
INSERT INTO Job(jobID, title, salary) VALUES (1, 'Supervisor', 55000);
INSERT INTO Job(jobID, title, salary) VALUES (2, 'Front Desk', 40000);
INSERT INTO Job(jobID, title, salary) VALUES (3, 'Security', 45000);
INSERT INTO Job(jobID, title, salary) VALUES (4, 'Clerk', 45000);

-- Insert for Employee
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (11, 'Harper', 'Pacheco', 1, 1);
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (12, 'Carl', 'Sims', 2, 1);
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (13, 'Heidi', 'Klein', 3, 1);
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (14, 'Ali', 'Coleman', 4, 1);

INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (21, 'Iris', 'Stanley', 1, 2);
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (22, 'Maisie', 'Ayers', 2, 2);
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (23, 'Coby', 'Frank', 3, 2);
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (24, 'Asher', 'Sims', 4, 2);

INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (31, 'Drake', 'Coffey', 1, 3);
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (32, 'Vernon', 'Sargent', 2, 3);
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (33, 'Stacy', 'Mccullough', 3, 3);
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (34, 'Molly', 'Graves', 4, 3);

INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (41, 'Brody', 'Lawrence', 1, 4);
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (42, 'Gloria', 'Mccarty', 2, 4);
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (43, 'Steel', 'Dominguez', 3, 4);
INSERT INTO Employee(employeeID, firstName, lastName, jobID, deptID)
VALUES (44, 'Philip', 'Martinez', 4, 4);

-- Insert for Customer
INSERT INTO Customer(customerID, firstName, lastName, address, dateOfBorth)
VALUES (01, 'Hyatt', 'Rosario', 'address 1, Tucson, AZ', DATE '1985-11-29');
INSERT INTO Customer(customerID, firstName, lastName, address, dateOfBorth)
VALUES (02, 'Nerea', 'Moody', 'address 2, Tucson, AZ', DATE '1980-09-17');
INSERT INTO Customer(customerID, firstName, lastName, address, dateOfBorth)
VALUES (03, 'Nelle', 'Lee', 'address 3, Tucson, AZ', DATE '1938-09-18');
INSERT INTO Customer(customerID, firstName, lastName, address, dateOfBorth)
VALUES (04, 'Winifred', 'Bullock', 'address 4, Tucson, AZ', DATE '1954-04-08');
INSERT INTO Customer(customerID, firstName, lastName, address, dateOfBorth)
VALUES (05, 'Ariel', 'Hickman', 'address 5, Tucson, AZ', DATE '1987-07-03');
INSERT INTO Customer(customerID, firstName, lastName, address, dateOfBorth)
VALUES (06, 'Yuri', 'Hamilton', 'address 6, Tucson, AZ', DATE '1956-12-03');

-- Insert for Appointment
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (1, timestamp '2020-12-01 00:00:00', 1, NULL, NULL, 4, 01, 44);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (2, timestamp '2020-11-20 00:00:00', 0, NULL, NULL, 3, 01, 31);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (3, timestamp '2020-11-01 00:00:00', 1, NULL, NULL, 2, 01, 24);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (4, timestamp '2021-01-01 00:00:00', 0, NULL, NULL, 1, 02, 11);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (5, timestamp '2021-06-01 00:00:00', 1, NULL, NULL, 4, 03, 44);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (6, timestamp '2021-10-01 00:00:00', 0, NULL, NULL, 3, 02, 34);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (7, timestamp '2021-11-01 16:00:00', 0, NULL, NULL, 2, 04, 24);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (8, timestamp '2021-11-07 14:00:00', 1, NULL, NULL, 1, 06, 11);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (9, timestamp '2021-11-15 09:00:00', 1, NULL, NULL, 4, 05, 44);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (10, timestamp '2021-11-22 16:00:00', 0, NULL, NULL, 3, 04, 31);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (11, timestamp '2021-11-27 14:00:00', 0, NULL, NULL, 2, 06, 24);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (12, timestamp '2021-11-30 09:00:00', 1, NULL, NULL, 1, 05, 14);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (13, timestamp '2021-12-01 00:00:00', 1, NULL, NULL, 4, 03, 41);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (14, timestamp '2022-11-20 00:00:00', 0, NULL, NULL, 3, 01, 31);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (15, timestamp '2022-12-01 00:00:00', 1, NULL, NULL, 2, 01, 21);

-- Insert for Permit
INSERT INTO Permit(permitNo, issueDate, expireDate, class, customerID, deptID)
VALUES ('P11111111', DATE '2020-01-22', DATE '2060-01-22','A', 03, 1);
INSERT INTO Permit(permitNo, issueDate, expireDate, class, customerID, deptID)
VALUES ('P22222222', DATE '2011-04-19', DATE '2025-04-19','D', 04, 1);
INSERT INTO Permit(permitNo, issueDate, expireDate, class, customerID, deptID)
VALUES ('P33333333', DATE '2016-06-16', DATE '2033-06-16','M', 05, 1);
INSERT INTO Permit(permitNo, issueDate, expireDate, class, customerID, deptID)
VALUES ('P44444444', DATE '2018-02-06', DATE '2030-02-06','D', 06, 1);

-- Insert for License
INSERT INTO License(licenseNo, issueDate, expireDate, class, customerID, deptID)
VALUES ('D11111111', DATE '2020-01-22', DATE '2060-01-22', 'D', 01, 2);
INSERT INTO License(licenseNo, issueDate, expireDate, class, customerID, deptID)
VALUES ('D22222222', DATE '2011-04-19', DATE '2025-04-19', 'C', 02, 2);
INSERT INTO License(licenseNo, issueDate, expireDate, class, customerID, deptID)
VALUES ('D33333333', DATE '2016-06-16', DATE '2033-06-16', 'A', 03, 2);
INSERT INTO License(licenseNo, issueDate, expireDate, class, customerID, deptID)
VALUES ('D44444444', DATE '2018-02-06', DATE '2030-02-06', 'D', 04, 2);
INSERT INTO License(licenseNo, issueDate, expireDate, class, customerID, deptID)
VALUES ('D55555555', DATE '2011-05-28', DATE '2066-05-28', 'C', 05, 2);
INSERT INTO License(licenseNo, issueDate, expireDate, class, customerID, deptID)
VALUES ('D66666666', DATE '2000-08-20', DATE '2022-08-20', 'D', 06, 2);

-- Insert for Registration
INSERT INTO Registration(licensePlateNo, issueDate, expireDate, VIN, customerID, deptID)
VALUES ('R1111R', DATE '2020-01-22', DATE '2060-01-22', 'VIN11111111111111', 03, 3);
INSERT INTO Registration(licensePlateNo, issueDate, expireDate, VIN, customerID, deptID)
VALUES ('R2222R', DATE '2011-04-19', DATE '2025-04-19', 'VIN22222222222222', 04, 3);
INSERT INTO Registration(licensePlateNo, issueDate, expireDate, VIN, customerID, deptID)
VALUES ('R3333R', DATE '2016-06-16', DATE '2033-06-16', 'VIN33333333333333', 05, 3);
INSERT INTO Registration(licensePlateNo, issueDate, expireDate, VIN, customerID, deptID)
VALUES ('R4444R', DATE '2018-02-06', DATE '2030-02-06', 'VIN44444444444444', 06, 3);
INSERT INTO Registration(licensePlateNo, issueDate, expireDate, VIN, customerID, deptID)
VALUES ('R5555R', DATE '2016-06-16', DATE '2033-06-16', 'VIN55555555555555', 05, 3);
INSERT INTO Registration(licensePlateNo, issueDate, expireDate, VIN, customerID, deptID)
VALUES ('R6666R', DATE '2018-02-06', DATE '2030-02-06', 'VIN66666666666666', 06, 3);

-- Insert for StateID
INSERT INTO StateID(stateIDNo, issueDate, expireDate, customerID, deptID)
VALUES ('S11111111', DATE '2020-01-22', DATE '2060-01-22', 01, 4);
INSERT INTO StateID(stateIDNo, issueDate, expireDate, customerID, deptID)
VALUES ('S22222222', DATE '2011-04-19', DATE '2025-04-19', 02, 4);
INSERT INTO StateID(stateIDNo, issueDate, expireDate, customerID, deptID)
VALUES ('S33333333', DATE '2016-06-16', DATE '2033-06-16', 03, 4);
INSERT INTO StateID(stateIDNo, issueDate, expireDate, customerID, deptID)
VALUES ('S44444444', DATE '2018-02-06', DATE '2030-02-06', 04, 4);