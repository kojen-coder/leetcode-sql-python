with temp as(
    select
    u.id, count(*) as comment_count
    from fb_users u inner join fb_comments c
    on u.id = c.user_id
    where c.created_at >= u.joined_at and u.joined_at >= '2018-01-01' and u.joined_at <= '2020-02-01'
    and date_format(c.created_at, '%Y-%m') = '2020-01'
    group by 1
)

select
comment_count, count(*) as user_cnt
from temp
group by 1
order by 1

