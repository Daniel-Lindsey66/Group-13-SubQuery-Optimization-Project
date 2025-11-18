SELECT *
FROM crimedata_10
WHERE area NOT IN (
    SELECT DISTINCT area
    FROM crimedata_10
    WHERE crm_cd_desc = 'UNAUTHORIZED COMPUTER ACCESS'
);