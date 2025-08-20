-- Cities With Completed Trades (Robinhood)
SELECT
  city,
  COUNT(CASE WHEN status = 'Completed' THEN 1 END) AS total_orders
FROM trades t 
JOIN users u ON t.user_id = u.user_id
GROUP BY city
ORDER BY total_orders DESC
LIMIT 3;
