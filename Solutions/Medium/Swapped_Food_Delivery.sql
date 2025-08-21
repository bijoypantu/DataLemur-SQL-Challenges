-- Swapped Food Delivery
SELECT
  order_id AS corrected_order_id,
  CASE
    WHEN order_id = (SELECT MAX(order_id) FROM orders) THEN item
    WHEN order_id % 2 <> 0 THEN LEAD(item) OVER(ORDER BY order_id)
    WHEN order_id % 2 = 0 THEN LAG(item) OVER(ORDER BY order_id)
  END AS item
FROM orders;
