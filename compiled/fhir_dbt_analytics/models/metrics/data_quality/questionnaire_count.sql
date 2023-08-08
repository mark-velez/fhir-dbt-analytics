


WITH
   __dbt__cte__Questionnaire as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Questionnaire_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Questionnaire_view`
), A AS (
    SELECT
      id,
  fhir_mapping,
  source_system,
  data_transfer_type,
  metric_date,
  site,
      `group` AS questionnaire_group,
      status,
      version
    FROM __dbt__cte__Questionnaire
  )
SELECT
  CURRENT_DATETIME() as execution_datetime,
  'questionnaire_count' AS metric_name,
  fhir_mapping,
  source_system,
  data_transfer_type,
  metric_date,
  site,
  CAST(questionnaire_group.title AS STRING) AS dimension_a,
  CAST(status AS STRING) AS dimension_b,
  CAST(version AS STRING) AS dimension_c,
  CAST(NULL AS INT64) AS numerator,
  CAST(NULL AS INT64) AS denominator,
  CAST(COUNT(DISTINCT id) AS FLOAT64) AS measure
FROM A
GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10