SELECT DISTINCT c1.area,
       c1.area_name
FROM crimedata_10 c1
WHERE (
    SELECT COUNT(*)
    FROM crimedata_10 c2
    WHERE c2.area = c1.area
) > 100;