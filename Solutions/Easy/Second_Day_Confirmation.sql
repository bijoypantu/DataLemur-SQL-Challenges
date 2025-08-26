-- Second Day Confirmation(TikTok)
SELECT
  user_id
FROM emails e
JOIN texts t ON e.email_id = t.email_id
WHERE signup_action = 'Confirmed'
  AND (signup_date + INTERVAL '1 days') = action_date
