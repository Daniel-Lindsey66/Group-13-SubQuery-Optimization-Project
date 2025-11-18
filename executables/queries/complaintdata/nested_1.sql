SELECT
    c1.city,
    c1.ticket_ID,
    (c1.create_date - c1.issue_date) AS delay_days,
    city_avg.avg_delay_in_city
FROM complaint_data_10 c1
JOIN (
    SELECT city,
           AVG(create_date - issue_date) AS avg_delay_in_city
    FROM complaint_data_10
    GROUP BY city
) AS city_avg
  ON c1.city = city_avg.city;