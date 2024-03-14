select o.customer_id, c.customer_name
from customers c inner join orders o
on c.customer_id=o.customer_id
where o.product_name in ('A', 'B') and
o.customer_id not in (select customer_id from orders where product_name = 'C')
group by o.customer_id
having count(distinct product_name) = 2
order by customer_id