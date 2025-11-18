SELECT
    c1.zip,
    c1.ticket_ID,
    c1.ticket_create_date,
    zm.max_zip_date
FROM complaint_data_10 c1
JOIN (
    SELECT zip,
           MAX(ticket_create_date) AS max_zip_date
    FROM complaint_data_10
    GROUP BY zip
) AS zm
  ON c1.zip = zm.zip;