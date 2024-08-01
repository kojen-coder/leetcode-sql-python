with temp as (
    select company_name, year, count(*) as cnt
    from car_launches
    where year = 2020 or year = 2019
    group by company_name, year
)

select t1.company_name, (t2.cnt - t1.cnt) as net_products
from temp t1 inner join temp t2 on t1.company_name = t2.company_name
and t1.year < t2.year

;