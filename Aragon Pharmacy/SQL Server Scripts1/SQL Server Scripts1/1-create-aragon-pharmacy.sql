/* Purpose: Creating the database Northwind21H1s
Script Date: March 27, 2021
Developed by: JIN Pan, Zhang zhaoyu
*/

/* add a statement that specifies the script
runs in the context of the master database */

-- switch to the master database
-- Syntax: use database_name
use master
;
go -- includes end of the batch marker

create database AragonPharmarcy
on primary
(
	-- 1) rows data logical filename 
	name = 'AragonPharmarcy',
	-- 2) rows data initial file size
	size = 12MB,
	-- 3) rows data auto growth size
	filegrowth = 8MB,
	-- 4) rows data maximum size
	maxsize = unlimited,
	-- 5) rows data path and file name
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AragonPharmarcy.mdf'
)
-- Transaction Log
log on
(
	-- 1) log logical filename 
	name = 'AragonPharmarcy_log',
	-- 2) log initial file size (1/4 of the rows data file size)
	size = 3MB,
	-- 3) log auto growth size
	filegrowth = 10%,
	-- 4) log maximum size
	maxsize = 25MB, 
	-- 5) log path and file name
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AragonPharmarcy_log.ldf'
)
;
go



