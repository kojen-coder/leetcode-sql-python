with temp as (
    select
    date_format(request_date, '%Y-%m') as month,
    power(
    (sum(distance_to_travel) / sum(monetary_cost)) -
    lag(sum(distance_to_travel) / sum(monetary_cost)) over(order by date_format(request_date, '%Y-%m'))
    , 2) as sqr_err
    from uber_request_logs
    group by 1
    order by 1
)

select
    round(sqrt(avg(sqr_err)), 2) as RMSE
from temp
;
