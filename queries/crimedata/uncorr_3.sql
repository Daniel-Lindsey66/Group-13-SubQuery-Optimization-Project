WITH area_counts AS (
    SELECT area, COUNT(*) AS total_incidents
    FROM crimedata_10
    GROUP BY area
    HAVING COUNT(*) > 100
)
SELECT ac.area,
       MIN(c1.area_name) AS area_name
FROM area_counts ac
JOIN crimedata_10 c1
  ON c1.area = ac.area
GROUP BY ac.area;