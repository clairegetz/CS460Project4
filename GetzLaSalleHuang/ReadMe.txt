Claire Getz, Jacob Lasalle, and Jiazheng Huang
CSC460 Project 4
December 6, 2021

ReadMe.txt

to compile:
javac UserInterface.java
javac Proj4.java
export CLASSPATH=/usr/lib/oracle/19.8/client64/lib/ojdbc8.jar:${CLASSPATH}
java Proj4 <username> <password>  //where these are your oracle username and password

Work Distribution:
Jacob Lasalle: All code for the java application, ER-Diagram
Claire Getz: Queries 1 and 2, CREATE TABLE scripts for Appointment, Customer and Employee,
FDs for Appointment, Department, Employee, Customer and Job, triggers, ER-Diagram
Jiazheng Huang: Queries 3 and 4, CREATE TABLE scripts for Job, Department, StateID, License, Registration and Permit,
FDs for StateID, License, Registration and Permit, ER-Diagram