# Authorization Leakage Example

Decorrelating/unnesting a subquery in a database that has enabled row security policy may cause information leakage. This is due to how the *has_row_priviledge* function may be pushed to a different level of the query which causes it to execute differently than intended.  

For example:  

**Correlated Version (Safe):** *has_row_priviledge* is evaluated per row due to correlation

    > SELECT c1.area,
    >       EXISTS (
    >           SELECT 1
    >           FROM crimedata_10 c2
    >           WHERE c2.area = c1.area
    >           AND c2.crm_cd_desc = 'SECRET_CRIME'
    >           AND has_row_privilege(c2.id, current_user, 'SELECT')
    >       ) AS has_sensitive_crime
    > FROM crimedata_10 c1;

  **Decorrelated Version (Unsafe):** sensitive areas is materialized as a CTE, *has_row_priviledge* is only evaluated once and then is used for join

    > WITH sensitive_areas AS (
    >     SELECT DISTINCT area
    >     FROM crimedata_10
    >     WHERE crm_cd_desc = 'SECRET_CRIME'
    >     AND has_row_privilege(id, current_user, 'SELECT')
    > )
    > SELECT c1.area,
    >        (c1.area IN (SELECT area FROM sensitive_areas)) AS has_sensitive_crime
    > FROM crimedata_10 c1;
