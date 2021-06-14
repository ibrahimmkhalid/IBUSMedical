
CREATE TABLE Appointment
( 
	Appointment_ID       integer  NOT NULL ,
	Details              varchar(512)  NULL ,
	Date                 datetime  NOT NULL ,
	Time                 datetime  NOT NULL ,
	staffID              integer  NOT NULL ,
	CNIC                 varchar(13)  NOT NULL 
)
go



ALTER TABLE Appointment
	ADD CONSTRAINT XPKAppointment PRIMARY KEY  CLUSTERED (Appointment_ID ASC,staffID ASC,CNIC ASC)
go



CREATE TABLE Department
( 
	Department_ID        integer  NOT NULL ,
	Dept_Name            varchar(30)  NOT NULL 
)
go



ALTER TABLE Department
	ADD CONSTRAINT XPKDepartment PRIMARY KEY  CLUSTERED (Department_ID ASC)
go



CREATE TABLE Doctor
( 
	specialization       varchar(30)  NOT NULL ,
	staffID              integer  NOT NULL 
)
go



ALTER TABLE Doctor
	ADD CONSTRAINT XPKDoctor PRIMARY KEY  CLUSTERED (staffID ASC)
go



CREATE TABLE Patient
( 
	Disease              varchar(30)  NULL ,
	CNIC                 varchar(13)  NOT NULL ,
	Ward_ID              integer  NULL ,
	Length_of_stay       integer  NULL 
)
go



ALTER TABLE Patient
	ADD CONSTRAINT XPKPatient PRIMARY KEY  CLUSTERED (CNIC ASC)
go



CREATE TABLE Person
( 
	CNIC                 varchar(13)  NOT NULL ,
	phoneNo              varchar(11)  NOT NULL ,
	Name                 varchar(30)  NOT NULL ,
	DOB                  datetime  NULL ,
	Sex                  char  NULL 
)
go



ALTER TABLE Person
	ADD CONSTRAINT XPKPerson PRIMARY KEY  CLUSTERED (CNIC ASC)
go



CREATE TABLE Reports
( 
	Report_ID            integer  NOT NULL ,
	Details              varchar(512)  NULL ,
	Patient_CNIC         varchar(13)  NOT NULL ,
	staffID              integer  NOT NULL 
)
go



ALTER TABLE Reports
	ADD CONSTRAINT XPKReports PRIMARY KEY  CLUSTERED (Report_ID ASC,Patient_CNIC ASC,staffID ASC)
go



CREATE TABLE Staff
( 
	Salary               integer  NOT NULL ,
	Occupation           varchar(30)  NULL ,
	password             varchar(30)  NOT NULL ,
	Department_ID        integer  NULL ,
	staffID              integer  NOT NULL ,
	CNIC                 varchar(13)  NULL 
)
go



ALTER TABLE Staff
	ADD CONSTRAINT XPKStaff PRIMARY KEY  CLUSTERED (staffID ASC)
go



CREATE TABLE Ward
( 
	Ward_ID              integer  NOT NULL ,
	Room_rate            integer  NULL ,
	Department_ID        integer  NULL ,
	staffID              integer  NULL 
)
go



ALTER TABLE Ward
	ADD CONSTRAINT XPKWard PRIMARY KEY  CLUSTERED (Ward_ID ASC)
go




ALTER TABLE Appointment
	ADD CONSTRAINT Gets_Appointed FOREIGN KEY (staffID) REFERENCES Doctor(staffID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Appointment
	ADD CONSTRAINT R_21 FOREIGN KEY (CNIC) REFERENCES Person(CNIC)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Doctor
	ADD CONSTRAINT R_3 FOREIGN KEY (staffID) REFERENCES Staff(staffID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Patient
	ADD CONSTRAINT R_1 FOREIGN KEY (CNIC) REFERENCES Person(CNIC)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Patient
	ADD CONSTRAINT Has FOREIGN KEY (Ward_ID) REFERENCES Ward(Ward_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Reports
	ADD CONSTRAINT Writes FOREIGN KEY (staffID) REFERENCES Doctor(staffID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Reports
	ADD CONSTRAINT Receives FOREIGN KEY (Patient_CNIC) REFERENCES Patient(CNIC)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Staff
	ADD CONSTRAINT Employs FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Staff
	ADD CONSTRAINT R_20 FOREIGN KEY (CNIC) REFERENCES Person(CNIC)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Ward
	ADD CONSTRAINT is_in FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Ward
	ADD CONSTRAINT R_15 FOREIGN KEY (staffID) REFERENCES Staff(staffID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


