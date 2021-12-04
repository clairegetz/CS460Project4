--To get a license, the user has to clear some tests and there are other conditions to other types of Ids.
--So not every appointment is successful. Your work is to write a query for the previous month count
--every type of appointment and check how many of them were successful

SELECT COUNT(apptSuccessful) AS TotalAppts, SUM(apptSuccessful) AS Sucessful, deptName FROM (
SELECT * FROM Department JOIN Appointment
ON Appointment.deptID = Department.deptID
WHERE apptTime >= add_months(sysdate, -2)
INTERSECT
SELECT * FROM Department JOIN Appointment
ON Appointment.deptID = Department.deptID
WHERE apptTime < LAST_DAY(ADD_MONTHS(sysdate, -1)))
GROUP BY deptName;
