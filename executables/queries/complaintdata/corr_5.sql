SELECT c1.*
FROM complaint_data_10 c1
WHERE EXISTS (
    SELECT 1
    FROM complaint_data_10 c2
    WHERE c2.caller_id_num = c1.caller_id_num   -- correlation
      AND c2.ticket_ID <> c1.ticket_ID
);