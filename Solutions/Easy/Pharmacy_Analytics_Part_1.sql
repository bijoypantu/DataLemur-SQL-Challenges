-- Pharmacy Analytics (Part 1)(CVS Health)
SELECT
  drug,
  (total_sales - cogs) as total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;