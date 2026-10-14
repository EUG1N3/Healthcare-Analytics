WITH source AS(SELECT * FROM `healthcare-analytics-510014.bronze.raw_encounter_procedures`)
SELECT encounter_procedure_id,
encounter_id,
procedure_id,
quantity AS times_performed,
performed_date
FROM source