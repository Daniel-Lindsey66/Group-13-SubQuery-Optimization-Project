CREATE TABLE crimedata_10 AS
SELECT *
FROM crimedata
ORDER BY random()
LIMIT 2000;