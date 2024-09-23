select
customer_id, product_id, product_name
from(
    select
    o.customer_id, o.product_id, p.product_name,
    rank() over(partition by o.customer_id order by count(*) desc) as rnk
    from orders o inner join products p
    on o.product_id=p.product_id
    group by o.customer_id, o.product_id
)a
where a.rnk = 1