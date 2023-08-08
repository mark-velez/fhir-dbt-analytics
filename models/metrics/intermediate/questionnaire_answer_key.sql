{{ config(
    materialized='view',
    meta = {
      "description": "Allowed answer options for choice-type questions in all questionnaires",
      "short_description": "Questionnaire answer key",
      "primary_resource": "Questionnaire"
    }
) -}}

WITH all_questions AS (
    SELECT
      Q.id AS questionnaireId,
      Q.group.title,
      t.linkId,
      t.text,
      t.type,
      t.option
    FROM {{ ref('Questionnaire') }} Q, Q.group.question t
)
SELECT
  A.questionnaireId,
  A.title,
  A.linkId,
  A.text,
  choice_option.system,
  choice_option.code,
  choice_option.display,
FROM all_questions A, UNNEST(A.option) AS choice_option
WHERE A.type='choice'
