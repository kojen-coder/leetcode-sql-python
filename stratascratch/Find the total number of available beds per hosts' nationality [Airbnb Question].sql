select h.nationality, sum(n_beds) as total_beds_available
from airbnb_apartments a inner join airbnb_hosts h
on a.host_id = h.host_id
group by h.nationality
order by total_beds_available desc
;