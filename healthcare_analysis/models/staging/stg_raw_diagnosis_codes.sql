WITH source AS (SELECT * FROM `healthcare-analytics-510014.bronze.raw_diagnosis_codes`)
SELECT diagnosis_id, 
icd10_code,
diagnosis_description,
{{ remove_white_spaces ('diagnosis_category') }} AS diagnosis_category
FROM source