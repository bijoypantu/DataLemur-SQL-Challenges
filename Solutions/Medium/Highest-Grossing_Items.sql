-- Highest-Grossing Items (Amazon)
SELECT
  category,
  product,
  total_spend
FROM (
  SELECT
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS Rank,
    category,
    product,
    SUM(spend) AS total_spend
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product
  ORDER BY category, total_spend DESC
)t WHERE Rank <= 2;
