/* Purpose: Built some triggers for the Table Objects  in the database Aragon Pharmacy
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


 /* ***** Table1 - Doctors.tblClinic ***** */

/* 1) create a trigger to format the postalcode */
create trigger Doctors.toFormatPcTr
on Doctors.tblClinic
after insert, update
as
	begin
	   IF TRIGGER_NESTLEVEL() > 1
        RETURN

		 update Doctors.tblClinic
		 set Postalcode = upper(LEFT(PostalCode, 3) + ' ' + RIGHT(PostalCode, 3))
	
		 where ClinicID in 
		        (select ClinicID
		        from inserted)
	
	end
;
go

/* 2) create a trigger to format the phone  */
create trigger Doctors.FormatPhoneTr_tblclinic
on Doctors.tblClinic
after insert, update
as
	begin
	   IF TRIGGER_NESTLEVEL() > 1
     RETURN

		 update Doctors.tblClinic
		 set 
		 	 Phone = '(' + left(phone, 3) + ')' + SUBSTRING(phone, 4, 3)+ '-'+ RIGHT(phone, 4)
		
		 where ClinicID in 
		        (select ClinicID
		        from inserted)
	
	end
;
go
/* 3) create a trigger to upper province */

create trigger Doctors.UpperProvinceTr
on Doctors.tblClinic
after insert, update
as
	begin
	   IF TRIGGER_NESTLEVEL() > 1
        RETURN

		 update Doctors.tblClinic
		 set 
		 	 Province = upper(Province)
		
		 where ClinicID in 
		        (select ClinicID
		        from inserted)
	
	end
;
go



 /* ***** Table2  - Doctors.tblDoctor ***** */

 /* create a trigger to format the phone and cell phone number */
create trigger Doctors.toFormatPhoneDDTr
on Doctors.tblDoctor
after insert, update
as
	begin
	    
		 update Doctors.tblDoctor
		 set Phone = '(' + left(phone, 3) + ')' + SUBSTRING(phone, 4, 3)+ '-'+ RIGHT(phone, 4),
						  
              Cell = '(' + left(cell, 3) + ')' + SUBSTRING(cell, 4, 3)+ '-'+ RIGHT(cell, 4)
		                  
		 where DoctorID in 
		        (select DoctorID
		        from inserted)
		
	end
;
go

/* ***** Table3  - HumanResources.tblEmployee ***** */
/* 1) create a trigger to format the postalcode */
create trigger HumanResources.toUpperPSHRTr
on HumanResources.tblEmployee
after insert, update
as
	begin
	   IF TRIGGER_NESTLEVEL() > 1
        RETURN
		 update HumanResources.tblEmployee
		 set 
		 Postalcode = upper(LEFT(PostalCode, 3) + ' ' + RIGHT(PostalCode, 3))
			 
		 where EmpID in 
		        (select EmpID
		        from inserted)
	
	end
;
go
/* 2) create a trigger to format the phone and cell phone number  */
create trigger HumanResources.toFormatPhoneHRTr
on HumanResources.tblEmployee
after insert, update
as
	begin
	   IF TRIGGER_NESTLEVEL() > 1
        RETURN
		 update HumanResources.tblEmployee
		 set 
			 Phone = '(' + left(phone, 3) + ')' + SUBSTRING(phone, 4, 3)+ '-'+ RIGHT(phone, 4),	
			 Cell = '(' + left(cell, 3) + ')' + SUBSTRING(cell, 4, 3)+ '-'+ RIGHT(cell, 4)
			
		 where EmpID in 
		        (select EmpID
		        from inserted)
	
	end
;
go

/* 3) create a trigger to format SINs */

create trigger HumanResources.toFormatSINsTr
on HumanResources.tblEmployee
after insert, update
as
	begin
	   IF TRIGGER_NESTLEVEL() > 1
        RETURN
		 update HumanResources.tblEmployee
		 set 
			 SINs = left(SINs, 3) + '-' + SUBSTRING(SINs, 4, 3)+ '-'+ RIGHT(SINs, 3)
			
		 where EmpID in 
		        (select EmpID
		        from inserted)
	
	end
;
go

/* 4) create a trigger to format the date  */

