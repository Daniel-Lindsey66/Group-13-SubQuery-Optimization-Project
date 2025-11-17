SELECT c1.area,
       c1.area_name,
       agg.total_incidents
FROM crimedata c1
JOIN (
    SELECT area, COUNT(*) AS total_incidents
    FROM crimedata
    GROUP BY area
) agg ON c1.area = agg.area;