SELECT *
FROM crimedata c1
WHERE EXISTS (
    SELECT 1
    FROM crimedata c2
    WHERE c2.crm_cd = c1.crm_cd
);