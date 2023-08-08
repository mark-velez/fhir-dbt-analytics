

-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
SELECT
  CAST(NULL AS STRING) AS id,
  STRUCT('no_data' AS patientId) AS subject,
  CAST(NULL AS STRING) AS fhir_mapping,
  CAST(NULL AS DATE) AS metric_date,
  CAST(NULL AS TIMESTAMP) AS metric_hour,
  'DRC-PPI' AS source_system,
  'DRC PPI' AS site,
  'BigQuery' AS data_transfer_type