create trigger HumanResources.toFormatDateHTr
on HumanResources.tblEmployee
after insert, update
as
	begin
	   IF TRIGGER_NESTLEVEL() > 1
        RETURN
		 update HumanResources.tblEmployee
		 set 
			DOB = FORMAT(convert(datetime,DOB),'MM/dd/yyyy'),
            StartDate  = FORMAT(convert(datetime,StartDate),'MM/dd/yyyy'),
			EndDate  = FORMAT(convert(datetime,EndDate),'MM/dd/yyyy'),
			ReviewDate = FORMAT(convert(datetime,ReviewDate),'MM/dd/yyyy')
			
		 where EmpID in 
		        (select EmpID
		        from inserted)
	
	end
;
go

/* ***** Table4  - Sales.tblCustomer ***** */

/* 1) add trigger to format the phone */
create trigger Sales.toFormatPhoneCTr
on Sales.tblCustomer
after insert, update
as
	begin
	     IF TRIGGER_NESTLEVEL() > 1
        RETURN
		 update Sales.tblCustomer
		 set Phone =  '(' + left(phone, 3) + ')' + SUBSTRING(phone, 4, 3)+ '-'+ RIGHT(phone, 4)
      		  
		 where CustID in 
		        (select CustID
		        from inserted)
		
	end
;
go

/* 2) add trigger to format the date */
create trigger Sales.toFormatDateCTr
on Sales.tblCustomer
after insert, update
as
	begin
	     IF TRIGGER_NESTLEVEL() > 1
        RETURN
		 update Sales.tblCustomer
		 set
		 DOB = FORMAT(convert(datetime,DOB),'MM/dd/yyyy')
      		  
		 where CustID in 
		        (select CustID
		        from inserted)
		
	end
;
go

/* ***** Table5  - Sales.tblHealthPlan ***** */

/* 1) trigger for postalcode */
create trigger Sales.toUpperCaseTr
on Sales.tblHealthPlan
after insert, update
as
	begin
	   IF TRIGGER_NESTLEVEL() > 1
        RETURN
		 update Sales.tblHealthPlan
		 set Postalcode = upper(LEFT(PostalCode, 3) + ' ' + RIGHT(PostalCode, 3)) 
			 
		 where PlanID in 
		        (select PlanID
		        from inserted)
	
	end
;
go

/* 2) trigger for phone number */
create trigger Sales.toFormatPhoneHTr
on Sales.tblHealthPlan
after insert, update
as
	begin
	   IF TRIGGER_NESTLEVEL() > 1
        RETURN
		 update Sales.tblHealthPlan
		 set  
			 Phone	= '(' + left(phone, 3) + ')' + SUBSTRING(phone, 4, 3)+ '-'+ RIGHT(phone, 4)	  
		 where PlanID in 
		        (select PlanID
		        from inserted)
	
	end
;
go


/* ***** Table6 - Sales.tblHousehold ***** */


/*  create a trigger to format the postalcode */
create trigger Sales.toUpperCasePSTr
on Sales.tblHousehold
after insert, update
as
	begin
	   
		 update Sales.tblHousehold
		 set Postalcode = upper(LEFT(PostalCode, 3) + ' ' + RIGHT(PostalCode, 3)) 
						 
		 where HouseID in 
		        (select HouseID
		        from inserted)
	
	end
;
go

/* ***** Table7 - Prescription.tblRx ***** */

create trigger Prescription.tblRxFormatDateRTr
on Prescription.tblRx
for update,insert
as
   begin
      
       update Prescription.tblRx
       
       set 
          date = FORMAT(convert(datetime,date),'MM/dd/yyyy'),
          ExpireDate  = FORMAT(convert(datetime,ExpireDate),'MM/dd/yyyy')
         
     
       where PrescriptionID in (
                          select PrescriptionID
                          from inserted)
   end
;
go

/* ***** Table8 - HumanResources.tblEmployeeTraining ***** */

create trigger HumanResources.toFormatDateETTr
on HumanResources.tblEmployeeTraining
for update,insert
as
   begin
      
       update HumanResources.tblEmployeeTraining
       
       set 
          Date = FORMAT(convert(datetime,Date),'MM/dd/yyyy')
      
       where EmpID in (
                        select EmpID
                        from inserted)
   end
;
go

/* ***** Table9 - Prescription.tblRefill ***** */

  
create trigger Prescription.tblRefillFormatDateRFTr
on Prescription.tblRefill
for update,insert
as
   begin
      
       update Prescription.tblRefill
       
       set 
          RefillDate = FORMAT(convert(datetime,RefillDate),'MM/dd/yyyy')
  
       where PrescriptionID in (
                          select PrescriptionID
                          from inserted)
   end
;
go

