WITH source AS (
    SELECT * FROM `healthcare-analytics-510014.bronze.raw_providers`
)
SELECT
    provider_id,
    CONCAT (first_name, ' ', last_name) AS provider_name,
    npi_number,
    {{remove_white_spaces ('specialty')}} AS specialty,
    department_id,
    hire_date,
    is_active
FROM source
