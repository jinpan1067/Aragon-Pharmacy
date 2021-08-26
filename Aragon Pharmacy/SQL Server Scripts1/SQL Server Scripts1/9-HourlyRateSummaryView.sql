/* Purpose: Creating HourlyRateSummaryView in the database Aragon Pharmacy
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
/* create view to view that returns the hourly rate summary that returns the minimum, 
and maximum of hourly rate related to the job position */

create view HumanResources.HourlyRateSummaryView
as
select HJ.Title as 'Job title',  cast(iif(max(HE.HourlyRate)=0 ,max(HE.salary/12/4/40),max(HE.HourlyRate)) as decimal(6,2)) as 'Maximum of Hourly Rate',cast(iif(min(HE.HourlyRate)=0 ,min(HE.salary/12/4/40),min(HE.HourlyRate)) as decimal(6,2)) as 'Minimum of Hourly Rate'
from HumanResources.tblEmployee as HE
     inner join HumanResources.tblJobtitle as HJ
	      on HE.JobID = HJ.JobID
group by HJ.Title

;
go

/* run the view */

select *     
from HumanResources.HourlyRateSummaryView as HRSV

;
go
