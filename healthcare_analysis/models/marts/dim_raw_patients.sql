WITH source AS (SELECT * FROM {{ref('stg_raw_patients')}})
SELECT * FROM source