/* Purpose: Creating EmployeeClassView in the database Aragon Pharmacy.
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
/* create a view to specify the employees who has done at lease once training */
create view HumanResources.EmployeeClassView
as
  select HE.EmpLast as 'Last Name',HE.EmpFirst as 'First Name', HTE.Date as 'Training date', HTE.ClassID as 'Class ID'
  from HumanResources.tblEmployee as HE
       inner join HumanResources.tblEmployeeTraining as HTE
	   on HE.EmpID = HTE.EmpID
;
go 

/*run the view */
select *
from HumanResources.EmployeeClassView
;
go

