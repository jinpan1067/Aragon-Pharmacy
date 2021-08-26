/* Purpose: Creating MaxMinAvgHourlyRateView in the database Aragon Pharmacy.
Script Date: April 11, 2021
Developed by: Jin Pan , Zhang zhaoyu 
*/

/* add a statement that specifies the script
runs in the context of the master database */

-- switch to the Northwind database
-- Syntax: use database_name

use AragonPharmarcy
;
go 

create view HumanResources.MaxMinAvgHourlyRateView
as
    select HRAV.[Job title],  max(HRAV.[Hourly Rate]) as 'Maximum of Hourly Rate',min(HRAV.[Hourly Rate])  as 'Minimum of Hourly Rate',cast(avg(HRAV.[Hourly Rate]) as decimal(6,2)) as 'Average of Hourly Rate'

from HumanResources.HourlyRateAnalysisView as HRAV
group by HRAV.[Job title]
       
;
go

select *
from HumanResources.MaxMinAvgHourlyRateView as HMMARV

;
go



