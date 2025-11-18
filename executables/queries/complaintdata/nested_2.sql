SELECT
    t.city,
    t.total_complaints
FROM (
    SELECT
        city,
        COUNT(*) AS total_complaints,
        COUNT(*) FILTER (WHERE submit_method = 'Internet (VOIP)') AS voip_complaints
    FROM complaint_data_10
    GROUP BY city
) AS t
WHERE t.total_complaints > t.voip_complaints;