select customer_id, count
from(
    select
        customer_id,
        count(event_id),
        rank() over(order by count(event_id)) as rnk
    from fact_events
    where client_id = 'mobile'
    group by customer_id
)sub
where rnk <= 2
;