WITH source AS(SELECT * FROM `healthcare-analytics-510014.Raw.raw_departments`)
SELECT department_id, 
{{ remove_white_spaces ('department_name')}} AS department_name, 
{{ remove_white_spaces ('location')}} AS location,
{{ remove_white_spaces ('department_type')}} AS department_type
FROM source