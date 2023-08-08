


 

SELECT
  table_catalog as bq_project,
  table_schema as bq_dataset,
  table_name as bq_table,
  CONCAT('`', table_catalog, '`.`', table_schema, '`.`', table_name, '`') AS fully_qualified_bq_table,
  table_name AS fhir_resource,
  NULL AS map_name,
  1 AS latest_version,
  creation_time
FROM `aou-datawarehouse-sandbox`.`ppi_001`.INFORMATION_SCHEMA.TABLES

