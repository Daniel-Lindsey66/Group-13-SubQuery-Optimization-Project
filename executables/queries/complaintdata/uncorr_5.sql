WITH repeat_callers AS (
    SELECT caller_id_num
    FROM complaint_data_10
    WHERE caller_id_num IS NOT NULL
    GROUP BY caller_id_num
    HAVING COUNT(*) > 1
)
SELECT c1.*
FROM complaint_data_10 c1
JOIN repeat_callers rc
  ON c1.caller_id_num = rc.caller_id_num;