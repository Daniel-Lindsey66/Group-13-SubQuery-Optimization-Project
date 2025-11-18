SELECT *
FROM crimedata_10
WHERE area IN (
    SELECT DISTINCT area
    FROM crimedata_10
    WHERE crm_cd_desc = 'THEFT OF IDENTITY'
);