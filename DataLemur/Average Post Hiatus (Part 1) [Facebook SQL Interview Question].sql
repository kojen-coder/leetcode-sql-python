SELECT
user_id,
max(date(post_date)) - min(date(post_date)) as days_between
FROM posts
where extract(year from post_date) = 2021
group by user_id
having count(*) > 1;