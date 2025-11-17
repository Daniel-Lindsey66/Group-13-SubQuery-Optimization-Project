WITH area_avg AS (
    SELECT area, AVG(vict_age) AS avg_age
    FROM crimedata_10
    GROUP BY area
)
SELECT c1.*
FROM crimedata_10 c1
JOIN area_avg a ON c1.area = a.area
WHERE c1.vict_age > a.avg_age;