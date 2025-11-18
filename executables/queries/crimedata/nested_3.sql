SELECT DISTINCT c1.area,
       c1.area_name
FROM crimedata_10 c1
WHERE c1.area IN (
    SELECT area
    FROM crimedata_10
    GROUP BY area
    HAVING COUNT(*) > 100
);