select
customer_name, customer_id, order_id, order_date
from(
    select
    c.customer_id,
    c.name as customer_name,
    o.order_id,
    o.order_date,
    rank() over(partition by o.customer_id order by o.order_date desc) as rnk
    from customers c inner join orders o
    on c.customer_id = o.customer_id
)a
where rnk <=3
order by customer_name, customer_id, order_date desc