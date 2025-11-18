SELECT *
FROM complaint_data_10
WHERE caller_id_num IN (
    SELECT caller_id_num
    FROM complaint_data_10
    WHERE caller_id_num IS NOT NULL
    GROUP BY caller_id_num
    HAVING COUNT(*) > 1
);