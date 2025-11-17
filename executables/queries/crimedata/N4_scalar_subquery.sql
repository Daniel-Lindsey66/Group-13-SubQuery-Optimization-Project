SELECT DISTINCT c1.area,
       c1.area_name,
       (
         SELECT COUNT(*)
         FROM crimedata c2
         WHERE c2.area = c1.area
       ) AS total_incidents
FROM crimedata c1;