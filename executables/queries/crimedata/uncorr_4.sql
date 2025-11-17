WITH area_max_date AS (
    SELECT area, MAX(date_occ) AS max_date
    FROM crimedata_10
    GROUP BY area
)
SELECT c1.*
FROM crimedata_10 c1
JOIN area_max_date a
  ON c1.area = a.area
 AND c1.date_occ = a.max_date;