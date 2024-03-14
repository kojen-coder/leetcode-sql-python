select
product_name, product_id, order_id, order_date
from(
    select o.order_id, p.product_name, o.product_id, o.order_date,
    rank() over(partition by o.product_id order by o.order_date desc) as rnk
    from orders o inner join products p
    on o.product_id=p.product_id
)a
where rnk = 1
order by product_name, product_id, order_id