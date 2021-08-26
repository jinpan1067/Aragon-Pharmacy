/* Purpose: Creating SpeakSpanishView in the database Aragon Pharmacy
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
/* create view to show the employees who can speak Spanish */
create view HumanResources.SpeakSpanishView
as
select CONCAT_WS(' ',HE.EmpFirst,HE.EmpLast) as 'Full name', HE.Memo as 'memories',HE.phone as 'Phone', HE.cell as 'cell phone'
from HumanResources.tblEmployee as HE
     
where HE.Memo like '%Spanish%' and
      HE.EndDate is null

;
go

/* run the view */
select *
from HumanResources.SpeakSpanishView
;
go