--no dependencies
@ CreateJob.sql
@ CreateDepartment.sql
@ CreateCustomer.sql
--depends on job and dept
@ CreateEmployee.sql
--depends on customer and dept
@ CreateLicense.sql
@ CreateRegistration.sql
@ CreatePermit.sql
@ CreateStateID.sql
--depends on dept customer and employee
@ CreateAppointment.sql
@ Triggers.sql
