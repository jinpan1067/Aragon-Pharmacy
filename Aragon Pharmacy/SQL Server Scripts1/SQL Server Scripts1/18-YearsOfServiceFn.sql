/* Purpose: Creating a user-defined function to calculate employees service years in the database Aragon Pharmacy.
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

/* create a function to calculate the employees' services years */
create function HumanResources.YearsOfServiceFn
(
	@HireDate as datetime
)

returns int
	as
		begin
			declare @Years as int
			select @Years = dateDiff(year, @HireDate, getDate() )
			return @Years
		end
;
go


/* run the function by using select statement */

select  HE.EmpLast as 'Last Name', 
        HE.EmpFirst as 'First Name ', 
		HumanResources.YearsOfServiceFn(StartDate) as 'Years of Services'

FROM [HumanResources].[tblEmployee] AS HE
;
GO