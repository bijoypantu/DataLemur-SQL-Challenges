-- Teams Power Users (Microsoft)
SELECT 
  sender_id,
  COUNT(message_id) AS message_count
FROM messages
WHERE sent_date >= '08/01/2022 00:00:00'
      AND sent_date <= '08/31/2022 00:00:00'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;