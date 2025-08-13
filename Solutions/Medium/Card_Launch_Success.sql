-- Card Launch Success (JPMorgan)
SELECT
  card_name,
  issued_amount
FROM (
  SELECT
    ROW_NUMBER() OVER(PARTITION BY card_name ORDER BY issue_year,issue_month) AS Rank,
    card_name,
    issued_amount
  FROM monthly_cards_issued
)t
WHERE Rank = 1
ORDER BY issued_amount DESC;
