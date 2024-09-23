with temp as(
SELECT
user_id,
count(distinct tweet_id) as tweet_cnt
FROM tweets
where extract(year from tweet_date) = 2022
group by user_id
)

SELECT
tweet_cnt as tweet_bucket,
count(*) as user_num
from temp
group by tweet_cnt
;