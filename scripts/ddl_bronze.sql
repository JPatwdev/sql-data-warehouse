/*

Creamos las distintas tablas de las fuentes ERP y CRM 


================================================================
Creación de las tablas de CRM
================================================================
*/
--- Creación de la tabala de información del cliente
IF OBJECT_ID ('bronze.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info
CREATE TABLE bronze.crm_cust_info(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_marital_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE
);
--- Creación de la tabala de detalles de venta
IF OBJECT_ID ('bronze.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details
CREATE TABLE bronze.crm_sales_details(
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_ord_date DATE,
sls_ship_ord DATE,
sls_due_dt DATE,
sls_sales INT,
sls_quantity INT,
sls_price INT
);
--- Creación de la tabala de información del producto 
IF OBJECT_ID ('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info
CREATE TABLE bronze.crm_prd_info(
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE
);

/*
================================================================
Creación de las tablas de ERP
================================================================
*/

--- Creación de la tabala de locales
IF OBJECT_ID ('bronze.erp_loc_a101', 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101
CREATE TABLE bronze.erp_loc_a101(
cid NVARCHAR(50),
cntry NVARCHAR(50)
);

--- Creación de la tabala de detalles de usuario
IF OBJECT_ID ('bronze.erp_az12', 'U') IS NOT NULL
	DROP TABLE bronze.erp_az12
CREATE TABLE bronze.erp_az12(
cid NVARCHAR(50),
bdate DATE,
gen NVARCHAR(50)
);
--- Creación de la tabala de categorias de producto
IF OBJECT_ID ('bronze.px_cat_g1v2', 'U') IS NOT NULL
	DROP TABLE bronze.px_cat_g1v2
CREATE TABLE bronze.px_cat_g1v2(
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintenance NVARCHAR(50)
);
