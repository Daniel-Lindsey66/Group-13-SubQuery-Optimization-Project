SELECT *
FROM crimedata_10
WHERE (area, date_occ) IN (
    SELECT area, MAX(date_occ) AS max_date
    FROM crimedata_10
    GROUP BY area
);