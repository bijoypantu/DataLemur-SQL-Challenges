-- Pharmacy Analytics (Part 2)(CVS Health)
SELECT
  manufacturer,
  COUNT(drug) AS drug_count,
  ABS(SUM(profit_loss)) AS total_loss
FROM (
  SELECT
    manufacturer,
    drug,
    (total_sales - cogs) AS profit_loss
  FROM pharmacy_sales
  WHERE (total_sales - cogs) < 0
)t 
GROUP BY manufacturer
ORDER BY total_loss DESC;