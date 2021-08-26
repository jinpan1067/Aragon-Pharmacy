
/* Purpose: Avoidf duplicated records in the database Aragon Pharmacy.
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



select SC.CustID,SC.HouseID,SC.CustFirst,SH.Address
from sales.tblCustomer as SC 
     inner join sales.tblHousehold as SH
     on SC.HouseID = SH.HouseID
--where SC.HeadHH = 1
order by SC.HouseID
;
go