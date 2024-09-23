with temp as(
    select extract(year from start_date) as year,
    count(distinct end_date) / count(distinct start_date) as ratio
    from lyft_drivers
    group by extract(year from start_date)
)

select avg(ratio) as global_churn_rate
from temp
;