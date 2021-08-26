/* Purpose: Applying Data Integrity to the Table Objects  in the database Aragon Pharmacy
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

/* ***** Table No. 1 - Sales.tblCustomer ***** */
-- Foreign key constraints
/* 1)Add foreign key Between  Sales.tblCustomer and Sales.tblHealthPlan  */
alter table sales.tblCustomer
      add constraint fk_tblCustomer_tblHealthPlan foreign key (PlanID)
	  references Sales.tblHealthPlan(PlanID)
	  ;
go

/* 2)Add foreign key Between Sales.tblCustomer and Sales.tblHousehold */
alter table sales.tblCustomer
      add constraint fk_tblCustomer_tblHousehold foreign key (HouseID)
	  references Sales.tblHousehold(HouseID)
	  ;
go

/* 3)balance default 0.00$  */
alter table Sales.tblCustomer
	add constraint df_Balance_tblCustomer default (0.00) for Balance
;
go


/* ***** Table No. 2 - Sales.tblHealthPlan ***** */
-- No extra constraints (only one primary key)

/* ***** Table No. 3 - Sales.tblHousehold ***** */
-- Default constraints (set Province column value to QC)
/*Default (df_)
	alter table schema_name.table_name
		add constraint df_column_name_table_name default (value) for column_name
*/
alter table Sales.tblHousehold
	add constraint df_Province_tblHousehold default ('QC') for Province
;
go

/* ***** Table No. 4 - HumanResources.tblEmployee ***** */

/* 1) Add foreign key Between  HumanResources.tblEmployee and HumanResources.tblJobTitle  */
alter table HumanResources.tblEmployee
      add constraint fk_tblEmployee_tblJobTitle foreign key (JobID)
	  references HumanResources.tblJobTitle(JobID)
	  ;
go
/* 2) Add constraint unique for column SIN */
alter table HumanResources.tblEmployee
   add constraint uq_sin_tblEmployee unique (SINs)
;
go

/* 3) Add constraint check between endDate and hireDate  */
alter table HumanResources.tblEmployee
   add constraint ck_endDate_tblEmployee check (EndDate > StartDate)
;
go

/* 4) Add constraint check for province pattern  */
alter table HumanResources.tblEmployee
  add constraint ck_empProvince check (province IN( 'AB','BC','MB','NB','NL','NS','NT','NU','ON','PE','QC','SK','YT'))
;
go

/* 5) Add constraint default 0.00 for salary  */

alter table HumanResources.tblEmployee
	add constraint df_Salary_tblEmployee default (0.00) for Salary
;
go

/* 6) Add constraint default 0.00 for HourlyRate  */

alter table HumanResources.tblEmployee
	add constraint df_HourlyRate_tblEmployee default (0.00) for HourlyRate
;
go


/* ***** Table No. 5 - HumanResources.tblEmployeeTraining ***** */
  /* 1) Add foreign key Between  HumanResources.tblEmployeeTraining and HumanResources.tblEmployee  */

  alter table HumanResources.tblEmployeeTraining
      add constraint fk_tblEmployeeTraining_tblEmployee foreign key (EmpID)
	  references HumanResources.tblEmployee(EmpID)
	  ;
  go

  /* 2) Add foreign key Between  HumanResources.tblEmployeeTraining and HumanResources.tblClass  */
   alter table HumanResources.tblEmployeeTraining
      add constraint fk_tblEmployeeTraining_tblClass foreign key (ClassID)
	  references HumanResources.tblClass(ClassID)
	  ;
   go

/* ***** Table No. 6 - HumanResources.tblClass ***** */
-- No extra constraints (only one primary key)

/* ***** Table No. 7 - HumanResources.tblJobtitle ***** */
-- No extra constraints (only one primary key)

/* ***** Table No. 8 - Prescription.tblRx ***** */
 /* 1) Add foreign key Between Prescription.tblRx and Prescription.tblDrug  */
  alter table Prescription.tblRx
      add constraint fk_tblRx_tblDrug foreign key (DIN)
	  references Prescription.tblDrug(DIN)
	  ;
   go

 /* 2) Add foreign key Between Prescription.tblRx and Sales.tblCustomer  */

  alter table Prescription.tblRx
      add constraint fk_tblRx_tblCustomer foreign key (CustID)
	  references Sales.tblCustomer(CustID)
	  ;
   go

 /* 3) Add foreign key Between Prescription.tblRx and Doctors.tblDoctor  */

  alter table Prescription.tblRx
      add constraint fk_tblRx_tblDoctor foreign key (DoctorID)
	  references Doctors.tblDoctor(DoctorID)
	  ;
   go

/* ***** Table No. 9 - Prescriptions.tblRefill ***** */

/* 1) Add foreign key Between Prescription.tblRefill and Prescription.tblRx  */

  alter table Prescription.tblRefill
      add constraint fk_tblRefill_tblRx foreign key (PrescriptionID)
	  references Prescription.tblRx(PrescriptionID)
	  ;
   go

/* 2) Add foreign key Between Prescription.tblRefill and HumanResources.tblEmployee  */
  alter table Prescription.tblRefill
      add constraint fk_tblRefill_tblEmployee foreign key (EmpID)
	  references HumanResources.tblEmployee(EmpID)
	  ;
   go

/* ***** Table No. 10 - Prescription.tblDrug ***** */
-- No extra constraints (only one primary key)

/* ***** Table No. 11 - Doctors.tblDoctor ***** */

/* Add foreign key Between Doctors.tblDoctor and Doctors.tblClinic  */

 alter table Doctors.tblDoctor
      add constraint fk_tblDoctor_tblClinic foreign key (ClinicID)
	  references Doctors.tblClinic(ClinicID)
	  ;
 go

 /* ***** Table No. 12 - Doctors.tblClinic ***** */
-- No extra constraints (only one primary key)