-- Sending vs. Opening Snaps (Snapchat)
SELECT
  age_bucket,
  ROUND( (send_time / (send_time + open_time)) * 100.0, 2) AS send_perc,
  ROUND( (open_time / (send_time + open_time)) * 100.0, 2) AS open_perc
FROM (
  SELECT
    age_bucket,
    SUM(CASE WHEN activity_type = 'send' THEN time_spent END) AS send_time,
    SUM(CASE WHEN activity_type = 'open' THEN time_spent END) AS open_time
  FROM activities act
  JOIN age_breakdown age ON act.user_id = age.user_id
  GROUP BY age_bucket
) t;