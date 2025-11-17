WITH id_theft_areas AS (
    SELECT DISTINCT area
    FROM crimedata_10
    WHERE crm_cd_desc = 'THEFT OF IDENTITY'
)
SELECT c1.*
FROM crimedata_10 c1
JOIN id_theft_areas ita
  ON c1.area = ita.area;