/* Purpose: Insert Data From data files to the Table Objects  in the database Aragon Pharmacy
Script Date: March 27, 2021
Developed by: Jin Pan, Zhang zhaoyu
*/

/* add a statement that specifies the script
runs in the context of the master database */

-- switch to the Northwind database
-- Syntax: use database_name

use AragonPharmarcy
;
go -- includes end of the batch marker


/* 1. upload data from data file for table HumanResources.tblClass */
bulk insert HumanResources.tblClass 
from
'C:/Users/jinpa/OneDrive/Documents/DATABASE II/Aragon_Pharmacy_Data_Sources/Class.txt'
with
(   FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ','
)
;
go

select *
from HumanResources.tblClass
;
go

/* 2. upload data from data file for table Doctors.tblClinic */
bulk insert  Doctors.tblClinic
from
'C:/Users/jinpa/OneDrive/Documents/DATABASE II/Aragon_Pharmacy_Data_Sources/Clinic.txt'
with
(   FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ',',
	Fire_triggers
)
;
go

select *
from Doctors.tblClinic
;
go

/* 3. upload data from data file for table Doctors.tblDoctor */
bulk insert  Doctors.tblDoctor
from
'C:/Users/jinpa/OneDrive/Documents/DATABASE II/Aragon_Pharmacy_Data_Sources/Doctor.txt'
with
(   FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ',',
	Fire_triggers
)
;
go
select *
from Doctors.tblDoctor
;
go

/* 4. upload data from data file for table HumanResources.tblEmployee */
bulk insert HumanResources.tblEmployee
from
'C:/Users/jinpa/OneDrive/Documents/DATABASE II/Aragon_Pharmacy_Data_Sources/Employee.txt'
with
(   FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ',',
	Fire_triggers
)
;
go

select *
from HumanResources.tblEmployee
;
go

/* 5. upload data from data file for table HumanResources.tblEmployeeTraining */
bulk insert  HumanResources.tblEmployeeTraining
from
'C:/Users/jinpa/OneDrive/Documents/DATABASE II/Aragon_Pharmacy_Data_Sources/EmployeeTraining.txt'
with
(   FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ',',
	Fire_triggers
)
;
go

select *
from  HumanResources.tblEmployeeTraining
;
go

/* 6. upload data from data file for table HumanResources.tblJobtitle */

bulk insert HumanResources.tblJobtitle
from
'C:/Users/jinpa/OneDrive/Documents/DATABASE II/Aragon_Pharmacy_Data_Sources/JobTitle.txt'
with
(   FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ','
	
)
;
go

select *
from  HumanResources.tblJobtitle
;
go
/* 7. upload data from data file for table Prescription.tblDrug */
bulk insert Prescription.tblDrug
from
'C:/Users/jinpa/OneDrive/Documents/DATABASE II/Aragon_Pharmacy_Data_Sources/Drug.txt'
with
(   FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ','
	
)
;
go
select *
from Prescription.tblDrug
;
go

/* 8. upload data from data file for table Prescription.tblRefill */
bulk insert Prescription.tblRefill
from
'C:/Users/jinpa/OneDrive/Documents/DATABASE II/Aragon_Pharmacy_Data_Sources/Refill.txt'
with
(   FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ',',
	Fire_triggers
)
;
go

select *
from Prescription.tblRefill
;
go

/* 9. upload data from data file for table Prescription.tblRx */
bulk insert Prescription.tblRx
from
'C:/Users/jinpa/OneDrive/Documents/DATABASE II/Aragon_Pharmacy_Data_Sources/Rx.txt'
with
(   FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ',',
	Fire_triggers
)
;
go

select *
from Prescription.tblRx
;
go

/* 10. upload data from data file for table Sales.tblCustomer */
bulk insert Sales.tblCustomer
from
'C:/Users/jinpa/OneDrive/Documents/DATABASE II/Aragon_Pharmacy_Data_Sources/Customer.txt'
with
(   FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ',',
	Fire_triggers
)
;
go

select *
from Sales.tblCustomer
;
go

/* 11. upload data from data file for table Sales.tblHealthPlan */
bulk insert Sales.tblHealthPlan
from
'C:/Users/jinpa/OneDrive/Documents/DATABASE II/Aragon_Pharmacy_Data_Sources/HealthPlan.txt'
with
(   FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ',',
	Fire_triggers
)
;
go

select *
from Sales.tblHealthPlan
;
go

/* 12. upload data from data file for table Sales.tblHousehold */
bulk insert Sales.tblHousehold
from
'C:/Users/jinpa/OneDrive/Documents/DATABASE II/Aragon_Pharmacy_Data_Sources/Household.txt'
with
(   FirstRow = 2,
	RowTerminator = '\n',
	FieldTerminator = ',',
	Fire_triggers
)
;
go

