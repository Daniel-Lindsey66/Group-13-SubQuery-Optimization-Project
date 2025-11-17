WITH city_total AS (
    SELECT city, COUNT(*) AS total_complaints
    FROM complaint_data_10
    GROUP BY city
),
city_online AS (
    SELECT city, COUNT(*) AS online_complaints
    FROM complaint_data_10
    WHERE submit_method = 'Internet (VOIP)'
    GROUP BY city
)
SELECT ct.city,
       ct.total_complaints
FROM city_total ct
LEFT JOIN city_online co
  ON ct.city = co.city
WHERE ct.total_complaints > COALESCE(co.online_complaints, 0);