WITH source AS(SELECT * FROM `healthcare-analytics-510014.bronze.raw_patients`)
SELECT patient_id,
INITCAP(TRIM(CONCAT(first_name, ' ', last_name))) AS patient_name,
CASE
    WHEN regexp_contains(date_of_birth, r'^\d{4}-\d{2}-\d{2}$')
        THEN parse_date('%Y-%m-%d', date_of_birth)
    WHEN regexp_contains(date_of_birth, r'^\d{2}-\d{2}-\d{4}$')
        THEN parse_date('%d-%m-%Y', date_of_birth)
    ELSE NULL
END AS date_of_birth,
CASE
    WHEN gender LIKE 'F%' THEN 'Female'
    WHEN gender LIKE 'f%' THEN 'Female'
    WHEN gender LIKE 'M%' THEN 'Male'
    WHEN gender LIKE 'm%' THEN 'Male'
    ELSE NULL
END AS gender,
{{ standardized ('state')}} AS county,
zip_code, 
payer_id, 
created_at,
is_active
FROM source
QUALIFY(ROW_NUMBER() OVER(PARTITION BY patient_id ORDER BY created_at DESC)) = 1

