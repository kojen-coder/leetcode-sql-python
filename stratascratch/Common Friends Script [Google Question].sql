with temp as(
    select friend_id from friends
    where user_id in (
        select user_id
        from users
        where user_name = 'Karl'
    )
    intersect
    select friend_id from friends
    where user_id in (
        select user_id
        from users
        where user_name = 'Hans'
    )
)
select t.friend_id as user_id, u.user_name
from temp t inner join users u
on t.friend_id = u.user_id

;