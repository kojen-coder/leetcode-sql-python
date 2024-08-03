select
post_date,
sum(case when post_keywords like '%spam%' then 1 end) * 100 / count(*) as spam_share
from
    facebook_posts p right join facebook_post_views v
    on p.post_id = v.post_id
group by
    post_date
;