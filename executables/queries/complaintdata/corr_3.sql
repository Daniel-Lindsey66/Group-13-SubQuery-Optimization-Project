SELECT
    c1.zip,
    c1.ticket_ID,
    c1.ticket_create_date,
    zinfo.max_zip_date
FROM complaint_data_10 c1
CROSS JOIN LATERAL (
    SELECT MAX(c2.ticket_create_date) AS max_zip_date
    FROM complaint_data_10 c2
    WHERE c2.zip = c1.zip           
) AS zinfo;