--INSERT INTO Department(deptID) values (1);
--INSERT INTO Department(deptID) values (2);
--INSERT INTO Department(deptID) values (3);
--INSERT INTO Department(deptID) values (4);

--INSERT INTO Customer(customerID) values (1);

--INSERT INTO Employee(employeeID) values	(1);
--INSERT INTO Employee(employeeID) values (2);

INSERT INTO
Appointment(apptId, appttime, apptsuccessful, appttype,fee, deptid, customerid, employeeid)
VALUES (2, timestamp '2000-01-01 00:00:00', 1, NULL, NULL, 2, 1, 2);
--VALUES (1, timestamp '2000-01-01 00:00:00', 1, NULL, NULL, 1, 1, 1);
