INSERT INTO Department(deptID, deptName) VALUES (1, "Permit");
INSERT INTO Department(deptID, deptName) VALUES (2, "License");
INSERT INTO Department(deptID, deptName) VALUES (3, "Vehicle Registration");
INSERT INTO Department(deptID, deptName) VALUES (4, "StateID");

INSERT INTO Jobs(jobID, title, salary) VALUES (1, "Supervisor", 55000);
INSERT INTO Jobs(jobID, title, salary) VALUES (2, "Front Desk", 40000);
INSERT INTO Jobs(jobID, title, salary) VALUES (3, "Security", 45000);
INSERT INTO Jobs(jobID, title, salary) VALUES (4, "Clerk", 45000);

--INSERT INTO Customer(customerID) values (1);

--INSERT INTO Employee(employeeID) values	(1);
--INSERT INTO Employee(employeeID) values (2);

INSERT INTO
Appointment(apptId, appttime, apptsuccessful, appttype,fee, deptid, customerid, employeeid)
VALUES (2, timestamp '2000-01-01 00:00:00', 1, NULL, NULL, 2, 1, 2);
--VALUES (1, timestamp '2000-01-01 00:00:00', 1, NULL, NULL, 1, 1, 1);
