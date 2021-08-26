/* Purpose: Creating HourlyRateAnalysisView in the database Aragon Pharmacy
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
/* create view to show the HourlyRate of techinician and cashier */
create view HumanResources.HourlyRateAnalysisView
as
select CONCAT_WS(' ',HE.EmpFirst,HE.EmpLast) as 'Full name' ,HJ.Title as 'Job title', HE.HourlyRate as 'Hourly Rate'
from HumanResources.tblEmployee as HE
     inner join HumanResources.tblJobtitle as HJ
	      on HE.JobID = HJ.JobID
where HJ.Title in ('Technician','cashier')

;
go

/* run the view */
select *
from HumanResources.HourlyRateAnalysisView
;
go
