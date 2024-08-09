with temp as (
    select user_id
    from fact_events
    group by user_id
    having count(distinct client_id) = 1
)

select customer_id
from(
    select
    customer_id,
    rank() over(order by count(distinct user_id) desc) as rnk
    from
        fact_events
    where
        client_id = 'desktop' and
        user_id in (select user_id from temp)
    group by
        customer_id
)sub
where rnk = 1
;