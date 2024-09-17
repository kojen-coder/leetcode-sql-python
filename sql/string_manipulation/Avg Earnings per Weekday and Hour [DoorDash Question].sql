select
    to_char(customer_placed_order_datetime, 'Day') as weekday,
    extract(hour from customer_placed_order_datetime) as hour,
    round(cast(avg(order_total - discount_amount + tip_amount - refunded_amount) as numeric), 2) as earnings
from doordash_delivery
group by
    to_char(customer_placed_order_datetime, 'Day'),
    extract(hour from customer_placed_order_datetime)
;
