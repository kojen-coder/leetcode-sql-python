select s.salesperson_id, s.name, ifnull(sum(price), 0) as total
from salesperson s left join customer c on s.salesperson_id = c.salesperson_id
left join sales on sales.customer_id = c.customer_id
group by s.salesperson_id, s.name