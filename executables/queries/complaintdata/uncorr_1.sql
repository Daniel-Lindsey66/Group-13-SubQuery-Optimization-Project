WITH city_avg_delay AS (
    SELECT city,
           AVG(create_date - issue_date) AS avg_delay
    FROM complaint_data_10
    GROUP BY city
)
SELECT
    c1.city,
    c1.ticket_ID,
    (c1.create_date - c1.issue_date) AS delay_days,
    cad.avg_delay AS avg_delay_in_city
FROM complaint_data_10 c1
JOIN city_avg_delay cad
  ON c1.city = cad.city;