select
    client_id,
    count(distinct user_id) as count
from
    fact_events
where user_id in (
    select user_id
    from fact_events
    group by user_id
    having count(distinct client_id) = 1
)
group by client_id
;