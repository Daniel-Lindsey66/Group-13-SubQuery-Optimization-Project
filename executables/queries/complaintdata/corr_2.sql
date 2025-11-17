SELECT c1.city,
       COUNT(*) AS total_complaints
FROM complaint_data_10 c1
GROUP BY c1.city
HAVING COUNT(*) > (
    SELECT COUNT(*)
    FROM complaint_data_10 c2
    WHERE c2.city = c1.city
      AND c2.submit_method = 'Internet (VOIP)'
);