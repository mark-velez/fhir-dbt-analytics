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
      "description": "Proportion of DiagnosticReport resources that contain a binary reference that resolves",
      "short_description": "DR with binary content",
      "primary_resource": "DiagnosticReport",
      "primary_fields": ['presentedForm.url'],
      "secondary_resources": ['Binary'],
      "calculation": "PROPORTION",
      "category": "Referential integrity",
      "metric_date_field": "issued",
      "metric_date_description": "DiagnosticReport issued date",
      "dimension_a": "status",
      "dimension_a_description": "The report status  (preliminary | final | amended | entered-in-error +)",
      "dimension_b": "category",
      "dimension_b_description": "The service category of the diagnostic report",
    }
) -}}

{%- set metric_sql -%}
    SELECT
      id,
      {{- metric_common_dimensions() }}
      status as status,
      COALESCE({{ code_from_codeableconcept(
        'category',
        'https://g.co/fhir/harmonized/diagnostic_report/category',
        index = get_source_specific_category_index()
      ) }},
      {{ code_from_codeableconcept(
        'category',
        'http://snomed.info/sct,',
        index = get_source_specific_category_index()
      ) }},
       {{ code_from_codeableconcept(
        'category',
        'http://terminology.hl7.org/CodeSystem/v2-0074,',
        index = get_source_specific_category_index()
      ) }},
       {{ code_from_codeableconcept(
        'category',
        'http://loinc.org,',
        index = get_source_specific_category_index()
      ) }}, 'Undefined')
       AS category,
      {%- if column_exists('presentedForm.url') %}
      (
        SELECT SIGN(COUNT(*))
        FROM {{ ref('Binary') }} AS B
        WHERE
          SPLIT(D.{{ safe_offset("presentedForm", 0) }}.url,'/Binary/')[SAFE_OFFSET(1)] = B.id
      ) AS reference_binary_resolved
      {%- else %}
      0 AS reference_binary_resolved
      {%- endif %},

    FROM {{ ref('DiagnosticReport') }} AS D
{%- endset -%}

{{ calculate_metric(
    metric_sql,
    numerator = 'COUNT(id) - SUM(reference_binary_resolved)',
    denominator = 'COUNT(id)'
) }}