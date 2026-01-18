/*
==============================================================================
Cargar de los datos en las tablas creadas desde los archivos csv:
==============================================================================
*/
--- BULK para arrchivos desde CRM
--- Bulk a la tabla de clientes
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	DECLARE @startbatch_time DATETIME, @endbatch_time DATETIME;
	BEGIN TRY
		PRINT '==============================================================='
		PRINT 'Cargando el esquema bronze'
		PRINT '==============================================================='

		
		PRINT '---------------------------------------------------------------'
		PRINT 'Cargando la base de datos CRM'
		PRINT '---------------------------------------------------------------'

		SET @startbatch_time = GETDATE();

		SET @start_time = GETDATE();
		PRINT '>>Vaciando tabla crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>>cargando datos a tabla crm_cust_info'

		BULK INSERT bronze.crm_cust_info
		FROM 'J:\datawarehouse\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Duració de carga: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';

		--- Bulk a la tabla de producto
		SET @start_time = GETDATE();
		PRINT '>>Vaciando tabla crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>>cargando datos a tabla crm_prd_info'

		BULK INSERT bronze.crm_prd_info
		FROM 'J:\datawarehouse\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Duració de carga: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';

		--- Bulk a la tabla de ventas
		SET @start_time = GETDATE();
		PRINT '>>Vaciando tabla crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>>cargando datos a tabla crm_sales_details'

		BULK INSERT bronze.crm_sales_details
		FROM 'J:\datawarehouse\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Duració de carga: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';

	
		PRINT '---------------------------------------------------------------'
		PRINT 'Cargando la base de datos ERP'
		PRINT '---------------------------------------------------------------'
		

		SET @start_time = GETDATE();
		PRINT '>>Vaciando tabla erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT '>>cargando datos a tabla erp_cust_az12'

		BULK INSERT bronze.erp_cust_az12
		FROM 'J:\datawarehouse\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Duració de carga: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';

		
		SET @start_time = GETDATE(); 
		PRINT '>>Vaciando tabla erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT '>>cargando datos a tabla erp_loc_a101'

		BULK INSERT bronze.erp_loc_a101
		FROM 'J:\datawarehouse\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Duració de carga: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';

		
		SET @start_time = GETDATE();
		PRINT '>>Vaciando tabla erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT '>>cargando datos a erp_px_cat_g1v2'

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'J:\datawarehouse\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Duració de carga: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '============================================================================='
		SET @endbatch_time = GETDATE();
		PRINT '>> Duració de carga de todo el esquema: ' + CAST(DATEDIFF(second,@startbatch_time,@endbatch_time) AS NVARCHAR) + ' seconds';
	END TRY
	BEGIN CATCH
	PRINT '============================================================================='
	PRINT 'HA OCURRIDO UN ERROR EN EL PROCESO'
	PRINT 'error message' + ERROR_MESSAGE();
	PRINT 'error message' + CAST (ERROR_MESSAGE() AS NVARCHAR);
	PRINT 'error message' + CAST (ERROR_STATE() AS NVARCHAR);
	PRINT '============================================================================='
	END CATCH
END
