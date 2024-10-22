select
noc, min(year) as year
from olympics_athletes_events
group by noc
order by year, noc

-- To get the NOC along with the minimum year, we can use window function, or in this case, min() should be sufficient