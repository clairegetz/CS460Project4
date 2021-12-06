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
INSERT INTO Customer(customerID, firstName, lastName, address, dateOfBorth)
VALUES (07, 'Chandler', 'Biggs', 'address 7, Tucson, AZ', DATE '1990-11-29');
INSERT INTO Customer(customerID, firstName, lastName, address, dateOfBorth)
VALUES (08, 'Carson', 'Moody', 'address 8, Tucson, AZ', DATE '1993-09-17');
INSERT INTO Customer(customerID, firstName, lastName, address, dateOfBorth)
VALUES (09, 'Nellie', 'Lee', 'address 9, Tucson, AZ', DATE '1948-09-18');
INSERT INTO Customer(customerID, firstName, lastName, address, dateOfBorth)
VALUES (10, 'Fred', 'Banfield', 'address 10, Tucson, AZ', DATE '1989-04-08');
INSERT INTO Customer(customerID, firstName, lastName, address, dateOfBorth)
VALUES (11, 'Becky', 'Moore', 'address 11, Tucson, AZ', DATE '2004-07-03');
INSERT INTO Customer(customerID, firstName, lastName, address, dateOfBorth)
VALUES (12, 'Greg', 'Hamilton', 'address 12, Tucson, AZ', DATE '2002-12-03');

-- Insert for Appointment
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (1, timestamp '2020-12-01 00:00:00', 1, NULL, 4, 4, 01, 44);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (2, timestamp '2020-11-20 00:00:00', 0, NULL, 3, 3, 01, 31);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (3, timestamp '2020-11-01 00:00:00', 1, NULL, 2, 2, 01, 24);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (4, timestamp '2021-01-01 00:00:00', 0, NULL, 1, 1, 02, 11);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (5, timestamp '2021-06-01 00:00:00', 1, NULL, 4, 4, 03, 44);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (6, timestamp '2021-10-01 00:00:00', 0, NULL, 3, 3, 02, 34);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (7, timestamp '2021-11-01 16:00:00', 0, NULL, 2, 2, 04, 24);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (8, timestamp '2021-11-07 14:00:00', 1, NULL, 1, 1, 06, 11);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (9, timestamp '2021-11-15 09:00:00', 1, NULL, 4, 4, 05, 44);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (10, timestamp '2021-11-22 16:00:00', 0, NULL, 3, 3, 01, 31);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (11, timestamp '2021-11-27 14:00:00', 0, NULL, 2, 2, 04, 24);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (12, timestamp '2021-11-30 09:00:00', 1, NULL, 1, 1, 03, 14);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (13, timestamp '2021-12-01 00:00:00', 1, NULL, 4, 4, 03, 41);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (14, timestamp '2022-11-20 00:00:00', 0, NULL, 3, 3, 01, 31);
INSERT INTO Appointment(apptId, appttime, apptsuccessful, appttype, fee, deptid, customerid, employeeid)
VALUES (15, timestamp '2022-12-01 00:00:00', 1, NULL, 2, 2, 01, 21);

-- Insert for Permit
INSERT INTO Permit(permitNo, issueDate, class, customerID, deptID)
VALUES ('P00000001', DATE '1990-01-22','A', 03, 1);
INSERT INTO Permit(permitNo, issueDate, class, customerID, deptID)
VALUES ('P00000002', DATE '1995-04-19', 'D', 04, 1);
INSERT INTO Permit(permitNo, issueDate, class, customerID, deptID)
VALUES ('P00000003', DATE '1999-01-11', 'M', 05, 1);
INSERT INTO Permit(permitNo, issueDate, class, customerID, deptID)
VALUES ('P00000004', DATE '2001-02-06','D', 06, 1);
INSERT INTO Permit(permitNo, issueDate, class, customerID, deptID)
VALUES ('P00000005', DATE '2003-01-22','A', 01, 1);
INSERT INTO Permit(permitNo, issueDate, class, customerID, deptID)
VALUES ('P00000006', DATE '2008-04-19', 'D', 02, 1);
INSERT INTO Permit(permitNo, issueDate, class, customerID, deptID)
VALUES ('P00000007', DATE '2012-07-30', 'M', 07, 1);
INSERT INTO Permit(permitNo, issueDate, class, customerID, deptID)
VALUES ('P00000008', DATE '2015-02-06','D', 08, 1);
INSERT INTO Permit(permitNo, issueDate, class, customerID, deptID)
VALUES ('P00000009', DATE '2017-01-22','A', 09, 1);
INSERT INTO Permit(permitNo, issueDate, class, customerID, deptID)
VALUES ('P00000010', DATE '2019-04-29', 'D', 10, 1);
INSERT INTO Permit(permitNo, issueDate, class, customerID, deptID)
VALUES ('P00000011', DATE '2020-06-16', 'M', 11, 1);
INSERT INTO Permit(permitNo, issueDate, class, customerID, deptID)
VALUES ('P00000012', DATE '2021-02-06','D', 12, 1);

