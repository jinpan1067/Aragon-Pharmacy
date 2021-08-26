/* Purpose: Creating Schema Objects in the database Aragon Pharmacy
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

/* create schema objects and set the owner to each of them
1. Prescription
2. Doctors
3. Sales
4. HumanResources

*/
-- create Prescription schema
create schema Prescription authorization dbo
;
go

-- create Doctors schema
create schema Doctors authorization dbo
;
go

-- create Sales schema
create schema Sales authorization dbo
;
go

-- create HumanResources schema
create schema HumanResources authorization dbo
;
go