-- Duplicate Job Listings (LinkedIn)
SELECT
  COUNT(title) AS duplicate_companies
FROM (
  SELECT
    title,
    company_id,
    count(*) AS total_post
  FROM job_listings
  GROUP BY title, company_id
) t
WHERE total_post > 1;