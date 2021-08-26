/* Purpose: Creating EmployeeClassDescritptionView in the database Aragon Pharmacy.
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



/* create a view to list class description instead of the class ID by class description using the view EmployeeClassView*/
create view HumanResources.EmployeeClassDescritptionView
as
select ECV.[Last Name],ECV.[First Name] , ECV.[Training date], HC.Description as 'Class Description'
from EmployeeClassView as ECV
     inner join HumanResources.tblClass as HC
	 on HC.classID = ECV.[Class ID] 

;
go

select *
from HumanResources.EmployeeClassDescritptionView as ECDV
order by ECDV.[Last Name]
;
go