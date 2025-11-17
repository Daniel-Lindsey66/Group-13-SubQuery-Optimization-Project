SELECT c1.*
FROM crimedata c1
JOIN (
    SELECT DISTINCT crm_cd
    FROM crimedata
) AS codes
  ON c1.crm_cd = codes.crm_cd;