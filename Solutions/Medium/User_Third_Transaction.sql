-- User's Third Transaction (Uber)
SELECT
  user_id,
  spend,
  transaction_date
FROM (
  SELECT
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS Rank,
    *
  FROM transactions
)t
WHERE Rank = 3
