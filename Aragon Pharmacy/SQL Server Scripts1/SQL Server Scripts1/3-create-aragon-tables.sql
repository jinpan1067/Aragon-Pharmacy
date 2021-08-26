/* Purpose: Creating table Objects in the database Aragon Pharmacy
Script Date: March 27, 2021
Developed by: Jin Pan, Zhang zhaoyu
*/

/* add a statement that specifies the script
runs in the context of the master database */

-- switch to the Northwind database
-- Syntax: use database_name

use AragonPharmarcy
;
go 

/* ***** Table No. 1 - Sales.tblCustomer ***** */
if OBJECT_ID('Sales.tblCustomer', 'U') is not null
	drop table Sales.tblCustomer
;
go

create table Sales.tblCustomer
(
	-- column_name data_type constraint(s)
	CustID int identity(1,1) not null,           -- primary key 
	CustFirst nvarchar(30) not null,
	CustLast nvarchar(30) null,
	Phone nvarchar(15) not null,	-- Phone number includes country code and / or area code
	DOB varchar(30)  not null,
	Gender nvarchar(10) not null,
	Balance money not null,
	ChildproofCap bit not null,
	PlanID nvarchar(50) null,  -- Freign key in table  Sales.tblHealthPlan
	HouseID smallint not null,     -- Freign key in table Sales.tblHousehold
	HeadHH  bit  null,   -- head of household (only if someone other than the customer is financially responsible)
	Allergies nvarchar(50) null,
	
	constraint pk_tblCustomer primary key clustered (CustID asc)
)
;
go
/* ***** Table No. 2 - Sales.tblHealthPlan ***** */
if OBJECT_ID('Sales.tblHealthPlan', 'U') is not null
	drop table Sales.tblHealthPlan
;
go
create table Sales.tblHealthPlan
(
	-- column_name data_type constraint(s)
    PlanID    nvarchar(50) not null,  -- primary key
	PlanName   nvarchar(50) not null,
	Address    nvarchar(30) not null,
	City       nvarchar(20) not null,
	Province   nchar(2) not null,
	PostalCode  nvarchar(8) not null,
	Phone        nvarchar(15) not null,
	Days         tinyint not null,
	WebSite      nvarchar(50)  null,
	
	constraint pk_tblHealthPlan primary key clustered (PlanID asc)
)
;
go

/* ***** Table No. 3 - Sales.tblHousehold ***** */
if OBJECT_ID('Sales.tblHousehold', 'U') is not null
	drop table Sales.tblHousehold
;
go
create table Sales.tblHousehold
(
	-- column_name data_type constraint(s)
    HouseID   smallint identity(1,1) not null,  -- primary key	
	Address    nvarchar(30) not null,
	City       nvarchar(20) not null,
	Province   nchar(2) not null,
	PostalCode  nvarchar(8) not null,
	
	
	constraint pk_tblHousehold primary key clustered (HouseID asc)
)
;
go

/* ***** Table No. 4 - HumanResources.tblEmployee ***** */
if OBJECT_ID('HumanResources.tblEmployee', 'U') is not null
	drop table HumanResources.tblEmployee
;
go

create table HumanResources.tblEmployee
(
	-- column_name data_type constraint(s)
    EmpID   smallint identity(1,1) not null ,  -- primary key	
    EmpFirst nvarchar(30) not null,
	EmpMI nchar(2) not null,
	EmpLast nvarchar(30) not null,
	SINs nvarchar(11) not null,
	DOB  varchar(30)  not null,
	StartDate varchar(30)  not null,
	EndDate   varchar(30)  null,
	Address  nvarchar(30) not null,
	City       nvarchar(20) not null,
	Province   nchar(2) not null,
	PostalCode  nvarchar(8) not null,
	JobID    tinyint not null,   --Foreign key in table HumanResources.tblJobtitle
	Memo  nvarchar(255)  null,
	Phone   nvarchar(15) not null,
	Cell    nvarchar(15) null,
	Salary     money null,
	HourlyRate  decimal(6,2)  null,
	ReviewDate   varchar(30)  null,

	
	constraint pk_tblEmployee primary key clustered (EmpID asc)
)
;
go

/* ***** Table No. 5 - HumanResources.tblEmployeeTraining ***** */
if OBJECT_ID('HumanResources.tblEmployeeTraining', 'U') is not null
	drop table HumanResources.tblEmployeeTraining
;
go

create table HumanResources.tblEmployeeTraining
(
	-- column_name data_type constraint(s)
    EmpID   smallint not null ,  -- primary key	
    Date varchar(30)  null,
	ClassID  smallint not null     -- Foreign key in HumanResources.tbljobtitle

	
	constraint pk_tblEmployeeTraining primary key clustered (EmpID asc,ClassID asc)
)
;
go


