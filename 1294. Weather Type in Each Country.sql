select c.country_name, (case
    when avg(w.weather_state)<=15 then 'Cold'
    when avg(w.weather_state)>=25 then 'Hot'
    else 'Warm' END
    ) as weather_type
from countries c, weather w where c.country_id = w.country_id and
day between '2019-11-01' and '2019-11-30'
group by c.country_name