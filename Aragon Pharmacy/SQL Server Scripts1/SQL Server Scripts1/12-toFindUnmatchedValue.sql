/* Purpose: Creating a query to find the employee who have not completed any training in the database Aragon Pharmacy
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

select CONCAT_WS(' ',HE.EmpFirst,HE.EmpLast) as 'Employee who did not take any class'
from HumanResources.tblEmployee as HE
     left join HumanResources.tblEmployeeTraining as HET
	 on HE.EmpID = HET.EmpID
where ClassID is null
;
go