-- Insert for License
INSERT INTO License(licenseNo, issueDate, class, customerID, deptID)
VALUES ('D00000001', DATE '2020-01-22', 'D', 01, 2);
INSERT INTO License(licenseNo, issueDate, class, customerID, deptID)
VALUES ('D00000002', DATE '2011-04-19', 'C', 02, 2);
INSERT INTO License(licenseNo, issueDate, class, customerID, deptID)
VALUES ('D00000003', DATE '2016-06-16', 'A', 03, 2);
INSERT INTO License(licenseNo, issueDate, class, customerID, deptID)
VALUES ('D00000004', DATE '2018-02-06', 'D', 04, 2);
INSERT INTO License(licenseNo, issueDate, class, customerID, deptID)
VALUES ('D00000005', DATE '2011-05-28', 'C', 05, 2);
INSERT INTO License(licenseNo, issueDate,class, customerID, deptID)
VALUES ('D00000006', DATE '2020-08-20', 'D', 06, 2);
INSERT INTO License(licenseNo, issueDate, class, customerID, deptID)
VALUES ('D00000007', DATE '2021-06-16', 'A', 07, 2);
INSERT INTO License(licenseNo, issueDate, class, customerID, deptID)
VALUES ('D00000008', DATE '2021-02-06', 'D', 08, 2);
INSERT INTO License(licenseNo, issueDate, class, customerID, deptID)
VALUES ('D00000009', DATE '2011-05-28', 'C', 09, 2);
INSERT INTO License(licenseNo, issueDate,class, customerID, deptID)
VALUES ('D00000010', DATE '2000-08-20', 'D', 10, 2);

-- Insert for Registration
INSERT INTO Registration(licensePlateNo, issueDate, VIN, customerID, deptID)
VALUES ('R0001R', DATE '2020-12-22', 'VIN11111111111111', 03, 3);
INSERT INTO Registration(licensePlateNo, issueDate, VIN, customerID, deptID)
VALUES ('R0002R', DATE '2011-04-19', 'VIN22222222222222', 04, 3);
INSERT INTO Registration(licensePlateNo, issueDate, VIN, customerID, deptID)
VALUES ('R0003R', DATE '2021-06-16', 'VIN33333333333333', 05, 3);
INSERT INTO Registration(licensePlateNo, issueDate, VIN, customerID, deptID)
VALUES ('R0004R', DATE '2020-02-06', 'VIN44444444444444', 06, 3);
INSERT INTO Registration(licensePlateNo, issueDate, VIN, customerID, deptID)
VALUES ('R0005R', DATE '2021-06-16', 'VIN55555555555555', 01, 3);
INSERT INTO Registration(licensePlateNo, issueDate, VIN, customerID, deptID)
VALUES ('R0006R', DATE '2021-02-06', 'VIN66666666666666', 06, 3);
INSERT INTO Registration(licensePlateNo, issueDate, VIN, customerID, deptID)
VALUES ('R0007R', DATE '2021-01-22', 'VIN77777777777777', 02, 3);
INSERT INTO Registration(licensePlateNo, issueDate, VIN, customerID, deptID)
VALUES ('R0008R', DATE '2021-04-19', 'VIN88888888888888', 09, 3);
INSERT INTO Registration(licensePlateNo, issueDate, VIN, customerID, deptID)
VALUES ('R0009R', DATE '2021-06-16', 'VIN99999999999999', 10, 3);
INSERT INTO Registration(licensePlateNo, issueDate, VIN, customerID, deptID)
VALUES ('R0010R', DATE '2021-02-06', 'VIN10101010101010', 12, 3);
INSERT INTO Registration(licensePlateNo, issueDate, VIN, customerID, deptID)
VALUES ('R0011R', DATE '2021-06-16', 'VIN12121212121212', 07, 3);
INSERT INTO Registration(licensePlateNo, issueDate, VIN, customerID, deptID)
VALUES ('R0012R', DATE '2021-02-06', 'VIN13131313131313', 05, 3);

-- Insert for StateID
INSERT INTO StateID(stateIDNo, issueDate, customerID, deptID)
VALUES ('S00000001', DATE '2020-01-22', 01, 4);
INSERT INTO StateID(stateIDNo, issueDate, customerID, deptID)
VALUES ('S00000002', DATE '2011-04-19', 02, 4);
INSERT INTO StateID(stateIDNo, issueDate, customerID, deptID)
VALUES ('S00000003', DATE '2016-06-16', 03, 4);
INSERT INTO StateID(stateIDNo, issueDate, customerID, deptID)
VALUES ('S00000004', DATE '2018-02-06', 04, 4);
INSERT INTO StateID(stateIDNo, issueDate, customerID, deptID)
VALUES ('S00000005', DATE '2020-01-22', 05, 4);
INSERT INTO StateID(stateIDNo, issueDate, customerID, deptID)
VALUES ('S00000006', DATE '2011-04-19', 06, 4);
INSERT INTO StateID(stateIDNo, issueDate, customerID, deptID)
VALUES ('S00000007', DATE '2016-06-16', 07, 4);
INSERT INTO StateID(stateIDNo, issueDate, customerID, deptID)
VALUES ('S00000008', DATE '2018-02-06', 07, 4);