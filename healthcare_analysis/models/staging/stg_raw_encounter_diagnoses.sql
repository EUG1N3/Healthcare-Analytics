WITH source AS (SElECT * FROM `healthcare-analytics-510014.bronze.raw_encounter_diagnoses`)
SELECT encounter_diagnosis_id,
encounter_id,
diagnosis_id,
{{ standardized ('diagnosis_rank') }} AS diagnosis_rank
FROM source
