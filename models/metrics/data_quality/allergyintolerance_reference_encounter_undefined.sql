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
      "description": "Proportion of AllergyIntolerance resources that do not have an encounter reference recorded",
      "short_description": "Allergy ref. Enc - unrecorded",
      "primary_resource": "AllergyIntolerance",
      "primary_fields": ['encounter.encounterId'],
      "secondary_resources": [],
      "calculation": "PROPORTION",
      "category": "Referential integrity",
      "metric_date_field": "AllergyIntolerance.recordedDate",
      "metric_date_description": "Allergy or intolerance recorded date",
      "dimension_a": "clinical_status",
      "dimension_a_description": "The clinical status of the allergy/intollerance (active | inactive | resolved)",
      "dimension_b": "verification_status",
      "dimension_b_description": "The verification status of the allergy/intollerance (unconfirmed | confirmed | refuted | entered-in-error)",
    }
) -}}

-- depends_on: {{ ref('AllergyIntolerance') }}
{%- if fhir_resource_exists(model_metadata('primary_resource'))
    and column_exists(model_metadata('primary_fields')[0])
%}

WITH
  A AS (
    SELECT
      id,
      {{- metric_common_dimensions() }}
      {{ try_code_from_codeableconcept('clinicalStatus', 'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical') }} AS clinical_status,
      {{ try_code_from_codeableconcept('verificationStatus', 'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification' ) }} AS verification_status,
      CASE WHEN encounter.encounterId IS NULL OR encounter.encounterId = '' THEN 1 ELSE 0 END AS reference_encounter_undefined
    FROM {{ ref('AllergyIntolerance') }} AS A
  )
{{ calculate_metric(
      numerator = 'SUM(reference_encounter_undefined)',
      denominator = 'COUNT(id)'
) }}

{%- else %}
{{- empty_metric_output() -}}
{%- endif -%}