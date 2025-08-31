-- Supercloud Customer(Microsoft)
WITH total_categories AS (
  SELECT COUNT(DISTINCT product_category) AS total
  FROM products
)
SELECT cc.customer_id
FROM customer_contracts cc
JOIN products p ON cc.product_id = p.product_id
CROSS JOIN total_categories t
GROUP BY cc.customer_id, t.total
HAVING COUNT(DISTINCT p.product_category) = t.total;
