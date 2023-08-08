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
      "description": "Count of valid Questionnaire resources",
      "short_description": "Questionnaire resources",
      "primary_resource": "Questionnaire",
      "primary_fields": ['id'],
      "secondary_resources": [],
      "calculation": "COUNT",
      "category": "Resource count",
      "metric_date_field": "Questionnaire.date",
      "metric_date_description": "Questionnaire date",
      "dimension_a": "questionnaire_group.title",
      "dimension_a_description": "The title of the questionnaire (The Basics | Lifestyle +)",
      "dimension_b": "status",
      "dimension_b_description": "The status of the questionnaire (published | +)",
      "dimension_c": "version",
      "dimension_c_description": "The version of the questionnaire ( V2022.11.17 | v2020.09.25 +)",
    }
) -}}

{%- set metric_sql -%}
    SELECT
      id,
      {{- metric_common_dimensions() }}
      `group` AS questionnaire_group,
      status,
      version
    FROM {{ ref('Questionnaire') }}
{%- endset -%}

{{ calculate_metric(metric_sql) }}