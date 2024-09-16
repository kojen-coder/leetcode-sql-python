select count(*) as n_customers_without_orders
from customers c left join orders o
on c.id = o.cust_id
where o.cust_id is null
;