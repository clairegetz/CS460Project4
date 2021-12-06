-- Write a query that displays the collected fee amount for every department for 
-- a given month in the format MM/YYYY (given by the user). The result should 
-- display the amount and department information 
-- and sort the result on amount in descending order.
SELECT a.deptID, d.deptName, a.TotleFee FROM
(SELECT deptID, SUM(fee) as TotleFee FROM
(SELECT * FROM Appointment
WHERE apptTime >= TO_DATE('2020-11-01', 'YYYY-MM-DD')
AND apptTime < ADD_MONTHS( DATE '2020-11-01', 1))
GROUP BY deptID) a
INNER JOIN Department d
ON a.deptID = d.deptID
ORDER BY a.TotleFee DESC;