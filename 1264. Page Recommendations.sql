with temp as(
    select user1_id, user2_id
    from(
    select
    case when user1_id < user2_id then user1_id else user2_id end as user1_id,
    case when user1_id > user2_id then user1_id else user2_id end as user2_id
    from friendship
    )a
    where user1_id = 1
)

select distinct l.page_id as recommended_page
from temp t inner join likes l
on t.user2_id = l.user_id
where l.page_id not in (select page_id from likes where user_id = 1)