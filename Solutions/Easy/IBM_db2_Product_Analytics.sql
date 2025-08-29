-- IBM db2 Product Analytics
WITH CTE AS (
  SELECT
    employee_id,
    query_id
  FROM queries
  WHERE EXTRACT(YEAR FROM query_starttime) = 2023 AND
    EXTRACT(MONTH FROM query_starttime) BETWEEN 7 AND 9
)

SELECT
  t.unique_queries,
  COUNT(t.employee_id) AS employee_count
FROM (
  SELECT
    e.employee_id,
    COUNT(query_id) AS unique_queries
  FROM employees e 
  LEFT JOIN CTE c ON e.employee_id = c.employee_id
  GROUP BY e.employee_id
)t GROUP BY unique_queries
ORDER BY unique_queries
