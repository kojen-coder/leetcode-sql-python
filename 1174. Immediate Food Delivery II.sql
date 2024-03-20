select
round(sum(if(order_date=customer_pref_delivery_date, 1, 0)) /
    count(distinct customer_id) * 100, 2) as immediate_percentage # bc there might be multiple first dates for a customer
from delivery
where (customer_id, order_date) in
(
    select
    customer_id,
    min(order_date) as order_date
    from delivery
    group by customer_id
)
