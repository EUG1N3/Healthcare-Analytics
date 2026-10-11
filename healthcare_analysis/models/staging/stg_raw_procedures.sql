WITH source AS(SELECT * FROM `healthcare-analytics-510014.Raw.raw_procedures`)
SELECT procedure_id, 
procedure_code, 
{{remove_white_spaces('procedure_description')}} AS procedure_description,
ROUND(standard_charge, 2) AS standard_charge
FROM source