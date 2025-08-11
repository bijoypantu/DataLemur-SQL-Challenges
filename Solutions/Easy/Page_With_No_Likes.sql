-- Page With No Likes (Facebook)
SELECT
  page_id
FROM pages
EXCEPT
SELECT
  page_id
FROM page_likes
order by page_id;
