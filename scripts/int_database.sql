/*
Creación de la base de datos: 
Creamos la base de datos llamada DataWarehouse y los esquemas sobre los cuales trabajaremos llamado bronze, silver y gold.
==============================================================
Importante: Se añade un validador de existencia de la base datos, que nos especifica que si existe esta base datos en el sistema la eliminará para posteriormente poder ser recreada.
Por favor tener en cuenta esta parte del código.
*/



USE master;
GO
--- Eliminamos y recreamos la base de datos

if exists (select 1 from sys.database where name = 'DataWarehouse')
begin
	alter DATABASE DataWarehouse set SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
end;
GO

--- create the 'dataWarehouse' database 

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;

