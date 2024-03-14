select sale_date, apples - oranges as diff
from(
    select
    sale_date,
    sum(case when fruit = 'apples' then sold_num else 0 end) apples,
    sum(case when fruit = 'oranges' then sold_num else 0 end) oranges
    from sales
    group by sale_date
)a
order by sale_date