SELECT
    c1.city,
    c1.ticket_ID,
    (c1.issue_date - c1.create_date) AS delay_days,
    (
        SELECT AVG(c2.issue_date - c2.create_date)
        FROM complaint_data_10 c2
        WHERE c2.city = c1.city         -- correlation
    ) AS avg_delay_in_city
FROM complaint_data_10 c1;