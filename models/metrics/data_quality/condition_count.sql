{#
/* Copyright 2022 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. */
#}

{{ config(
    meta = {
      "description": "Count of valid Condition resources",
      "short_description": "Condition resources",
      "primary_resource": "Condition",
      "primary_fields": ['id'],
      "secondary_resources": [],
      "calculation": "COUNT",
      "category": "Resource count",
      "metric_date_field": "Condition.recordedDate",
      "metric_date_description": "Condition recorded date",
      "dimension_a_name": "Clinical status",
      "dimension_a_description": "The clinical status of the condition (active | recurrence | relapse | inactive | remission | resolved)",
      "dimension_b_name": "Verification status",
      "dimension_b_description": "The verification status of the condition (unconfirmed | provisional | differential | confirmed | refuted | entered-in-error)",
      "dimension_c_name": "Category",
      "dimension_c_description": "The category of the condition (problem-list-item | encounter-diagnosis)",
    }
) -}}

-- depends_on: {{ ref('Condition') }}
{%- if fhir_resource_exists('Condition') %}

WITH
  A AS (
    SELECT
      id,
      fhir_mapping,
      metric_date,
      source_system,
      site,
      data_transfer_type,
      {{ try_code_from_codeableconcept('clinicalStatus', 'http://terminology.hl7.org/CodeSystem/condition-clinical') }} AS clinical_status,
      {{ try_code_from_codeableconcept('verificationStatus', 'http://terminology.hl7.org/CodeSystem/condition-ver-status') }} AS verification_status,
      {{ try_code_from_codeableconcept('category', 'http://terminology.hl7.org/CodeSystem/condition-category', index = 0) }} AS category
    FROM {{ ref('Condition') }}
  )
SELECT
  CURRENT_DATETIME() as execution_datetime,
  '{{this.name}}' AS metric_name,
  fhir_mapping AS fhir_mapping,
  source_system AS source_system,
  data_transfer_type AS data_transfer_type,
  metric_date AS metric_date,
  site AS site,
  CAST(clinical_status AS STRING) AS slice_a,
  CAST(verification_status AS STRING) AS slice_b,
  CAST(category AS STRING) AS slice_c,
  NULL AS numerator,
  COUNT(DISTINCT id) AS denominator_cohort,
  CAST(COUNT(DISTINCT id) AS FLOAT64) AS measure
FROM A
GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

{%- else %}
{{- empty_metric_output() -}}
{%- endif -%}