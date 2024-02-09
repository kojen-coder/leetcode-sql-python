select a.city_id, a.day, a.degree
from
(
select city_id, day, degree,
row_number() over(partition by city_id order by degree desc, day asc) as rnk
from weather
order by city_id
) a
where a.rnk = 1