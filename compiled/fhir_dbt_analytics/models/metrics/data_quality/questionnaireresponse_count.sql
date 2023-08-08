


WITH
   __dbt__cte__QuestionnaireResponse as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`QuestionnaireResponse_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`QuestionnaireResponse_view`
),  __dbt__cte__Questionnaire as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Questionnaire_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Questionnaire_view`
), A AS (
    SELECT
      QR.id,
  QR.fhir_mapping,
  QR.source_system,
  QR.data_transfer_type,
  QR.metric_date,
  QR.site,
      Q.`group` AS questionnaire_group,
      QR.status
    FROM __dbt__cte__QuestionnaireResponse QR
    LEFT JOIN __dbt__cte__Questionnaire Q
    ON QR.questionnaire.questionnaireId = Q.id
  )
SELECT
  CURRENT_DATETIME() as execution_datetime,
  'questionnaireresponse_count' AS metric_name,
  fhir_mapping,
  source_system,
  data_transfer_type,
  metric_date,
  site,
  CAST(questionnaire_group.title AS STRING) AS dimension_a,
  CAST(status AS STRING) AS dimension_b,
  CAST(NULL AS STRING) AS dimension_c,
  CAST(NULL AS INT64) AS numerator,
  CAST(NULL AS INT64) AS denominator,
  CAST(COUNT(DISTINCT id) AS FLOAT64) AS measure
FROM A
GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10