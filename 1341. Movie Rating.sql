(select u.name as results
from movierating m inner join users u
on m.user_id = u.user_id
group by m.user_id
order by count(*) desc, u.name
limit 1)
union all
(select mv.title as results
from movierating m inner join movies mv
on m.movie_id=mv.movie_id
where date_format(created_at, '%Y-%m') = '2020-02'
group by m.movie_id
order by avg(m.rating) desc, mv.title limit 1)