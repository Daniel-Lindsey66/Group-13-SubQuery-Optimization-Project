SELECT c1.*
FROM crimedata c1
WHERE c1.vict_age > (
    SELECT AVG(c2.vict_age)
    FROM crimedata c2
    WHERE c2.area = c1.area
);