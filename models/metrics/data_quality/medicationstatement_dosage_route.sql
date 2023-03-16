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
      "description": "Proportion of medication statements with dosage route recorded",
      "short_description": "MedState route recorded",
      "primary_resource": "MedicationStatement",
      "primary_fields": ['dosageInstruction.route'],
      "secondary_resources": [],
      "calculation": "PROPORTION",
      "category": "Data completeness",
      "metric_date_field": "MedicationStatement.dateAsserted",
      "metric_date_description": "Medication statement asserted date",
    }
) -}}

{%- set metric_sql -%}
    SELECT
      {{- metric_common_dimensions() }}
      M.id,
      IF(dosage[SAFE_OFFSET(0)].route IS NOT NULL, 1, 0) AS has_dosage_route
    FROM {{ ref('MedicationStatement') }} AS M
{%- endset -%}

{{- calculate_metric(
    metric_sql,
    numerator = 'SUM(has_dosage_route)',
    denominator = 'COUNT(id)'
) -}}