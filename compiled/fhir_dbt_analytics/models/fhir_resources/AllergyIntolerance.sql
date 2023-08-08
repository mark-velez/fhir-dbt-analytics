

-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`AllergyIntolerance_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`AllergyIntolerance_view`