/* ***** Table No. 6 - HumanResources.tblClass ***** */
if OBJECT_ID('HumanResources.tblClass', 'U') is not null
	drop table HumanResources.tblClass
;
go

create table HumanResources.tblClass
(
	-- column_name data_type constraint(s)
    ClassID  smallint identity(1,1) not null ,  -- primary key	
    Description nvarchar(100) not null,
	Cost money not null,   
	Renewal tinyint not null,
	Required bit not null,
	Provider nvarchar(100) not null,

	constraint pk_tblClass primary key clustered (ClassID asc)
)
;
go

/* ***** Table No. 7 - HumanResources.tblJobtitle ***** */
if OBJECT_ID('HumanResources.tblJobtitle', 'U') is not null
	drop table HumanResources.tblJobtitle
;
go

create table HumanResources.tblJobtitle
(
	-- column_name data_type constraint(s)
    JobID  tinyint identity(1,1) not null ,  -- primary key	
    Title  nvarchar(30) not null,

	constraint pk_tblJobtitle primary key clustered (JobID asc)
)
;
go

/* ***** Table No. 8 - Prescription.tblRx ***** */
if OBJECT_ID('Prescription.tblRx', 'U') is not null
	drop table Prescription.tblRx
;
go

create table Prescription.tblRx
(
	-- column_name data_type constraint(s)
   PrescriptionID smallint identity(1,1) not null,
   DIN  nchar(8) not null,  -- Foreign key in Prescriptions.tblDrug
   Quantity tinyint not null,
   Unit  nvarchar(10) not null,
   Date varchar(30) not null,
   ExpireDate varchar(30)  not null,
   Refills  tinyint  null,
   AutoRefill bit  null,
   RefillsUsed tinyint null,
   Instructions nvarchar(50) not null,
   CustID int not null,  -- Foreign key in Sales.Customer
   DoctorID smallint not null,  -- Foreign key in Doctors.tbldoctor

	constraint pk_tblRx primary key clustered (PrescriptionID asc)

)
;
go

/* ***** Table No. 9 - Prescriptions.tblRefill ***** */
if OBJECT_ID('Prescription.tblRefill', 'U') is not null
	drop table Prescription.tblRefill
;
go

create table Prescription.tblRefill
(
	-- column_name data_type constraint(s)
   PrescriptionID smallint  not null,
   RefillDate varchar(30) not null,
   EmpID smallint not null ,

	constraint pk_tblRefill primary key clustered (PrescriptionID asc,RefillDate)

)
;
go

/* ***** Table No. 10 - Prescription.tblDrug ***** */
if OBJECT_ID('Prescription.tblDrug', 'U') is not null
	drop table Prescription.tblDrug
;
go

create table Prescription.tblDrug
(
	-- column_name data_type constraint(s)
   DIN   nchar(8) not null,
  Name   nvarchar(30) not null,
  Generic bit not null,
  Description nvarchar(100) not null,
  Unit  nvarchar(10) not null,
  Dosage  decimal(6,2) not null,
  DosageForm nvarchar(20) not null,
  Cost money not null,
  Price money not null,
  fee money not null,
  Interactions  nvarchar(50)  null,
  Supplier nvarchar(50) not null,

	constraint pk_tblDrug primary key clustered (DIN asc)

)
;
go


/* ***** Table No. 11 - Doctors.tblDoctor ***** */
if OBJECT_ID('Doctors.tblDoctor', 'U') is not null
	drop table Doctors.tblDoctor
;
go

create table Doctors.tblDoctor
(
	-- column_name data_type constraint(s)
  DoctorID     smallint identity(1,1) not null,
  DoctorFirst  nvarchar(30) not null,
  DoctorLast   nvarchar(30) not null,
  Phone        nvarchar(15) not null,
  Cell         nvarchar(15) null,
  ClinicID     smallint not null,  --Foreign key in table Doctors.tblclinic

	constraint pk_tblDoctor primary key clustered (DoctorID asc)

)
;
go

/* ***** Table No. 12 - Doctors.tblClinic ***** */
if OBJECT_ID('Doctors.tblClinic', 'U') is not null
	drop table Doctors.tblClinic
;
go

create table Doctors.tblClinic
(
	-- column_name data_type constraint(s)
 ClinicID smallint identity(4,1)  not null,
 ClinicName nvarchar(50) not null,
 Address1  nvarchar(40) not null,
 Address2  nvarchar(40) not null,
 City      nvarchar(20) not null,
 Province  nchar(2) not null,
 Postalcode nvarchar(8) not null,
 Phone  nvarchar(15) not null,

	constraint pk_tblClinic primary key clustered (ClinicID asc)

)
;
go

