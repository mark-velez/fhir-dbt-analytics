


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
      CASE WHEN P.name IS NULL OR ARRAY_LENGTH(P.name) = 0 OR P.name[SAFE_OFFSET(0)].family IS NULL OR P.name[SAFE_OFFSET(0)].family = '' OR P.name[SAFE_OFFSET(0)].given IS NULL OR ARRAY_LENGTH(P.name[SAFE_OFFSET(0)].given) = 0 OR P.name[SAFE_OFFSET(0)].given[SAFE_OFFSET(0)] = '' THEN 1 ELSE 0 END AS patient_structured_name_missing

    FROM __dbt__cte__Patient AS P
  )
SELECT
  CURRENT_DATETIME() as execution_datetime,
  'patient_name_missing' AS metric_name,
  fhir_mapping,
  source_system,
  data_transfer_type,
  metric_date,
  site,
  CAST(active AS STRING) AS dimension_a,
  CAST(NULL AS STRING) AS dimension_b,
  CAST(NULL AS STRING) AS dimension_c,
  SUM(patient_structured_name_missing) AS numerator,
  COUNT(id) AS denominator,
  CAST(IF((COUNT(id)) != 0, (SUM(patient_structured_name_missing)) / (COUNT(id)), NULL) AS FLOAT64) AS measure
FROM A
GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10