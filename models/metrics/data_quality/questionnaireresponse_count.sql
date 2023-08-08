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
      "description": "Count of valid QuestionnaireResponse resources",
      "short_description": "QuestionnaireResponse resources",
      "primary_resource": "QuestionnaireResponse",
      "primary_fields": ['id'],
      "secondary_resources": ['Questionnaire'],
      "calculation": "COUNT",
      "category": "Resource count",
      "metric_date_field": "QuestionnaireResponse.authored",
      "metric_date_description": "QuestionnaireResponse authored",
      "dimension_a": "questionnaire_group.title",
      "dimension_a_description": "The title of the questionnaire (The Basics | Lifestyle +)",
      "dimension_b": "status",
      "dimension_b_description": "The status of the questionnaire response (completed | +)",
    }
) -}}

{%- set metric_sql -%}
    SELECT
      QR.id,
      {{- metric_common_dimensions(table_alias='QR') }}
      Q.`group` AS questionnaire_group,
      QR.status
    FROM {{ ref('QuestionnaireResponse') }} QR
    LEFT JOIN {{ ref('Questionnaire') }} Q
    ON QR.questionnaire.questionnaireId = Q.id
{%- endset -%}

{{ calculate_metric(metric_sql) }}