/* Purpose: Creating create a user-define function (UDF) with parameter by specifying a parameter value in the @JobID field for the database Aragon Pharmacy.
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

/*Creating create a user-define function (UDF) with parameter*/

create function HumanResources.getSubstituteListFn 
(@JobID as tinyint)
returns table
     as
	    return
		( 
		 select HE.EmpLast, HE.EmpFirst, HE.Phone, HE.Cell,HE.JobID, HE.EndDate 
		 from HumanResources.tblEmployee as HE
		 
		 where HE.JobID = @JobID and
		       EndDate is null 
		 
		 )

;
go

/* run the function and sort the data in alphabetical order by last name */
select * 
from HumanResources.getSubstituteListFn (3)
order by EmpLast
;
go