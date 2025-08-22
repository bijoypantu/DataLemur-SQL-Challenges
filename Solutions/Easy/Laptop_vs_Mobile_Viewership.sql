-- Laptop vs. Mobile Viewership
SELECT
    COUNT(user_id) FILTER (WHERE device_type = 'laptop') AS laptop_views,
    COUNT(user_id) FILTER (WHERE device_type IN ('tablet', 'phone')) AS mobile_views
FROM viewership;
