select count(distinct h.host_id)
from airbnb_hosts h inner join airbnb_apartments a
on h.host_id = a.host_id
where h.nationality != a.country

;