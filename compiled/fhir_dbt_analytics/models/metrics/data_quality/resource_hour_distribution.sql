
with __dbt__cte__Encounter as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Encounter_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Encounter_view`
),  __dbt__cte__AllergyIntolerance as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`AllergyIntolerance_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`AllergyIntolerance_view`
),  __dbt__cte__Composition as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Composition_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Composition_view`
),  __dbt__cte__Condition as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Condition_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Condition_view`
),  __dbt__cte__DiagnosticReport as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`DiagnosticReport_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`DiagnosticReport_view`
),  __dbt__cte__DocumentReference as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`DocumentReference_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`DocumentReference_view`
),  __dbt__cte__MedicationRequest as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`MedicationRequest_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`MedicationRequest_view`
),  __dbt__cte__MedicationAdministration as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`MedicationAdministration_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`MedicationAdministration_view`
),  __dbt__cte__MedicationStatement as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`MedicationStatement_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`MedicationStatement_view`
),  __dbt__cte__Observation as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Observation_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Observation_view`
),  __dbt__cte__Procedure as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Procedure_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`Procedure_view`
),  __dbt__cte__ServiceRequest as (


-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`ServiceRequest_view`
SELECT * FROM `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`ServiceRequest_view`
) SELECT
  CURRENT_DATETIME() as execution_datetime,
  'resource_hour_distribution' AS metric_name,
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