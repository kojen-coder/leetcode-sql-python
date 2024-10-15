with temp as(
    select country,
    case when
        last_active_date >= date_sub('2024-01-31', interval 30 day) and
        sessions >= 5 and
        listening_hours >= 10
    then 1 else 0
    end as active_user
    from penetration_analysis
)

select
    country,
    round(sum(active_user) / count(*), 2) as penetration
from temp
group by 1

;