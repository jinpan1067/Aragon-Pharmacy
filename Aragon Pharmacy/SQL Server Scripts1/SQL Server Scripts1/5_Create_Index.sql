/* Purpose: Creating Index in the database Aragon Pharmacy.
Script Date: April 11, 2021
Developed by: Jin Pan, Zhang zhaoyu
*/

/* add a statement that specifies the script
runs in the context of the master database */

-- switch to the Northwind database
-- Syntax: use database_name

use AragonPharmarcy
;
go  -- includes end of the batch marker

/* create an index on the CustLast field in tableCustomer */
create nonclustered index ncl_LastName on Sales.tblCustomer (CustLast)
;
go

/* create an index on the name field in tableDrug */
create nonclustered index ncl_Name on Prescription.tblDrug (name)
;
go

