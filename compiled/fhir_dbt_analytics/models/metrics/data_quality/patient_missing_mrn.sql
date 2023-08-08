
WITH
   __dbt__cte__Patient as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Patient_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Patient_view`
), A AS (
    SELECT
      id,
  fhir_mapping,
  source_system,
  data_transfer_type,
  metric_date,
  site,
      CAST(active AS STRING) AS active,
      1 AS patient_missing_mrn
    FROM __dbt__cte__Patient AS P
  )
SELECT
  CURRENT_DATETIME() as execution_datetime,
  'patient_missing_mrn' AS metric_name,
  fhir_mapping,
  source_system,
  data_transfer_type,
  metric_date,
  site,
  CAST(active AS STRING) AS dimension_a,
  CAST(NULL AS STRING) AS dimension_b,
  CAST(NULL AS STRING) AS dimension_c,
  SUM(patient_missing_mrn) AS numerator,
  COUNT(id) AS denominator,
  CAST(IF((COUNT(id)) != 0, (SUM(patient_missing_mrn)) / (COUNT(id)), NULL) AS FLOAT64) AS measure
FROM A
GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10