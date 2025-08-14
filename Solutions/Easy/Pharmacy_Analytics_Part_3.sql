SELECT
  manufacturer,
  CONCAT('$', sales, ' million') AS sale
FROM (
  SELECT
    manufacturer,
    ROUND(SUM(total_sales)/1000000, 0) AS sales
  FROM pharmacy_sales
  GROUP BY manufacturer
)t
ORDER BY sales DESC, manufacturer DESC;
