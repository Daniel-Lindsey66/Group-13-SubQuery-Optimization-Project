WITH zip_counts AS (
    SELECT zip, COUNT(*) AS complaints_in_zip
    FROM complaint_data_10
    GROUP BY zip
)
SELECT
    c1.zip,
    c1.ticket_ID,
    zc.complaints_in_zip
FROM complaint_data_10 c1
JOIN zip_counts zc
  ON c1.zip = zc.zip;