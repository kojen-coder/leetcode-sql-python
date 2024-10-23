with temp as(
    select
        distance_to_travel / monetary_cost as distance_per_dollar,
        date_format(request_date, '%Y-%m') as month_year,
        sum(distance_to_travel) over(partition by date_format(request_date, '%Y-%m')) /
        sum(monetary_cost) over(partition by date_format(request_date, '%Y-%m')) as avg_cost
    from uber_request_logs
)

select
    month_year, round(avg(abs(distance_per_dollar - avg_cost)), 2) as difference
from temp
group by 1