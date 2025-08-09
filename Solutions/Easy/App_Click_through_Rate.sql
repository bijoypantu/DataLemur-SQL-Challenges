-- App Click-through Rate (CTR) (Facebook)
SELECT
  app_id,
  ROUND((100.0 * click / impression), 2) AS ctr
FROM (
  SELECT
    app_id,
    COUNT(CASE WHEN event_type = 'impression' THEN 1 END) AS impression,
    COUNT(CASE WHEN event_type = 'click' THEN 1 END) AS click
  FROM events
  WHERE EXTRACT(YEAR FROM timestamp) = 2022
  GROUP BY app_id
)t