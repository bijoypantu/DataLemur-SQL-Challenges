-- Top Three Salaries (FAANG)
SELECT
  department_name,
  name,
  salary
FROM (
  SELECT 
    DENSE_RANK() OVER(PARTITION BY d.department_id ORDER BY salary DESC) AS Ranks,
    department_name,
    name,
    salary
  FROM employee e
  JOIN department d ON e.department_id = d.department_id
)t WHERE Ranks <= 3
ORDER BY department_name, salary DESC, name;
