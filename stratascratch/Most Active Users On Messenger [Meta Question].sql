with temp as(
    select user1, msg_count
    from fb_messages
    union all
    select user2 as user1, msg_count
    from fb_messages
),
ranking as(
    select user1, sum(msg_count) as msg_count,
    rank() over(order by sum(msg_count) desc) as rnk
    from temp
    group by user1
)

select user1, msg_count from ranking where rnk <= 10
;