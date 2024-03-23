select
login_date, count(*) as user_count
from(
    select
    user_id, min(activity_date) as login_date
    from traffic
    where activity = 'login'
    group by user_id
)a
where login_date between date_sub('2019-06-30', interval 90 day) and '2019-06-30'
group by login_date
