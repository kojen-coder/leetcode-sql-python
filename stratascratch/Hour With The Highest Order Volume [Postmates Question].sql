with temp as(
    select
        extract(hour from order_timestamp_utc) as hour,
        count(id) as order_count,
        date(order_timestamp_utc) as order_date
    from
        postmates_orders
    group by hour, order_date
),
avg_hourly_orders as(
    select
        hour,
        avg(order_count) as avg_orders
    from temp
    group by hour
)

select *
from avg_hourly_orders
where avg_orders = (select max(avg_orders) from avg_hourly_orders)
;