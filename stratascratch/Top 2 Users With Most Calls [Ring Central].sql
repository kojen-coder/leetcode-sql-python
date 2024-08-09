select company_id, user_id, rank
from (
    select
        u.company_id, u.user_id,
        dense_rank() over(partition by u.company_id order by count(call_id) desc) as rank
    from rc_calls c inner join rc_users u
        on c.user_id=u.user_id
    group by u.company_id, u.user_id
)sub
where rank <=2
;