SELECT c1.*
FROM crimedata_10 c1
WHERE EXISTS (
    SELECT 1
    FROM crimedata_10 c2
    WHERE c2.area = c1.area
      AND c2.crm_cd_desc = 'THEFT OF IDENTITY'
);