{{ config(
    materialized='view',
    meta = {
      "description": "Coded answer values in all questionnaire responses",
      "short_description": "QuestionnaireResponse answer index",
      "primary_resource": "QuestionnaireResponse"
    }
) -}}

WITH all_responses AS (
    SELECT
      QR.id AS questionnaireResponseId,
      QR.questionnaire.questionnaireId,
      QR.group.title,
      t.linkId,
      t.text,
      t.answer
    FROM {{ ref('QuestionnaireResponse') }} QR, QR.group.question t
    -- it is a choice-type question
    WHERE EXISTS (
      SELECT 1
      FROM {{ ref('questionnaire_answer_key') }} k
      WHERE
            k.questionnaireId = QR.questionnaire.questionnaireId
        AND k.linkId = t.linkId
    )
  )
SELECT
 A.questionnaireResponseId,
 A.questionnaireId,
 A.title,
 A.linkId,
 A.text,
 answer.value.coding.system,
 answer.value.coding.code,
 answer.value.coding.display
FROM all_responses A, UNNEST(A.answer) AS answer