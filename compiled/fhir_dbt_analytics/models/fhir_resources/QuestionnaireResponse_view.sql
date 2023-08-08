

-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`fhir_table_list`
-- depends_on: `aou-datawarehouse-sandbox`.`mv2451_ppi_001`.`site_timezones`
SELECT
    *,
    CAST(NULL AS STRING) AS fhir_mapping,IF(
      CHAR_LENGTH(authored) = 10,
      
    safe_cast(authored as date)
,
      DATE(
            safe_cast(authored as TIMESTAMP)
        , 'America/New_York')
    ) AS metric_date,IF(
      CHAR_LENGTH(authored) = 10,
      
    safe_cast(NULL as TIMESTAMP)
,
      TIMESTAMP_TRUNC(
    safe_cast(authored as TIMESTAMP)
, hour, 'America/New_York')
    ) AS metric_hour,
    'DRC-PPI' AS source_system,
    'DRC PPI' AS site,
    'BigQuery' AS data_transfer_type
FROM `aou-datawarehouse-sandbox`.`ppi_001`.`QuestionnaireResponse`
