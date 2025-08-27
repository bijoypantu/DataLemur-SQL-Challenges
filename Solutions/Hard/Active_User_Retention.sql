-- Active User Retention (Facebook)
SELECT
  7 as month,
  COUNT(user_id) AS monthly_active_users
FROM (
  SELECT
    user_id,
    COUNT(event_type) FILTER(WHERE EXTRACT(MONTH FROM event_date) = 7) AS Curr,
    COUNT(event_type) FILTER(WHERE EXTRACT(MONTH FROM event_date) = 6) AS Prev
  FROM user_actions
  WHERE EXTRACT(YEAR FROM event_date) = 2022
  GROUP BY user_id
)t WHERE Curr >= 1 AND Prev >= 1;
