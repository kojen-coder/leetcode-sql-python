select
person1, person2, count(*) as call_count,
sum(duration) as total_duration
from(
select
case when from_id > to_id then to_id else from_id end as person1,
case when from_id < to_id then to_id else from_id end as person2,
duration
from calls
)a
group by 1, 2