select purpose, sum(miles) as miles
from my_uber_drives
where category = 'Business'
group by purpose
order by sum(miles) desc
limit 3
;