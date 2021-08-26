/* Purpose: Creating CarpoolListView in the database Aragon Pharmacy
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
/* create a query for the employees who live in the same city */

select CONCAT_WS(' ',HE.EmpFirst,HE.EmpLast) as 'Full name', HE.Phone as 'Phone number', HE.Cell as 'Cellphone number',HE.City
from HumanResources.tblEmployee as HE
order by HE.city
;
go

