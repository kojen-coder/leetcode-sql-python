with frienship_clean as(
select distinct user_name1, user_name2
from friendships
),

friendship_expand as(
select user_name1, user_name2
from frienship_clean
union all
select user_name2 as user_name1, user_name1 as user_name2
from frienship_clean
),

likes_posts_joined as(
select l.user_name, l.post_id, l.date_liked, p.user_name as poster_name
from likes l
inner join user_posts p on l.post_id=p.post_id
where l.date_liked is not null
),

friends_likes as(
select lp.user_name, lp.post_id, lp.date_liked, lp.poster_name
from friendship_expand fe inner join likes_posts_joined lp on fe.user_name1 = lp.user_name and lp.poster_name = fe.user_name2
)

select date_liked, count(user_name) as likes
from friends_likes
where extract(dow from date_liked) = 5
group by date_liked


;