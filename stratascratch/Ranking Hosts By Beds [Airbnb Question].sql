select
    host_id,
    sum(n_beds) as total,
    dense_rank() over(order by sum(n_beds) desc) as rank
from airbnb_apartments
group by host_id
;