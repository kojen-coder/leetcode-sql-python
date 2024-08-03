select
sum(case when c.address is not null then 1 end) * 100 / count (*) as percent_shipable
from
    orders o inner join customers c
    on o.cust_id = c.id
;