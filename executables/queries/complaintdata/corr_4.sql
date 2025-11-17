SELECT
    c1.zip,
    c1.ticket_ID,
    (
        SELECT COUNT(*)
        FROM complaint_data_10 c2
        WHERE c2.zip = c1.zip        -- correlation
    ) AS complaints_in_zip
FROM complaint_data_10 c1;