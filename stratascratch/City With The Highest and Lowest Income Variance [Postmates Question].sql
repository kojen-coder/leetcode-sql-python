with temp as (select
    m.name,
    o.order_timestamp_utc::date,
    lag(sum(o.amount), 1) over(partition by m.name order by o.order_timestamp_utc::date desc) - sum(o.amount) as amount_difference
from
    postmates_orders o inner join postmates_markets m
    on o.city_id = m.id
group by 1, 2
)

select
    name,
    amount_difference
from
    temp
where
    amount_difference = (select max(amount_difference) from temp) or
    amount_difference = (select min(amount_difference) from temp)
group by
    name, amount_difference
;