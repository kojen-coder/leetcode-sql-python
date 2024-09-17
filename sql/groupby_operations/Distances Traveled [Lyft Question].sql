select
    l.user_id,
    u.name,
    sum(distance) as distance
from lyft_rides_log l inner join lyft_users u
on l.user_id = u.id
group by l.user_id, u.name
order by sum(distance) desc
limit 10
;