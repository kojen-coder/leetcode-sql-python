select
    p.name,
    avg(o.amount)
from postmates_orders o
    inner join postmates_markets m on o.city_id=m.id
    inner join postmates_partners p on p.id=o.seller_id
where m.name = 'Boston' and lower(p.name) like lower('%pizza%')
group by p.name
;