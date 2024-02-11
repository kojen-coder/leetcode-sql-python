with cte as(
    select s.user_id, s.product_id, sum(s.quantity * p.price) as sale
    from sales s, product p where s.product_id = p.product_id
    group by user_id, product_id
)

select a.user_id, a.product_id
from(
    select user_id, product_id, sale,
    rank() over(partition by user_id order by sale desc) as rnk
    from cte
) a
where a.rnk = 1
