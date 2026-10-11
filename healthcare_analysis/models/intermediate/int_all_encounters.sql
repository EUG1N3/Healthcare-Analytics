WITH re AS (SELECT * FROM {{ref("stg_raw_encounters")}}),
rep AS (SELECT * FROM {{ref("stg_raw_encounter_procedures")}}),
rp AS (SELECT * FROM {{ref("stg_raw_procedures")}}),
joined_re_rep AS (SELECT re.*, rep.* except(encounter_id)
FROM re
LEFT JOIN rep
ON re.encounter_id = rep.encounter_id)

SELECT j.*, rp.* except (procedure_id)
FROM joined_re_rep AS j
LEFT JOIN rp 
ON j.procedure_id = rp.procedure_id






