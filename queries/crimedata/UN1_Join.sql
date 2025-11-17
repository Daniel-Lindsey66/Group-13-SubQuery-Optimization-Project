SELECT c1.*
FROM crimedata c1
JOIN (
    SELECT DISTINCT area
    FROM crimedata
    WHERE vict_age > 50
) x ON c1.area = x.area;