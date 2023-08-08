{{ config(
    meta = {
      "description": "QuestionnaireResponse records with invalid answer choices",
      "short_description": "QuestionnaireResponse invalid choice",
      "primary_resource": "QuestionnaireResponse",
      "primary_fields": ['id'],
      "secondary_resources": ['Questionnaire']
    }
) -}}

WITH answer_key_by_linkId AS (
SELECT
 questionnaireId,
 linkId,
 ARRAY_AGG(STRUCT(system, code, display)) AS answer_key
FROM {{ ref('questionnaire_answer_key') }}
GROUP BY questionnaireId, linkId
)

SELECT
  I.questionnaireResponseId,
  I.linkId      AS provided_linkId,
  I.text        AS provided_text,
  I.system      AS provided_system,
  I.code        AS provided_code,
  I.display     AS provided_display,
  KL.answer_key AS expected_answer_key
FROM {{ ref('questionnaireresponse_answer_index') }} AS I
JOIN answer_key_by_linkId AS KL
  USING (questionnaireId, linkId)
LEFT JOIN {{ ref('questionnaire_answer_key') }} AS K
  USING (questionnaireId, linkId, code, display)
WHERE
  K.display IS NULL
