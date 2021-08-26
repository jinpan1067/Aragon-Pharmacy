/* Purpose: Creating UpToDateView in the database Aragon Pharmacy.
Script Date: April 11, 2021
Developed by: Jin Pan, Zhang zhaoyu
*/

/* add a statement that specifies the script
runs in the context of the master database */

-- switch to the Northwind database
-- Syntax: use database_name

use AragonPharmarcy
;
go 

/* create a EmployeeTrainingView */
create view HumanResources.EmployeeTrainingView
as
select HE.EmpLast as 'Last name',HE.EmpFirst as 'First Name', ClassID ,Date
from HumanResources.tblEmployee as HE
     left join HumanResources.tblEmployeeTraining as HET
	 on HE.EmpID = HET.EmpID

;
go

select *
from HumanResources.EmployeeTrainingView
;
go



create view HumanResources.UpToDateView
as
select  ETV.[Last name],ETV.[First Name],ETV.date as 'Training Date', HC.Description as 'Class Description', HC.Renewal as 'Renew Intervals ',HC.Required,ETV.ClassID
from HumanResources.EmployeeTrainingView as ETV
     left join HumanResources.tblClass as HC
	 on ETV.ClassID = HC.ClassID

;
go

SELECT *
FROM HumanResources.UpToDateView AS HUDV
WHERE HUDV.Required = 1 and
      HUDV.[Class Description]  like '%adult%' or 
      HUDV.[Class Description]  like '%child%' or 
      HUDV.[Class Description]  like  '%Defibrillator%'
;
GO

SELECT *
FROM HumanResources.UpToDateView AS HUDV
WHERE 
year(HUDV.[Training Date])= 2020 and HUDV.ClassID in (1,3)
;
GO

