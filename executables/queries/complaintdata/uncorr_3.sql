WITH zip_max AS (
    SELECT zip, MAX(ticket_create_date) AS max_zip_date
    FROM complaint_data_10
    GROUP BY zip
)
SELECT
    c1.zip,
    c1.ticket_ID,
    c1.ticket_create_date,
    zm.max_zip_date
FROM complaint_data_10 c1
JOIN zip_max zm
  ON c1.zip = zm.zip;