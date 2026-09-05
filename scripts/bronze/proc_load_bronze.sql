/*
===============================================================================
Load Bronze Layer (Source CSV -> Bronze Tables)
===============================================================================
Run this file with psql while connected to the datawarehouse database.
\copy reads the CSV files from the computer running psql.
===============================================================================
*/

\set ON_ERROR_STOP on
\timing on

SELECT clock_timestamp() AS batch_start_time \gset
\echo ================================================================
\echo Loading Bronze Layer
\echo Batch start time: :batch_start_time
\echo ================================================================

BEGIN;

\echo ----------------------------------------------------------------
\echo Loading CRM Tables
\echo ----------------------------------------------------------------

SELECT clock_timestamp() AS start_time \gset
\echo Start time: :start_time
\echo Truncating table: bronze.crm_cust_info
TRUNCATE TABLE bronze.crm_cust_info;
\echo Loading table: bronze.crm_cust_info
\copy bronze.crm_cust_info FROM 'D:/Skill courses/Job/sql-data-warehouse-project/datasets/source_crm/cust_info.csv' WITH (FORMAT csv, HEADER true)
SELECT clock_timestamp() AS end_time, clock_timestamp() - :'start_time'::timestamptz AS load_duration \gset
\echo End time: :end_time
\echo Load duration: :load_duration

SELECT clock_timestamp() AS start_time \gset
\echo Start time: :start_time
\echo Truncating table: bronze.crm_prd_info
TRUNCATE TABLE bronze.crm_prd_info;
\echo Loading table: bronze.crm_prd_info
\copy bronze.crm_prd_info FROM 'D:/Skill courses/Job/sql-data-warehouse-project/datasets/source_crm/prd_info.csv' WITH (FORMAT csv, HEADER true)
SELECT clock_timestamp() AS end_time, clock_timestamp() - :'start_time'::timestamptz AS load_duration \gset
\echo End time: :end_time
\echo Load duration: :load_duration

SELECT clock_timestamp() AS start_time \gset
\echo Start time: :start_time
\echo Truncating table: bronze.crm_sales_details
TRUNCATE TABLE bronze.crm_sales_details;
\echo Loading table: bronze.crm_sales_details
\copy bronze.crm_sales_details FROM 'D:/Skill courses/Job/sql-data-warehouse-project/datasets/source_crm/sales_details.csv' WITH (FORMAT csv, HEADER true)
SELECT clock_timestamp() AS end_time, clock_timestamp() - :'start_time'::timestamptz AS load_duration \gset
\echo End time: :end_time
\echo Load duration: :load_duration

\echo ----------------------------------------------------------------
\echo Loading ERP Tables
\echo ----------------------------------------------------------------

SELECT clock_timestamp() AS start_time \gset
\echo Start time: :start_time
\echo Truncating table: bronze.erp_loc_a101
TRUNCATE TABLE bronze.erp_loc_a101;
\echo Loading table: bronze.erp_loc_a101
\copy bronze.erp_loc_a101 FROM 'D:/Skill courses/Job/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv' WITH (FORMAT csv, HEADER true)
SELECT clock_timestamp() AS end_time, clock_timestamp() - :'start_time'::timestamptz AS load_duration \gset
\echo End time: :end_time
\echo Load duration: :load_duration

SELECT clock_timestamp() AS start_time \gset
\echo Start time: :start_time
\echo Truncating table: bronze.erp_cust_az12
TRUNCATE TABLE bronze.erp_cust_az12;
\echo Loading table: bronze.erp_cust_az12
\copy bronze.erp_cust_az12 FROM 'D:/Skill courses/Job/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv' WITH (FORMAT csv, HEADER true)
SELECT clock_timestamp() AS end_time, clock_timestamp() - :'start_time'::timestamptz AS load_duration \gset
\echo End time: :end_time
\echo Load duration: :load_duration

SELECT clock_timestamp() AS start_time \gset
\echo Start time: :start_time
\echo Truncating table: bronze.erp_px_cat_g1v2
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
\echo Loading table: bronze.erp_px_cat_g1v2
\copy bronze.erp_px_cat_g1v2 FROM 'D:/Skill courses/Job/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv' WITH (FORMAT csv, HEADER true)
SELECT clock_timestamp() AS end_time, clock_timestamp() - :'start_time'::timestamptz AS load_duration \gset
\echo End time: :end_time
\echo Load duration: :load_duration

COMMIT;

SELECT clock_timestamp() AS batch_end_time, clock_timestamp() - :'batch_start_time'::timestamptz AS batch_duration \gset
\echo ================================================================
\echo Loading Bronze Layer completed
\echo Batch end time: :batch_end_time
\echo Total load duration: :batch_duration
\echo ================================================================
