WITH source AS (SELECT * FROM `healthcare-analytics-510014.Raw.raw_payers`)
SELECT payer_id,
{{ standardized ('payer_name') }} AS payer_name,
{{ standardized ('payer_type') }} AS payer_type
FROM source