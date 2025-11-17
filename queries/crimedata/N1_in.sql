SELECT *
FROM crimedata
WHERE area IN (SELECT area FROM crimedata WHERE vict_age > 50);