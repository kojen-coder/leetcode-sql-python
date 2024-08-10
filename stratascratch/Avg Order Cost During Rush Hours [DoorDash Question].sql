select
    extract(hour from customer_placed_order_datetime) as order_hour,
    avg(order_total - discount_amount + tip_amount - refunded_amount) as avg_earnings
from delivery_details
where
    extract(hour from customer_placed_order_datetime) >= 15 and
    extract(hour from customer_placed_order_datetime) <= 17 and
    delivery_region = 'San Jose'
group by extract(hour from customer_placed_order_datetime)
;