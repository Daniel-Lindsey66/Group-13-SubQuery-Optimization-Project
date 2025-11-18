SELECT c1.*
FROM crimedata_10 c1
JOIN (
    SELECT area, AVG(vict_age) AS avg_age
    FROM crimedata_10
    GROUP BY area
) avg_per_area
  ON c1.area = avg_per_area.area
WHERE c1.vict_age > avg_per_area.avg_age;