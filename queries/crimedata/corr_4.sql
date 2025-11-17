SELECT c1.*
FROM crimedata_10 c1
WHERE c1.date_occ = (
    SELECT MAX(c2.date_occ)
    FROM crimedata_10 c2
    WHERE c2.area = c1.area
);