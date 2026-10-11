
WITH diagnoses AS (SELECT * FROM {{ ref('stg_raw_encounter_diagnoses') }}),
   codes AS (SELECT * FROM {{ ref('stg_raw_diagnosis_codes') }})

   SELECT d.*, c.* except (diagnosis_id)
   FROM diagnoses AS d
   LEFT JOIN codes AS c on d.diagnosis_id = c.diagnosis_id
