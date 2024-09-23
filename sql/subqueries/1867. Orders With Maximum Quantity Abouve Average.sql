with tmp as(
select order_id, product_id, quantity, avg(quantity) over(partition by order_id) as max_q
from OrdersDetails
)

select distinct t.order_id
from tmp t
group by t.order_id
having max(t.quantity) > (select max(max_q) from tmp)