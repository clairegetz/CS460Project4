-- Display all the salary, title for a department of your choise.
SELECT j.title, j.salary FROM Job j
INNER JOIN Employee e ON j.jobID = e.jobID
WHERE e.deptID IN
(SELECT deptID FROM Department WHERE deptName = 'Permit');