


with __dbt__cte__Composition as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Composition_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Composition_view`
) SELECT
  CURRENT_DATETIME() as execution_datetime,
  'composition_reference_practitioner_undefined' AS metric_name,
  CAST(NULL AS STRING) AS fhir_mapping,
  'DRC-PPI' AS source_system,
  'BigQuery' AS data_transfer_type,
  CAST(NULL AS DATE) AS metric_date,
  'DRC PPI' AS site,
  CAST(NULL AS STRING) AS dimension_a,
  CAST(NULL AS STRING) AS dimension_b,
  CAST(NULL AS STRING) AS dimension_c,
  CAST(NULL AS INT64) AS numerator,
  CAST(NULL AS INT64) AS denominator,
  CAST(NULL AS FLOAT64) AS measure