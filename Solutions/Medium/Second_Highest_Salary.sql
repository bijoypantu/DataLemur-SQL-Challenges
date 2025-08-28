-- Second Highest Salary (FAANG)
SELECT
  salary AS second_highest_salary
FROM (
  SELECT
    DENSE_RANK() OVER(ORDER BY salary DESC) AS Rank,
    salary
  FROM employee
)t WHERE Rank = 2
LIMIT 1;
