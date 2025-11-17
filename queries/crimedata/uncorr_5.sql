

WITH id_theft_areas AS (
    SELECT DISTINCT area
    FROM crimedata_10
    WHERE crm_cd_desc = 'UNAUTHORIZED COMPUTER ACCESS'
)
SELECT c1.*
FROM crimedata_10 c1
LEFT JOIN id_theft_areas ita
  ON c1.area = ita.area
WHERE ita.area IS NULL;