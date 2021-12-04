---Query 1
-- Write a query that displays the user details whose Ids will expire given a date in format MM/DD/YYYY
-- The result should display the userId, userName, id issued date, id expiry Data and type if ID
SELECT * FROM (
       SELECT Customer.customerID, firstName, lastName, issueDate, expireDate, deptName
       FROM Customer, License, Department
       WHERE Customer.customerID = License.customerID	
       AND License.deptID = Department.deptID
       UNION ALL
       SELECT Customer.customerID, firstName, lastName, issueDate, expireDate, deptName
       FROM Customer, Registration, Department
       WHERE Customer.customerID = Registration.customerID
       AND Registration.deptID = Department.deptID
       UNION ALL
       SELECT Customer.customerID, firstName, lastName, issueDate, expireDate, deptName
       FROM Customer, Permit, Department
       WHERE Customer.customerID = Permit.customerID
       AND Permit.deptID = Department.deptID
       UNION ALL
       SELECT Customer.customerID, firstName, lastName, issueDate, expireDate, deptName
       FROM Customer, StateID, Department
       WHERE Customer.customerID = StateID.customerID
       AND StateID.deptID = Department.deptID )
WHERE expireDate <= TO_DATE('12/31/2050', 'MM/DD/YYYY');

