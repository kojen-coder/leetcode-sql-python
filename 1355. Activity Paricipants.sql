select activity
from friends
group by activity
having count(*) > (select count(*) from friends group by activity order by count(*) limit 1)
and count(*) < (select count(*) from friends group by activity order by count(*) desc limit 1)
