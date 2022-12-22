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
      "description": "Proportion of DiagnosticReport resources that do not have a practitioner reference recorded",
      "short_description": "DiagRep ref. Prac - unrecorded",
      "primary_resource": "DiagnosticReport",
      "primary_fields": ['performer.PractitionerId'],
      "secondary_resources": [],
      "calculation": "PROPORTION",
      "category": "Referential integrity",
      "metric_date_field": "DiagnosticReport.issued",
      "metric_date_description": "Diagnostic report latest version issue date",
      "dimension_a": "status",
      "dimension_a_description": "The status of the diagnostic report (registered | partial | preliminary | final +)",
      "dimension_b": "category",
      "dimension_b_description": "The service category of the diagnostic report",
    }
) -}}

-- depends_on: {{ ref('DiagnosticReport') }}
{%- if fhir_resource_exists(model_metadata('primary_resource'))
    and column_exists(model_metadata('primary_fields')[0])
%}

WITH
  A AS (
    SELECT
      id,
      {{- metric_common_dimensions() }}
      status,
      {{ try_code_from_codeableconcept(
        'category',
        'https://g.co/fhir/harmonized/diagnostic_report/category',
        index = get_source_specific_category_index()
      ) }} AS category,
      (
        SELECT SIGN(COUNT(*))
        FROM UNNEST(D.performer) AS DP
        WHERE practitionerId IS NOT NULL
        AND practitionerId <> ''
      ) AS has_reference_practitioner
    FROM {{ ref('DiagnosticReport') }} AS D
  )
{{ calculate_metric(
    numerator = 'SUM(1 - has_reference_practitioner)',
    denominator = 'COUNT(id)'
) }}

{%- else %}
{{- empty_metric_output() -}}
{%- endif -%}