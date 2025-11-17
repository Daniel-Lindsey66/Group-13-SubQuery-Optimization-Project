SELECT c1.*
FROM complaint_data_10 c1
WHERE (c1.issue_date - c1.create_date) > (
    SELECT AVG(c2.issue_date - c2.create_date)
    FROM complaint_data_10 c2
    WHERE c2.city = c1.city
);